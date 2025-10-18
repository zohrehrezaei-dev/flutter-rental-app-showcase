# Architecture

This document describes the architecture and design patterns used in the Flutter Rental App Showcase.

## Overview

The application follows **Clean Architecture** principles to ensure separation of concerns, testability, and maintainability.

## Layers

### 1. Presentation Layer
- **Responsibilities**: UI components, widgets, and state management
- **Components**:
  - Pages/Screens
  - Widgets
  - View Models / BLoCs
  - UI State

### 2. Domain Layer
- **Responsibilities**: Business logic and entities
- **Components**:
  - Entities
  - Use Cases
  - Repository Interfaces
  - Domain Models

### 3. Data Layer
- **Responsibilities**: Data sources and repository implementations
- **Components**:
  - Repository Implementations
  - Data Models
  - API Services
  - Local Storage
  - Firebase Integration

## Design Patterns

- **Repository Pattern**: Abstracts data sources
- **Dependency Injection**: Manages dependencies
- **BLoC/Provider Pattern**: Manages state
- **Factory Pattern**: Creates complex objects
- **Observer Pattern**: Event handling and state updates

## Project Structure

```
lib/
├── core/
│   ├── constants/
│   ├── errors/
│   ├── utils/
│   └── widgets/
├── features/
│   ├── authentication/
│   ├── properties/
│   ├── bookings/
│   └── profile/
└── main.dart
```

## Key Principles

- **Single Responsibility**: Each class has one reason to change
- **Dependency Inversion**: Depend on abstractions, not concretions
- **Separation of Concerns**: Clear boundaries between layers
- **Testability**: Easy to write unit and integration tests
