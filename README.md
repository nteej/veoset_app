# VEO Asset Management Mobile Application

A Flutter mobile application for the VEO Asset Management System supporting role-based access for technicians, site managers, and general monitoring.

## 🚀 Features

### For Technicians
- ✅ Update maintenance tasks and status
- 📱 Receive real-time notifications
- 📅 View and manage schedules
- 🔧 Asset status management
- 📊 Asset health monitoring

### For Site Managers
- 📈 Real-time system monitoring
- 📊 Site performance dashboards
- 📋 Overview of maintenance activities
- 🔍 Asset health reports

### For General Users
- 📊 System overview and statistics
- 📈 Performance metrics
- 🏢 Site summaries

## 🏗️ Architecture

### State Management
- **Riverpod** for dependency injection and state management
- **Provider** pattern for reactive UI updates
- **Freezed** for immutable data models

### Navigation
- **GoRouter** for declarative routing
- Role-based navigation guards
- Deep linking support

### API Integration
- **HTTP** client for REST API communication
- **Dio** for advanced HTTP features
- **Retrofit** for type-safe API definitions

### Storage
- **SharedPreferences** for simple key-value storage
- **FlutterSecureStorage** for sensitive data (tokens)
- **Hive** for local database needs

## 🛠️ Setup Instructions

### Prerequisites
1. **Flutter SDK** (>=3.0.0)
2. **Dart SDK** (>=3.0.0)
3. **Android Studio** / **Xcode** for device testing
4. **Laravel Backend** running on localhost:8000

### Installation

1. **Install Flutter**
   ```bash
   # macOS
   brew install --cask flutter

   # Or download from https://flutter.dev/docs/get-started/install
   ```

2. **Clone and Setup**
   ```bash
   cd /Users/core/Documents/work/veoset_mobile
   flutter pub get
   ```

3. **Generate Code**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the App**
   ```bash
   # Run on connected device/emulator
   flutter run

   # Or specify platform
   flutter run -d ios
   flutter run -d android
   ```

### Backend Setup
Ensure the Laravel backend is running:
```bash
cd /Users/core/Documents/work/veoset
php artisan serve
```

The mobile app will connect to `http://localhost:8000/api`

## 📱 Development Guide

### Project Structure
```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── user.dart
│   ├── asset.dart
│   └── ...
├── services/                 # API and business logic
│   ├── api_service.dart
│   ├── storage_service.dart
│   └── ...
├── providers/                # Riverpod providers
│   ├── auth_provider.dart
│   ├── asset_provider.dart
│   └── ...
├── screens/                  # UI screens
│   ├── auth/
│   ├── dashboard/
│   ├── assets/
│   ├── maintenance/
│   └── notifications/
├── widgets/                  # Reusable UI components
├── utils/                    # Utilities and constants
│   ├── constants.dart
│   ├── app_theme.dart
│   └── ...
└── ...
```

### Adding New Features

1. **Create Model**
   ```dart
   @freezed
   class NewModel with _$NewModel {
     const factory NewModel({
       required int id,
       required String name,
     }) = _NewModel;

     factory NewModel.fromJson(Map<String, dynamic> json) =>
         _$NewModelFromJson(json);
   }
   ```

2. **Add API Endpoints**
   ```dart
   // In api_service.dart
   Future<NewModel> getNewModel(String token, int id) async {
     final response = await _client.get(
       Uri.parse('$baseUrl/new-model/$id'),
       headers: _headersWithAuth(token),
     );

     final data = await _handleResponse(response);
     return NewModel.fromJson(data);
   }
   ```

3. **Create Provider**
   ```dart
   final newModelProvider = StateNotifierProvider<NewModelNotifier, AsyncValue<NewModel>>((ref) {
     return NewModelNotifier(ref.read(apiServiceProvider));
   });
   ```

4. **Build UI Screen**
   ```dart
   class NewModelScreen extends ConsumerWidget {
     @override
     Widget build(BuildContext context, WidgetRef ref) {
       final newModelAsync = ref.watch(newModelProvider);

       return newModelAsync.when(
         data: (model) => YourUI(model),
         loading: () => CircularProgressIndicator(),
         error: (error, stack) => ErrorWidget(error),
       );
     }
   }
   ```

### Code Generation
Run this whenever you modify models or API definitions:
```bash
dart run build_runner build --delete-conflicting-outputs
```

### Testing
```bash
# Run tests
flutter test

# Run integration tests
flutter test integration_test/
```

## 🔐 Authentication Flow

1. **Login Screen** - User enters credentials
2. **API Call** - Send to `/api/auth/login`
3. **Token Storage** - Store securely with FlutterSecureStorage
4. **Auto-redirect** - Navigate to dashboard based on role
5. **Token Refresh** - Automatic token refresh on expiry

### User Roles & Permissions

| Role | Permissions |
|------|-------------|
| **VEO Admin** | Full system access, manage all assets, view all reports |
| **Site Manager** | Site-specific monitoring, view reports, manage site assets |
| **Maintenance Staff** | Update maintenance, view assigned tasks, notifications |
| **Customer** | View own assets, read-only reports |

## 📊 API Documentation

API documentation is available at: `http://localhost:8000/api/documentation`

### Key Endpoints

#### Authentication
- `POST /api/auth/login` - User login
- `POST /api/auth/logout` - User logout
- `GET /api/auth/user` - Get current user
- `POST /api/auth/refresh` - Refresh token

#### Dashboard
- `GET /api/dashboard/overview` - Dashboard overview
- `GET /api/dashboard/statistics` - Statistics by period

#### Assets
- `GET /api/assets` - List assets (role-filtered)
- `GET /api/assets/{id}` - Asset details
- `PUT /api/assets/{id}/status` - Update asset status
- `GET /api/assets/{id}/health-history` - Health history

#### Maintenance
- `GET /api/maintenance/tasks` - List tasks
- `PUT /api/maintenance/tasks/{id}/status` - Update task
- `POST /api/maintenance/tasks` - Create task
- `GET /api/maintenance/schedule` - Get schedule

#### Notifications
- `GET /api/notifications` - List notifications
- `PUT /api/notifications/{id}/read` - Mark as read
- `PUT /api/notifications/read-all` - Mark all as read

## 🎨 UI/UX Guidelines

### Design System
- **Material Design 3** components
- **Inter** font family
- **Role-based color schemes**
- **Responsive design** for tablets

### Colors
- **Primary**: Blue (#2196F3)
- **Success**: Green (#4CAF50)
- **Warning**: Orange (#FF9800)
- **Error**: Red (#F44336)
- **Info**: Purple (#9C27B0)

### Components
- **Status badges** with role-based colors
- **Health score indicators** with color coding
- **Interactive charts** with FL Chart
- **Pull-to-refresh** for data updates
- **Infinite scroll** for large lists

## 🚀 Deployment

### Android
```bash
flutter build apk --release
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
flutter build ipa --release
```

### Testing on Device
```bash
# Install on connected device
flutter install

# Or run in debug mode
flutter run --debug
```

## 🐛 Troubleshooting

### Common Issues

1. **Build Runner Conflicts**
   ```bash
   flutter packages pub run build_runner clean
   dart run build_runner build --delete-conflicting-outputs
   ```

2. **API Connection Issues**
   - Ensure backend is running on `localhost:8000`
   - Check network permissions in `android/app/src/main/AndroidManifest.xml`
   - For iOS simulator, use `127.0.0.1` instead of `localhost`

3. **Code Generation Issues**
   ```bash
   flutter clean
   flutter pub get
   dart run build_runner build --delete-conflicting-outputs
   ```

## 📞 Support

For technical support:
- **Backend API**: See Laravel application documentation
- **Mobile App**: Check this README and Flutter documentation
- **Issues**: Create tickets in the project repository

---

**🎉 Ready to build the future of asset management!**