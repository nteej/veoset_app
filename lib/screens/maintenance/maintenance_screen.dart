import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/maintenance_task.dart';
import '../../providers/maintenance_provider.dart';
import '../../widgets/common/error_widget.dart';
import '../../widgets/common/loading_widget.dart';
import '../../widgets/maintenance/task_card.dart';
import '../../widgets/maintenance/task_filter_bar.dart';
import '../../widgets/maintenance/task_stats_bar.dart';

class MaintenanceScreen extends ConsumerStatefulWidget {
  const MaintenanceScreen({super.key});

  @override
  ConsumerState<MaintenanceScreen> createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends ConsumerState<MaintenanceScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';
  String? _selectedPriority;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final maintenanceTasksAsync = ref.watch(maintenanceTasksProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Maintenance Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              // TODO: Navigate to schedule view
            },
            tooltip: 'Schedule View',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(maintenanceTasksProvider);
            },
            tooltip: 'Refresh',
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'All Tasks'),
            Tab(text: 'Pending'),
            Tab(text: 'In Progress'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search tasks...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: theme.colorScheme.surfaceContainerHighest,
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),

          // Filter Bar
          TaskFilterBar(
            selectedPriority: _selectedPriority,
            onPriorityChanged: (priority) {
              setState(() {
                _selectedPriority = priority;
              });
            },
          ),

          // Tasks Content
          Expanded(
            child: maintenanceTasksAsync.when(
              loading: () => const LoadingWidget(message: 'Loading maintenance tasks...'),
              error: (error, stackTrace) => ErrorRetryWidget(
                message: 'Failed to load maintenance tasks',
                onRetry: () => ref.invalidate(maintenanceTasksProvider),
              ),
              data: (tasks) {
                return TabBarView(
                  controller: _tabController,
                  children: [
                    _buildTasksList(tasks, null),
                    _buildTasksList(tasks, 'pending'),
                    _buildTasksList(tasks, 'in_progress'),
                    _buildTasksList(tasks, 'completed'),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Navigate to create task screen
          _showCreateTaskDialog(context);
        },
        icon: const Icon(Icons.add),
        label: const Text('New Task'),
      ),
    );
  }

  Widget _buildTasksList(List<MaintenanceTask> allTasks, String? statusFilter) {
    final filteredTasks = _filterTasks(allTasks, statusFilter);

    if (filteredTasks.isEmpty) {
      return _buildEmptyState(context, statusFilter);
    }

    return Column(
      children: [
        // Stats Bar
        TaskStatsBar(
          totalTasks: filteredTasks.length,
          pendingTasks: filteredTasks.where((t) => t.status == 'pending').length,
          inProgressTasks: filteredTasks.where((t) => t.status == 'in_progress').length,
          completedTasks: filteredTasks.where((t) => t.status == 'completed').length,
          overdueTasks: filteredTasks.where((t) => t.isOverdue).length,
        ),

        // Tasks List
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(maintenanceTasksProvider);
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredTasks.length,
              itemBuilder: (context, index) {
                final task = filteredTasks[index];
                return TaskCard(
                  task: task,
                  onTap: () => _navigateToTaskDetails(context, task),
                  onStatusUpdate: (newStatus) => _updateTaskStatus(task.id, newStatus),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  List<MaintenanceTask> _filterTasks(List<MaintenanceTask> tasks, String? statusFilter) {
    return tasks.where((task) {
      final matchesSearch = _searchQuery.isEmpty ||
          task.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          (task.description?.toLowerCase().contains(_searchQuery.toLowerCase()) ?? false);

      final matchesPriority = _selectedPriority == null || task.priority == _selectedPriority;

      final matchesStatus = statusFilter == null || task.status == statusFilter;

      return matchesSearch && matchesPriority && matchesStatus;
    }).toList()
      ..sort((a, b) {
        // Sort by priority first, then by due date
        final priorityOrder = {'emergency': 0, 'high': 1, 'medium': 2, 'low': 3};
        final aPriority = priorityOrder[a.priority] ?? 4;
        final bPriority = priorityOrder[b.priority] ?? 4;

        if (aPriority != bPriority) {
          return aPriority.compareTo(bPriority);
        }

        if (a.dueDate != null && b.dueDate != null) {
          return a.dueDate!.compareTo(b.dueDate!);
        }

        return a.createdAt?.compareTo(b.createdAt ?? DateTime.now()) ?? 0;
      });
  }

  Widget _buildEmptyState(BuildContext context, String? statusFilter) {
    final theme = Theme.of(context);
    final statusName = statusFilter?.replaceAll('_', ' ') ?? 'tasks';

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.assignment_outlined,
            size: 64,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          Text(
            'No ${statusName.toUpperCase()} Found',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _searchQuery.isNotEmpty || _selectedPriority != null
                ? 'Try adjusting your filters to see more results'
                : statusFilter == null
                    ? 'Start by creating your first maintenance task'
                    : 'No $statusName at the moment',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            textAlign: TextAlign.center,
          ),
          if (statusFilter == null && _searchQuery.isEmpty && _selectedPriority == null) ...[
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => _showCreateTaskDialog(context),
              icon: const Icon(Icons.add),
              label: const Text('Create Your First Task'),
            ),
          ],
        ],
      ),
    );
  }

  void _navigateToTaskDetails(BuildContext context, MaintenanceTask task) {
    // TODO: Navigate to task details screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Task details for ${task.title} - Coming soon')),
    );
  }

  void _updateTaskStatus(int taskId, String newStatus) async {
    try {
      await ref.read(maintenanceProvider.notifier).updateTaskStatus(
            taskId,
            newStatus,
            notes: 'Status updated via mobile app',
          );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Task status updated successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update status: $e')),
        );
      }
    }
  }

  void _showCreateTaskDialog(BuildContext context) {
    // TODO: Show create task dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Create task functionality - Coming soon')),
    );
  }
}