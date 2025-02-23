## SimuBank Application

### Overview
SimuBank is a mobile banking application built using Flutter (Channel stable, 3.27.0). This document provides an architectural overview of the application, including the libraries used and their purposes. Additionally, it includes setup commands and a test account for easy testing of the application.

### Libraries Used

1. **Riverpod**
   - **Purpose**: State management.
   - **Reason**: Offers a robust and scalable solution for managing state in a Flutter application, with support for dependency injection and reactive programming.

2. **Dio**
   - **Purpose**: HTTP client for API requests.
   - **Reason**: Provides powerful features such as interceptors, global configuration, FormData, request cancellation, file downloading, and timeout handling.

3. **Infinite Scroll Pagination**
   - **Purpose**: Pagination for lists.
   - **Reason**: Simplifies the implementation of infinite scrolling and pagination in list views, which is essential for displaying large sets of data efficiently.

4. **Auto Route**
   - **Purpose**: Routing and navigation.
   - **Reason**: Provides a declarative way to define routes and manage navigation in the application, making it easier to handle complex navigation scenarios.

5. **Easy Localization**
   - **Purpose**: Localization.
   - **Reason**: Simplifies the process of localizing the application by providing tools to manage translations and switch between languages.

6. **Flutter Riverpod Annotation**
   - **Purpose**: Code generation for Riverpod.
   - **Reason**: Enhances the developer experience by generating boilerplate code for Riverpod providers, reducing the amount of manual coding required.

7. **Freezed**
   - **Purpose**: Code generation for immutable classes.
   - **Reason**: Simplifies the creation of immutable data classes and union types, reducing boilerplate code and enhancing code maintainability.

### Architecture

The application follows a modular architecture with a clear separation of concerns. The main modules include:

- **Data Layer**: Handles data fetching and storage. Uses Dio for API requests and Riverpod for state management.
- **Domain Layer**: Contains business logic and domain models.
- **Presentation Layer**: Manages the UI and user interactions. Uses Flutter widgets and Riverpod for state management.

### Setup Commands

To set up the project, use the following commands:

1. **flutter pub get**
   - **Purpose**: Fetches all the dependencies listed in the `pubspec.yaml` file.
   - **Reason**: Ensures that all required packages are installed and available for the project.

2. **dart run build_runner build**
   - **Purpose**: Runs the code generator to create necessary files for packages like `freezed` and `riverpod`.
   - **Reason**: Automates the generation of boilerplate code, ensuring that the project is up-to-date with the latest code changes.

3. **flutter pub run easy_localization:generate --source-dir ./assets/translations -f keys -o locale_keys.g.dart**
   - **Purpose**: Generates localization keys from the translation files.
   - **Reason**: Simplifies the process of accessing localized strings in the application by generating a Dart file with all the keys.

4. **fluttergen -c pubspec.yaml**
   - **Purpose**: Generates code for accessing assets and fonts defined in the `pubspec.yaml` file.
   - **Reason**: Provides a type-safe way to access assets and fonts, reducing the risk of runtime errors due to incorrect asset paths.

### Test Account

To test the application, you can use the following test account:

- **Email**: test@example.com
- **Password**: Any password can be used