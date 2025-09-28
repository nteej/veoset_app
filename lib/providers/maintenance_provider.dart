import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/maintenance_task.dart';
import '../services/api_service.dart';
import 'auth_provider.dart';

final maintenanceProvider = StateNotifierProvider<MaintenanceNotifier, MaintenanceState>((ref) {
  return MaintenanceNotifier(
    ref.read(apiServiceProvider),
    ref.read(authProvider.notifier),
  );
});

final maintenanceTasksProvider = FutureProvider<List<MaintenanceTask>>((ref) async {
  final authState = ref.watch(authProvider);
  if (!authState.isAuthenticated || authState.token == null) {
    throw Exception('Not authenticated');
  }

  final maintenanceNotifier = ref.read(maintenanceProvider.notifier);
  return maintenanceNotifier.getTasks();
});

final maintenanceTaskDetailsProvider = FutureProvider.family<MaintenanceTask, int>((ref, taskId) async {
  final authState = ref.watch(authProvider);
  if (!authState.isAuthenticated || authState.token == null) {
    throw Exception('Not authenticated');
  }

  final maintenanceNotifier = ref.read(maintenanceProvider.notifier);
  return maintenanceNotifier.getTaskDetails(taskId);
});

final maintenanceScheduleProvider = FutureProvider.family<MaintenanceSchedule, DateTime>((ref, date) async {
  final authState = ref.watch(authProvider);
  if (!authState.isAuthenticated || authState.token == null) {
    throw Exception('Not authenticated');
  }

  final maintenanceNotifier = ref.read(maintenanceProvider.notifier);
  return maintenanceNotifier.getSchedule(date);
});

class MaintenanceState {
  final List<MaintenanceTask> tasks;
  final bool isLoading;
  final String? error;
  final Map<int, MaintenanceTask> taskCache;
  final Map<String, MaintenanceSchedule> scheduleCache;

  const MaintenanceState({
    this.tasks = const [],
    this.isLoading = false,
    this.error,
    this.taskCache = const {},
    this.scheduleCache = const {},
  });

  MaintenanceState copyWith({
    List<MaintenanceTask>? tasks,
    bool? isLoading,
    String? error,
    Map<int, MaintenanceTask>? taskCache,
    Map<String, MaintenanceSchedule>? scheduleCache,
  }) {
    return MaintenanceState(
      tasks: tasks ?? this.tasks,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      taskCache: taskCache ?? this.taskCache,
      scheduleCache: scheduleCache ?? this.scheduleCache,
    );
  }
}

class MaintenanceNotifier extends StateNotifier<MaintenanceState> {
  final ApiService _apiService;
  final AuthNotifier _authNotifier;

  MaintenanceNotifier(this._apiService, this._authNotifier) : super(const MaintenanceState());

  Future<List<MaintenanceTask>> getTasks({
    String? status,
    String? priority,
    bool forceRefresh = false,
  }) async {
    if (!forceRefresh && state.tasks.isNotEmpty) {
      return state.tasks;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      final token = _authNotifier.currentToken;
      if (token == null) throw Exception('No authentication token');

      final response = await _apiService.getMaintenanceTasks(
        token,
        status: status,
        priority: priority,
      );

      final tasks = response.map((json) => MaintenanceTask.fromJson(json)).toList();

      state = state.copyWith(
        tasks: tasks,
        isLoading: false,
        error: null,
      );

      return tasks;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  Future<MaintenanceTask> getTaskDetails(int taskId, {bool forceRefresh = false}) async {
    if (!forceRefresh && state.taskCache.containsKey(taskId)) {
      return state.taskCache[taskId]!;
    }

    try {
      final token = _authNotifier.currentToken;
      if (token == null) throw Exception('No authentication token');

      final response = await _apiService.getMaintenanceTask(token, taskId);
      final task = MaintenanceTask.fromJson(response);

      state = state.copyWith(
        taskCache: {...state.taskCache, taskId: task},
      );

      return task;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  Future<MaintenanceSchedule> getSchedule(DateTime date, {bool forceRefresh = false}) async {
    final dateKey = date.toIso8601String().split('T')[0];

    if (!forceRefresh && state.scheduleCache.containsKey(dateKey)) {
      return state.scheduleCache[dateKey]!;
    }

    try {
      final token = _authNotifier.currentToken;
      if (token == null) throw Exception('No authentication token');

      final response = await _apiService.getMaintenanceSchedule(token, date: date);
      final schedule = MaintenanceSchedule.fromJson(response);

      state = state.copyWith(
        scheduleCache: {...state.scheduleCache, dateKey: schedule},
      );

      return schedule;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  Future<MaintenanceTask> createTask({
    required int assetId,
    required String title,
    String? description,
    required String priority,
    DateTime? dueDate,
  }) async {
    try {
      final token = _authNotifier.currentToken;
      if (token == null) throw Exception('No authentication token');

      final response = await _apiService.createMaintenanceTask(
        token,
        assetId: assetId,
        title: title,
        description: description,
        priority: priority,
        dueDate: dueDate,
      );

      final task = MaintenanceTask.fromJson(response);

      // Refresh tasks list to include new task
      await getTasks(forceRefresh: true);

      return task;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  Future<void> updateTaskStatus(
    int taskId,
    String status, {
    String? notes,
    String? completionNotes,
  }) async {
    try {
      final token = _authNotifier.currentToken;
      if (token == null) throw Exception('No authentication token');

      await _apiService.updateTaskStatus(
        token,
        taskId,
        status,
        notes: notes,
        completionNotes: completionNotes,
      );

      // Refresh task details after status update
      await getTaskDetails(taskId, forceRefresh: true);

      // Refresh tasks list to update overview
      await getTasks(forceRefresh: true);

    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void clearCache() {
    state = const MaintenanceState();
  }

  // Helper getters
  List<MaintenanceTask> get pendingTasks =>
      state.tasks.where((task) => task.status == 'pending').toList();

  List<MaintenanceTask> get inProgressTasks =>
      state.tasks.where((task) => task.status == 'in_progress').toList();

  List<MaintenanceTask> get completedTasks =>
      state.tasks.where((task) => task.status == 'completed').toList();

  List<MaintenanceTask> get overdueTasks =>
      state.tasks.where((task) => task.isOverdue).toList();

  List<MaintenanceTask> get todayTasks =>
      state.tasks.where((task) => task.isDueToday).toList();

  List<MaintenanceTask> get upcomingTasks =>
      state.tasks.where((task) => task.isDueSoon).toList();

  List<MaintenanceTask> get emergencyTasks =>
      state.tasks.where((task) => task.priority == 'emergency').toList();

  List<MaintenanceTask> get highPriorityTasks =>
      state.tasks.where((task) => task.priority == 'high').toList();

  int get totalTasks => state.tasks.length;

  int get activeTasks => pendingTasks.length + inProgressTasks.length;

  double get completionRate {
    if (state.tasks.isEmpty) return 0.0;
    return completedTasks.length / state.tasks.length;
  }
}