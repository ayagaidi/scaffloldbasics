# Scaffold Basics

A modern Flutter learning project that demonstrates how the most common `Scaffold` building blocks work together in a small, interactive Material 3 application.

## Highlights

- Material 3 theme
- AppBar with actions
- Drawer navigation
- Bottom `NavigationBar`
- Cards and responsive scrolling content
- Text input with SnackBar feedback
- Floating action button with live state updates
- About dialog
- Widget tests for navigation and interactions

## Tech stack

- Flutter 3+
- Dart 3+
- Material 3
- Flutter Test

## What the app demonstrates

The project is intentionally small and focused. It shows practical examples of:

- structuring a Flutter application entry point
- composing a page with `Scaffold`
- moving between sections with a drawer and bottom navigation
- managing simple UI state
- handling text input
- showing user feedback with `SnackBar`
- writing widget tests for real interactions

## Project structure

```text
lib/
├── main.dart       # Application entry point
└── myapp.dart      # App theme, scaffold UI, navigation and interactions

test/
└── widget_test.dart # Widget interaction tests
```

## Getting started

1. Install a recent Flutter SDK and verify it:

   ```bash
   flutter doctor
   ```

2. Clone the repository and enter the project directory.

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```

5. Run the tests:

   ```bash
   flutter test
   ```

## Learning goals

This repository is designed as a compact reference for developers learning Flutter UI composition. It starts from the basic `Scaffold` concept and demonstrates how navigation, content, actions, forms, and feedback can be combined in one clean example.

## Author

Maintained by [Aya Aljaidi](https://github.com/ayagaidi).
