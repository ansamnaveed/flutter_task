## 🛠 Dependencies Used & Why

### Core Dependencies
- **flutter**: The Flutter SDK framework for cross-platform mobile development
- **cupertino_icons**: ^1.0.8 - Provides iOS-style icons for consistent UI design

### State Management
- **get**: ^4.7.2 - Used for state management, dependency injection, and navigation. Provides a simple and powerful solution for managing app state without boilerplate code.

### UI & Styling
- **google_fonts**: ^6.3.2 - Used for custom typography with Mulish font family, providing a modern and readable text appearance throughout the app.
- **flutter_svg**: ^2.2.1 - Used for rendering SVG icons and graphics, ensuring crisp and scalable icons across all screen densities.

### Utilities
- **intl**: ^0.20.2 - Used for internationalization and date/time formatting, enabling proper localization and date display functionality.

## 📁 Project Structure

```
lib/
├── controllers/                     # Contains GetX controllers that manage the state and business logic for each feature module
│   ├── dashboard_controller.dart    # Main navigation controller
│   ├── mood_controller.dart         # Mood tracking logic
│   ├── nutrition_controller.dart    # Nutrition data management
│   └── plan_controller.dart         # Workout planning logic
├── models/                          # Defines data structures and models used throughout the application
│   ├── dashboard_model.dart         # Bottom navigation model
│   ├── mood_model.dart              # Mood tracking data structure
│   └── workout_model.dart           # Workout data model
├── utils/                           # Contains utility classes for colors, icons, images, and reusable text widgets
│   ├── app_colors.dart              # Color palette definitions
│   ├── app_icons.dart               # Icon asset paths
│   ├── app_images.dart              # Image asset paths
│   └── app_text.dart                # Custom text widget with styling
├── views/                           # Contains all UI screens and components, organized by feature modules
│   └── dashboard/                   # Main dashboard views
│       ├── dashboard.dart           # Main dashboard screen
│       └── views/                   # Individual feature screens
│           ├── mood/                # Mood tracking interface
│           │   ├── mood.dart        # Main mood screen
│           │   └── components/      # Mood-specific widgets
│           ├── nutrition/           # Nutrition tracking interface
│           │   ├── nutrition.dart   # Main nutrition screen
│           │   └── components/      # Nutrition-specific widgets
│           └── plan/                # Workout planning interface
│               ├── plan.dart        # Main plan screen
│               └── components/      # Plan-specific widgets
└── main.dart                        # App entry point and configuration
```

## 🖼 App Screenshots

[View All Screenshots](https://github.com/username/project-name/tree/main/screenshots)

## 🎥 App Video

[Watch App Demo Video](https://drive.google.com/file/d/1w5134d2ojg4CQ9FIUUulocI5dNAS5lPy/view?usp=sharing)

## 📱 App APK

[Download APK](https://github.com/username/project-name/releases/download/v1.0/app-release.apk)
