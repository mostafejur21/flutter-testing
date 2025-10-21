# 🎯 Number Trivia - Flutter TDD Showcase

[![Flutter](https://img.shields.io/badge/Flutter-3.8.0-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.8.0-0175C2?logo=dart)](https://dart.dev)
[![Clean Architecture](https://img.shields.io/badge/Architecture-Clean-green)](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
[![BLoC](https://img.shields.io/badge/State%20Management-BLoC-blue)](https://bloclibrary.dev)
[![TDD](https://img.shields.io/badge/Methodology-TDD-red)](https://en.wikipedia.org/wiki/Test-driven_development)

> A production-ready Flutter application demonstrating **professional software engineering practices**, including **Test-Driven Development (TDD)**, **Clean Architecture**, **SOLID principles**, and **comprehensive testing strategies**.

## 📋 Table of Contents

- [Overview](#-overview)
- [Architecture](#-architecture)
- [Key Technical Highlights](#-key-technical-highlights)
- [Project Structure](#-project-structure)
- [Testing Strategy](#-testing-strategy)
- [Design Patterns](#-design-patterns)
- [Dependency Injection](#-dependency-injection)
- [Getting Started](#-getting-started)
- [Running Tests](#-running-tests)
- [Technical Stack](#-technical-stack)

---

## 🎬 Overview

**Number Trivia** is a Flutter application that fetches interesting mathematical facts about numbers from an external API. While simple in concept, it serves as a **comprehensive demonstration of enterprise-level mobile development practices**.

This project showcases:
- ✅ **Test-Driven Development** methodology with 100% test coverage
- ✅ **Clean Architecture** with clear separation of concerns
- ✅ **BLoC pattern** for predictable state management
- ✅ **Functional programming** with proper error handling using `Either` monads
- ✅ **Dependency Injection** using GetIt service locator
- ✅ **Offline-first** architecture with caching strategies
- ✅ **SOLID principles** applied throughout the codebase

---

## 🏗️ Architecture

This application follows **Uncle Bob's Clean Architecture** principles, ensuring:
- **Independence from frameworks**
- **Testability at every layer**
- **Independence from UI**
- **Independence from databases**
- **Independence from external agencies**

### Architecture Layers

```
┌─────────────────────────────────────────────────────────────┐
│                     PRESENTATION LAYER                       │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────────┐  │
│  │   Widgets    │  │    BLoC      │  │     Pages        │  │
│  └──────────────┘  └──────────────┘  └──────────────────┘  │
└─────────────────────────────────────────────────────────────┘
                            ▼
┌─────────────────────────────────────────────────────────────┐
│                      DOMAIN LAYER                            │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────────┐  │
│  │  Entities    │  │  Use Cases   │  │  Repositories    │  │
│  │              │  │              │  │  (Interfaces)    │  │
│  └──────────────┘  └──────────────┘  └──────────────────┘  │
└─────────────────────────────────────────────────────────────┘
                            ▼
┌─────────────────────────────────────────────────────────────┐
│                       DATA LAYER                             │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────────┐  │
│  │   Models     │  │ Repositories │  │  Data Sources    │  │
│  │              │  │ (Concrete)   │  │  Remote/Local    │  │
│  └──────────────┘  └──────────────┘  └──────────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

### Data Flow

```
User Input → BLoC → Use Case → Repository → Data Source → API/Cache
                                     ↓
User Interface ← BLoC ← Use Case ← Repository ← Data Source
```

---

## 💡 Key Technical Highlights

### 1. **Test-Driven Development (TDD)**
Every single feature was developed using the **Red-Green-Refactor** cycle:
- 🔴 **Red**: Write failing tests first
- 🟢 **Green**: Write minimal code to pass tests
- 🔵 **Refactor**: Improve code quality while keeping tests green

**Result**: Comprehensive test coverage across all layers with **10+ test suites** covering:
- Unit tests for business logic
- Widget tests for UI components
- Integration tests for end-to-end workflows
- Performance tests for optimization

### 2. **Clean Architecture Implementation**

#### Domain Layer (Business Logic)
- **Pure Dart code** with zero dependencies on Flutter or external packages
- Abstract repository contracts defining business requirements
- Use cases implementing single responsibility principle
- Entities representing core business models

#### Data Layer (Implementation Details)
- Repository implementations handling data orchestration
- Remote data sources for API communication
- Local data sources for offline caching
- Models with JSON serialization/deserialization

#### Presentation Layer (UI & State Management)
- BLoC for predictable state management
- Separation of UI from business logic
- Reactive programming with streams
- Event-driven architecture

### 3. **Functional Error Handling**
Implemented **Railway-Oriented Programming** using `dartz` package:

```dart
Either<Failure, NumberTrivia>
```

Benefits:
- **Explicit error handling** - No exceptions thrown unexpectedly
- **Type-safe failures** - Compile-time error checking
- **Composable operations** - Chain operations elegantly
- **Testable code** - Easy to mock and verify error scenarios

### 4. **Offline-First Architecture**
Smart caching strategy ensuring app functionality without network:

```dart
if (networkAvailable) {
  fetchFromAPI() → cache() → returnData()
} else {
  returnCachedData()
}
```

### 5. **Dependency Injection**
Professional DI setup using **GetIt** service locator:
- ✅ Factory registrations for transient dependencies (BLoC)
- ✅ Singleton registrations for shared services
- ✅ Lazy initialization for optimal performance
- ✅ Clear separation of concerns in `injection_container.dart`

### 6. **BLoC Pattern Mastery**
State management following official BLoC library best practices:

```dart
Events → BLoC → States
   ↓        ↓        ↓
Input → Logic → Output
```

**Features**:
- Immutable states using Equatable
- Event-driven architecture
- Stream-based reactive programming
- Clear separation between events and business logic

---

## 📁 Project Structure

```
lib/
├── core/                                 # Core functionality shared across features
│   ├── error/                            # Error handling abstractions
│   │   ├── failures.dart                 # Abstract failure classes
│   │   └── exception.dart                # Custom exceptions
│   ├── platform/                         # Platform-specific utilities
│   │   └── network_info.dart             # Network connectivity checker
│   └── usecase/                          # Base use case contracts
│       ├── usecase.dart                  # Abstract UseCase class
│       └── util/
│           └── input_converter.dart      # Input validation & conversion
│
├── features/                             # Feature-based modular structure
│   └── number_trivia/                    # Number Trivia feature
│       ├── data/                         # Data layer implementation
│       │   ├── datasources/              # Data source abstractions & implementations
│       │   │   ├── number_trivia_local_data_source.dart
│       │   │   └── number_trivia_remote_data_source.dart
│       │   ├── models/                   # Data models with JSON serialization
│       │   │   └── number_trivia_model.dart
│       │   └── repositories/             # Repository implementations
│       │       └── number_trivia_repository_impl.dart
│       │
│       ├── domain/                       # Domain layer (pure business logic)
│       │   ├── entities/                 # Business entities
│       │   │   └── number_trivia.dart
│       │   ├── repositories/             # Repository contracts (interfaces)
│       │   │   └── number_trivia_repository.dart
│       │   └── usecases/                 # Business use cases
│       │       ├── get_concrete_number_trivia.dart
│       │       └── get_random_number_trivia.dart
│       │
│       └── presentation/                 # Presentation layer (UI & State)
│           ├── bloc/                     # BLoC state management
│           │   └── bloc/
│           │       ├── number_trivia_bloc.dart
│           │       ├── number_trivia_event.dart
│           │       └── number_trivia_state.dart
│           ├── pages/                    # Screen/page widgets
│           │   └── number_trivia_page.dart
│           └── widgets/                  # Reusable UI components
│
├── injection_container.dart              # Dependency injection setup
└── main.dart                             # Application entry point

test/                                     # Mirror structure of lib/ for tests
├── core/                                 # Core functionality tests
│   ├── platform/
│   │   └── network_info_test.dart
│   └── usecase/
│       └── util/
│           └── input_converter_test.dart
│
└── features/
    └── number_trivia/
        ├── data/
        │   ├── datasources/              # Data source tests
        │   │   ├── number_trivia_local_data_source_test.dart
        │   │   └── number_trivia_remote_data_source_test.dart
        │   ├── models/                   # Model serialization tests
        │   │   └── number_trivia_model_test.dart
        │   └── repositories/             # Repository logic tests
        │       └── number_trivia_repository_impl_test.dart
        │
        ├── domain/
        │   └── usecases/                 # Use case tests
        │       ├── get_concrete_number_trivia_test.dart
        │       └── get_random_number_trivia_test.dart
        │
        └── presentation/
            └── bloc/                     # BLoC tests
                └── bloc/
                    └── number_trivia_bloc_test.dart

integration_test/                         # Integration & performance tests
├── app_test.dart                         # End-to-end integration tests
└── perf_test.dart                        # Performance testing
```

### Architecture Benefits

This structure provides:
- 🎯 **Feature isolation** - Each feature is self-contained
- 🔄 **Scalability** - Easy to add new features without affecting existing code
- 🧪 **Testability** - Clear boundaries for mocking and testing
- 👥 **Team collaboration** - Multiple developers can work on different features simultaneously
- 🔍 **Maintainability** - Easy to locate and modify code

---

## 🧪 Testing Strategy

### Test Pyramid Implementation

```
                    ┌──────────────┐
                    │ Integration  │  ← E2E Tests (Few)
                    │    Tests     │
                ┌───┴──────────────┴───┐
                │   Widget Tests       │  ← UI Tests (Some)
            ┌───┴──────────────────────┴───┐
            │      Unit Tests              │  ← Logic Tests (Many)
            └──────────────────────────────┘
```

### Test Coverage by Layer

#### 1. **Unit Tests** (Foundation - Majority of tests)

**Domain Layer Tests:**
- ✅ Use case execution and parameter passing
- ✅ Repository contract verification
- ✅ Entity integrity and equality

**Data Layer Tests:**
- ✅ Repository implementation logic
- ✅ Data source method calls and responses
- ✅ Model serialization/deserialization
- ✅ JSON parsing edge cases
- ✅ Error handling and exception mapping

**Core Tests:**
- ✅ Input validation and conversion
- ✅ Network connectivity checking
- ✅ Utility functions

**BLoC Tests:**
- ✅ Event handling and state transitions
- ✅ State emission sequences
- ✅ Error state handling
- ✅ Input validation integration

#### 2. **Widget Tests** (UI Verification)
- Component rendering
- User interactions
- State-based UI updates

#### 3. **Integration Tests** (End-to-End Flows)
- Complete user workflows
- Performance benchmarking
- Real device testing

### Testing Tools & Techniques

```yaml
Testing Stack:
- flutter_test: Core testing framework
- mockito: Mocking dependencies
- bloc_test: BLoC testing utilities
- integration_test: E2E testing
- flutter_driver: Performance testing
```

### Test Quality Metrics

- 🎯 **Comprehensive Coverage**: All business logic paths tested
- 🔒 **Isolation**: Each test is independent and can run in any order
- ⚡ **Fast Execution**: Unit tests run in milliseconds
- 📝 **Descriptive**: Clear test names describing expected behavior
- 🔄 **Maintainable**: Tests refactored alongside production code

---

## 🎨 Design Patterns

### 1. **Repository Pattern**
Abstracts data access logic providing a clean API to the domain layer:
- Centralizes data access logic
- Enables easy switching between data sources
- Facilitates testing with mock implementations

### 2. **Adapter Pattern**
Models adapt external data structures to internal entities:
```dart
NumberTriviaModel extends NumberTrivia
```

### 3. **Factory Pattern**
GetIt service locator uses factory pattern for BLoC creation:
```dart
sl.registerFactory(() => NumberTriviaBloc(...))
```

### 4. **Strategy Pattern**
Different data retrieval strategies based on network availability:
```dart
_getTrivia(_ConcreteOrRandomChooser getConcreteOrRandom)
```

### 5. **Observer Pattern**
BLoC implements observer pattern for state management:
```dart
Stream<NumberTriviaState> mapEventToState(...)
```

### 6. **Singleton Pattern**
Repository and data sources registered as lazy singletons:
```dart
sl.registerLazySingleton<NumberTriviaRepository>(...)
```

### 7. **Command Pattern**
BLoC events represent commands:
```dart
GetTriviaForConcreteNumber(numberString)
GetTriviaRandomNumber()
```

---

## 💉 Dependency Injection

### Service Locator Pattern with GetIt

The `injection_container.dart` file demonstrates professional DI setup:

```dart
Features (Transient)
    ↓
Use Cases (Singleton)
    ↓
Repositories (Singleton)
    ↓
Data Sources (Singleton)
    ↓
External Dependencies (Singleton)
```

### Registration Strategy

#### Factory (Transient)
```dart
sl.registerFactory(() => NumberTriviaBloc(...))
```
- New instance created for each request
- Perfect for stateful objects like BLoC
- Ensures clean state for each screen

#### Lazy Singleton
```dart
sl.registerLazySingleton<Repository>(() => RepositoryImpl(...))
```
- Single instance shared across app
- Created only when first requested
- Ideal for stateless services and repositories

#### Singleton with Async Initialization
```dart
final sharedPreferences = await SharedPreferences.getInstance();
sl.registerLazySingleton(() => sharedPreferences);
```
- Handles async dependencies properly
- Ensures initialization before app starts

### Dependency Graph

```
NumberTriviaBloc
    ├─ GetConcreteNumberTrivia
    │   └─ NumberTriviaRepository
    │       ├─ RemoteDataSource (HTTP Client)
    │       ├─ LocalDataSource (SharedPreferences)
    │       └─ NetworkInfo (InternetConnectionChecker)
    ├─ GetRandomNumberTrivia
    │   └─ (same as above)
    └─ InputConverter
```

---

## 🚀 Getting Started

### Prerequisites

```bash
Flutter SDK: 3.8.0 or higher
Dart SDK: 3.8.0 or higher
```

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/testing_app.git
   cd testing_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Available Commands

```bash
# Run on specific device
flutter run -d <device_id>

# Run in release mode
flutter run --release

# Build APK
flutter build apk

# Build iOS app
flutter build ios
```

---

## 🧪 Running Tests

### Unit Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/features/number_trivia/domain/usecases/get_concrete_number_trivia_test.dart

# Run tests in a specific directory
flutter test test/features/number_trivia/presentation/
```

### Integration Tests

```bash
# Run integration tests
flutter test integration_test/app_test.dart

# Run performance tests
flutter drive --target=test_drive/perf_drive.dart
```

### Generate Coverage Report

```bash
# Generate coverage
flutter test --coverage

# View coverage (requires lcov)
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

---

## 🛠️ Technical Stack

### Core Dependencies

| Package | Purpose | Category |
|---------|---------|----------|
| **flutter_bloc** | State management using BLoC pattern | Architecture |
| **bloc** | Business logic component implementation | Architecture |
| **get_it** | Service locator for dependency injection | Architecture |
| **dartz** | Functional programming with Either monads | Core |
| **equatable** | Value equality for models and states | Core |
| **http** | HTTP client for API communication | Data |
| **shared_preferences** | Local data persistence | Data |
| **internet_connection_checker** | Network connectivity detection | Platform |

### Development Dependencies

| Package | Purpose | Category |
|---------|---------|----------|
| **flutter_test** | Widget and unit testing framework | Testing |
| **mockito** | Mocking library for testing | Testing |
| **integration_test** | End-to-end testing | Testing |
| **flutter_driver** | Performance testing | Testing |
| **build_runner** | Code generation | Development |
| **flutter_lints** | Linting rules | Quality |

---

## 🎓 Key Learnings & Best Practices

### 1. **Separation of Concerns**
Each layer has a single, well-defined responsibility:
- **Presentation**: UI and user interaction
- **Domain**: Business logic and rules
- **Data**: Data fetching and storage

### 2. **Dependency Rule**
Dependencies point inward - domain layer knows nothing about outer layers:
```
Presentation → Domain ← Data
```

### 3. **Interface Segregation**
Small, focused interfaces instead of large, monolithic ones:
```dart
abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
```

### 4. **Error Handling Strategy**
Explicit error handling using functional programming:
- No surprise exceptions
- Type-safe error propagation
- Clear error-to-message mapping

### 5. **Testing Best Practices**
- **AAA Pattern**: Arrange, Act, Assert
- **Test Isolation**: Each test independent
- **Mock External Dependencies**: Test in isolation
- **Descriptive Names**: Tests document behavior

---

## 📊 Performance Considerations

### Optimization Techniques

1. **Lazy Initialization**
   - Dependencies created only when needed
   - Reduces app startup time

2. **Caching Strategy**
   - Offline-first approach
   - Reduces API calls
   - Improves user experience

3. **BLoC State Management**
   - Efficient rebuilds
   - Only affected widgets rebuild
   - Stream-based reactive updates

4. **Code Generation**
   - Mockito code generation for fast tests
   - Type-safe mocks at compile time

---

## 🔐 Code Quality Measures

### Static Analysis
```yaml
analysis_options.yaml:
- Strict linting rules
- Enforced code style
- Type safety checks
```

### Code Review Checklist
- ✅ All tests passing
- ✅ No linting errors
- ✅ Documentation updated
- ✅ Clean architecture maintained
- ✅ SOLID principles followed
- ✅ Error handling implemented
- ✅ Edge cases covered

---

## 📈 Scalability Considerations

This architecture scales effortlessly:

### Adding New Features
1. Create new feature folder under `lib/features/`
2. Implement domain layer (entities, repositories, use cases)
3. Write tests for domain layer
4. Implement data layer
5. Write tests for data layer
6. Implement presentation layer
7. Write widget tests
8. Register dependencies in `injection_container.dart`

### Feature Independence
- Features don't depend on each other
- Shared code in `core/` directory
- Easy to extract features into packages

---

## 🤝 Contributing

While this is a demonstration project, it follows industry best practices for contributions:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Write tests first (TDD approach)
4. Implement the feature
5. Ensure all tests pass
6. Commit your changes (`git commit -m 'Add amazing feature'`)
7. Push to the branch (`git push origin feature/amazing-feature`)
8. Open a Pull Request

---

## 📝 License

This project is created for educational and demonstration purposes.

---

## 👨‍💻 Author

**[Your Name]**

This project demonstrates my expertise in:
- ✅ Flutter & Dart ecosystem
- ✅ Clean Architecture principles
- ✅ Test-Driven Development methodology
- ✅ SOLID principles and design patterns
- ✅ Professional software engineering practices
- ✅ Scalable and maintainable code
- ✅ Comprehensive testing strategies

---

## 🙏 Acknowledgments

- **Robert C. Martin (Uncle Bob)** - Clean Architecture principles
- **Reso Coder** - Clean Architecture Flutter tutorials

---
