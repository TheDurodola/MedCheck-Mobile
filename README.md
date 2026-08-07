# Medify Mobile (MedCheck) 💊📱

**Medify Mobile** (MedCheck) is a Flutter mobile application designed to fight counterfeit pharmaceutical products by empowering consumers and healthcare providers to verify medication authenticity in real time. By scanning or inputting verification codes attached to medicine packs or sachets, users receive immediate validation regarding product approval, batch details, and manufacturing legitimacy.

---

## 🌟 Key Features

- 🔐 **Secure User Authentication**: Complete Sign Up, Sign In, and onboarding flow with role-based access validation.
- 🔑 **Secure Token Storage**: Encrypted JWT authentication token persistence using `flutter_secure_storage`.
- 🔍 **Medication Verification**: Real-time validation of verification codes printed on pharmaceutical packs and sachets.
- ⚡ **Instant Status Feedback**: Displays batch info, verification status, or warning screens for unverified or invalid codes.
- 🌐 **Network Resilience**: Integrated offline awareness and connection status checking (`internet_connection_checker`).
- 🎨 **Modern Clean UI**: Material 3 design system with custom typography (Lato, Merriweather) and responsive dark/light modes.

---

## 🏗️ Architecture & Design Patterns

Medify Mobile strictly follows **Clean Architecture** combined with the **BLoC (Business Logic Component)** pattern to achieve modularity, testability, and clear separation of concerns:

```text
lib/
├── config/           # Application theme & visual configurations
├── core/             # Shared constants, network utilities, base usecases, custom widgets
├── features/         # Modular feature slices following Clean Architecture
│   ├── auth/         # Authentication domain (Data, Domain, Presentation)
│   └── home/         # Pack verification domain (Data, Domain, Presentation)
├── injection_container.dart  # Service Locator (GetIt) dependency injection setup
├── app.dart          # MaterialApp routing & global BlocProviders
└── main.dart         # Main entry point & platform initialization
```

Each feature slice contains three layers:
1. **Domain Layer**: Contains business logic (`Entities`, `Repository Interfaces`, `Use Cases`).
2. **Data Layer**: Manages API calls, JSON parsing, local database/secure storage (`Models`, `Data Sources`, `Repository Implementations`).
3. **Presentation Layer**: UI elements and reactive state management (`BLoC`, `Events`, `States`, `Screens`, `Widgets`).

---

## 🛠️ Tech Stack & Dependencies

- **Framework**: [Flutter](https://flutter.dev/) (Dart SDK `^3.10.7`)
- **State Management**: [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) & [`equatable`](https://pub.dev/packages/equatable)
- **Dependency Injection**: [`get_it`](https://pub.dev/packages/get_it)
- **Networking**: [`http`](https://pub.dev/packages/http) & [`internet_connection_checker`](https://pub.dev/packages/internet_connection_checker)
- **Secure Storage**: [`flutter_secure_storage`](https://pub.dev/packages/flutter_secure_storage)
- **Functional Programming**: [`dartz`](https://pub.dev/packages/dartz) (Either type for failure handling)
- **UI Components & Fonts**: [`google_fonts`](https://pub.dev/packages/google_fonts), [`animations`](https://pub.dev/packages/animations), [`fluttertoast`](https://pub.dev/packages/fluttertoast)

---

## 🚀 Getting Started

### Prerequisites

Ensure you have the following installed on your system:
- **Flutter SDK**: `>= 3.10.7` ([Install Guide](https://docs.flutter.dev/get-started/install))
- **Dart SDK**: Included with Flutter
- **Android Studio** or **VS Code** with Flutter/Dart extensions
- Android Emulator / iOS Simulator or a physical mobile device

### 1. Clone the Repository
```bash
git clone https://github.com/TheDurodola/Medify-Mobile.git
cd Medify-Mobile/medcheck
```

### 2. Install Dependencies
Run the following command to fetch all required packages:
```bash
flutter pub get
```

### 3. Backend Configuration
The app connects to a REST API backend. Modify the base URL in [`lib/core/constants/api_constants.dart`](file:///home/bolaji/Documents/GITHUB/Medify-Mobile/medcheck/lib/core/constants/api_constants.dart) to match your backend host:

```dart
class ApiConstants {
  static const String baseUrl = 'http://10.0.2.2:8080'; // 10.0.2.2 for Android Emulator, or your local server IP
  ...
}
```

---

## 📱 Running the Application

### Debug Mode
Run on an active emulator or connected device:
```bash
flutter run
```

### Run Tests
Execute unit and widget tests:
```bash
flutter test
```

### Static Code Analysis
Ensure code adherence to recommended lints:
```bash
flutter analyze
```

### Build Production APK / App Bundle
```bash
# Generate Android APK
flutter build apk --release

# Generate Android App Bundle
flutter build appbundle --release
```

---

## 📄 License

This project is proprietary software developed under the Medify platform.