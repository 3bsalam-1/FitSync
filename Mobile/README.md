# FitSync Mobile App

The **FitSync Mobile App** is a cross-platform application built with **Flutter**, designed to provide users with on-the-go access to their fitness data, workout plans, and health insights.

## 📱 Platform Support
*   **Android**: fully supported (min SDK 21)
*   **iOS**: fully supported (requires Xcode)

## 🛠 Technology Stack
*   **Framework**: Flutter SDK (Dart)
*   **State Management**: BLoC / Cubit (`flutter_bloc`)
*   **Authentication**: Firebase Auth, Google Sign-In
*   **Health Integration**: Health Connect API (`flutter_health_connect`)
*   **Charts**: Syncfusion Flutter Charts
*   **Notifications**: Flutter Local Notifications
*   **Networking**: HTTP

## 📂 Project Structure
```bash
Mobile/fitsync/
├── android/            # Android native code
├── ios/                # iOS native code
├── assets/             # Images, fonts, and icons
├── lib/
│   ├── logic/          # BLoC/Cubit state logic
│   ├── data/           # Repositories and data providers
│   ├── presentation/   # UI Screens and Widgets
│   │   ├── screens/    # Full page views
│   │   └── widgets/    # Reusable components
│   └── main.dart       # App entry point
└── pubspec.yaml        # Dependencies & Config
```

## 🚀 Getting Started

### Prerequisites
*   Flutter SDK (v3.16+)
*   Android Studio / Xcode
*   Physical Device or Emulator

### Installation
1.  Navigate to the mobile app directory:
    ```bash
    cd Mobile/fitsync
    ```
2.  Install dependencies:
    ```bash
    flutter pub get
    ```

### Configuration
*   **Firebase**: Ensure `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) are present in their respective directories if not already configured.
*   **Assets**: Run `flutter packages pub run flutter_launcher_icons:main` if you need to regenerate app icons.

### Running the App
*   **Debug Mode**:
    ```bash
    flutter run
    ```
*   **Profile Mode** (Performance testing):
    ```bash
    flutter run --profile
    ```

### Building for Release
*   **Android APK**:
    ```bash
    flutter build apk --release
    ```
*   **Android App Bundle (AAB)**:
    ```bash
    flutter build appbundle
    ```
*   **iOS** (Requires Mac):
    ```bash
    flutter build ios
    ```

## ✨ Key Features
*   **Workout Tracking**: Log exercises, sets, and reps.
*   **Diet Management**: Track calories and macronutrients.
*   **Health Sync**: Import steps and heart rate from Google Fit / Health Connect.
*   **Dark Mode**: Sleek UI with support for light and dark themes.
