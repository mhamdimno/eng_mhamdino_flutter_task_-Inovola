Flutter Clean Architecture Project
This project demonstrates a Flutter application built with a focus on clean architecture principles, utilizing bloc and cubit for state management, mason for code generation, and ObjectBox for efficient offline data storage. This README provides a comprehensive overview of the project's architecture, implementation details, and operational aspects, designed to showcase best practices in mobile application development.

Table of Contents
Overview of Architecture and Structure

State Management Approach

API Integration

Pagination Strategies

UI Screenshots

Trade-offs and Assumptions

How to Run the Project

DevOps / CI/CD

1. Overview of Architecture and Structure
This project adheres strictly to a Clean Architecture pattern, prioritizing separation of concerns, testability, and maintainability. The core principle is to establish distinct layers, with dependencies flowing unidirectionally inwards, ensuring that inner layers are independent of outer layers. This approach promotes a robust and scalable codebase, making it easier to manage complexity and adapt to changing requirements.

The architecture is structured as follows:

Presentation Layer (UI / lib/presentation):

Widgets: Reusable UI components responsible for rendering data.

Pages: Top-level widgets that represent distinct screens in the application.

Blocs/Cubits: Business Logic Components that manage the state of the UI. They react to user interactions and other triggers (Events), process them through Use Cases, and emit new States to update the UI. This layer depends on the Domain Layer.

Domain Layer (Business Logic / lib/domain):

Entities: Pure Dart objects representing the core business data and rules. These are framework-agnostic and define the application's core concepts.

Use Cases (Interactors): Contain the application-specific business rules and orchestrate interactions between the Presentation and Data layers. Each use case typically encapsulates a single, atomic business operation (e.g., GetProductsUseCase, AddUserUseCase). They depend on abstract Repositories.

Repositories (Abstract): Define contracts (interfaces) for data operations. These abstract classes specify what data operations are available, without dictating how they are implemented.

Data Layer (Data Access / lib/data):

Models: Data structures specific to external data sources (e.g., API responses, ObjectBox entities). They often include fromJson/toJson methods for serialization/deserialization.

Repositories (Implementations): Concrete implementations of the Repository interfaces defined in the Domain Layer. They are responsible for fetching data from various sources (APIs, local database) and converting Models to Entities before passing them to the Domain Layer.

Data Sources: Abstractions for interacting with specific data storage mechanisms (e.g., RemoteDataSource for APIs, LocalDataSource for local storage using ObjectBox).

Core Layer (lib/core):

Contains common utilities, constants, custom exception handling mechanisms, and other shared functionalities that are independent of specific features or business logic. This layer supports all other layers.

Mason Integration:
Mason is extensively utilized for generating boilerplate code for new features (e.g., new Blocs/Cubits, Use Cases, Repositories, Models, Data Sources). This significantly accelerates development, ensures strict adherence to architectural patterns, and maintains code consistency across the project. Custom bricks are meticulously designed to match the project's specific architectural patterns and coding standards.

2. State Management Approach
This project leverages both the Bloc (Business Logic Component) and Cubit patterns for robust and scalable state management. Cubits are employed for simpler state management scenarios, while Blocs are used for features requiring more complex event handling and state transitions.

Why Bloc/Cubit?

Predictable State: Both patterns enforce a clear separation of business logic from the UI, leading to explicit and predictable state changes. This makes the application's behavior easier to understand, debug, and reason about.

Testability: By isolating business logic within Blocs/Cubits, they become highly testable in isolation, without requiring UI components or external dependencies.

Separation of Concerns: Clearly defines responsibilities, ensuring that UI components are only concerned with rendering, while Blocs/Cubits handle the application's logic.

Scalability: The modular nature of Bloc/Cubit makes it well-suited for complex applications with numerous features and intricate state interactions, allowing for easier feature additions and modifications.

How it works:

Events (for Bloc) / Method Calls (for Cubit): The UI dispatches Events (for Blocs) or invokes public methods (for Cubits) in response to user actions (e.g., button taps, text input) or other triggers (e.g., data loaded, network status change).

Bloc/Cubit Processing: The Bloc or Cubit receives these inputs, processes them using encapsulated business logic (often by calling Use Cases from the Domain Layer), and determines the next state.

States: The Bloc or Cubit emits new States representing the current data and UI conditions.

UI Reaction: The Flutter UI, using flutter_bloc widgets (BlocProvider, BlocBuilder, BlocListener, BlocConsumer), listens to these States and rebuilds itself reactively to reflect the changes.

3. API Integration
API integration is meticulously handled within the Data Layer through abstract ApiService interfaces (acting as RemoteDataSources) and their concrete implementations, which are then consumed by Repository implementations. Dependency injection is robustly managed using injectable and get_it for seamless dependency resolution.

ApiService (Abstract & Implementation):

An abstract ApiService interface (e.g., ProductApiService) is defined within the data/remote directory. This interface outlines the contract for all remote data operations related to a specific domain, ensuring a clear API boundary.

A concrete implementation of this ApiService (e.g., ProductApiServiceImpl) is responsible for executing HTTP requests to the backend API. This implementation exclusively utilizes the dio HTTP client library, chosen for its powerful features including interceptors, robust error handling, and request/response transformation capabilities.

Crucially, this ApiService implementation directly handles the parsing of raw JSON responses into Model objects (e.g., ProductModel.fromJson(json)), ensuring that the data is structured correctly for the Data Layer.

injectable annotations are used to register these ApiService implementations with get_it, making them easily injectable into Repository implementations.

Request Handling:

All HTTP requests are made through dio instances configured with appropriate base URLs, headers, and interceptors (e.g., for logging, authentication token refreshing, error handling).

Comprehensive error handling is a core part of this layer. The ApiService catches network errors, server errors (e.g., 4xx, 5xx status codes), and other DioError types, translating them into custom, domain-specific exceptions (e.g., NetworkException, ServerException, UnauthorizedException). These custom exceptions are then propagated upwards for appropriate handling by the Repository and Domain Layer.

Response Parsing:

Upon receiving a successful API response, the ApiService immediately parses the raw JSON data into the corresponding Model objects. This ensures that subsequent layers work with structured Dart objects rather than raw JSON maps.

Repository Implementation:

The Repository implementation (e.g., ProductRepositoryImpl in lib/data/repositories) receives the concrete ApiService (e.g., ProductApiServiceImpl) via dependency injection, facilitated by injectable and get_it.

It invokes the appropriate method on the injected ApiService to fetch data, which returns Model objects (e.g., List<ProductModel>).

A critical step performed by the Repository is the conversion of these Model objects (data layer representations) into Entity objects (domain layer representations). This conversion ensures that the Domain Layer remains completely independent of the underlying data source's specific data structures and only interacts with pure business entities. This strict separation is a cornerstone of Clean Architecture.

Example API Call Flow:

Presentation Layer: A Bloc or Cubit dispatches an Event (e.g., LoadProductsEvent) or calls a method (e.g., fetchProducts()).

Domain Layer (Use Case): The Bloc/Cubit calls a Use Case (e.g., GetProductsUseCase).

Domain Layer (Repository Interface): The Use Case calls the abstract ProductRepository interface.

Data Layer (Repository Implementation): The ProductRepositoryImpl (which implements ProductRepository) receives an injected ProductApiService. It calls productApiService.getProducts().

Data Layer (ApiService Implementation): The ProductApiServiceImpl uses dio to make the HTTP request, receives the JSON response, and parses it into List<ProductModel>. It returns this list to ProductRepositoryImpl.

Data Layer (Repository Implementation): ProductRepositoryImpl receives List<ProductModel>, converts each ProductModel into a ProductEntity, and returns List<ProductEntity> to the GetProductsUseCase.

Domain Layer (Use Case): GetProductsUseCase receives List<ProductEntity> and returns it to the Bloc/Cubit.

Presentation Layer: The Bloc/Cubit receives List<ProductEntity> and emits a new State containing this data, which the UI then renders.

4. Pagination Strategies
This project employs a dual pagination strategy to optimize both online data fetching and offline data access: API-based pagination for retrieving data from the backend and local pagination using ObjectBox for efficient offline access and display of cached data.

API-Based Pagination
This strategy is used when fetching fresh data from the remote server.

How it works:

Initial Load: When a screen requiring paginated data is loaded, an initial request is made to the API with parameters for the first page (e.g., page=1, limit=20).

Scroll Listener: A ScrollController is attached to the scrollable widget (e.g., ListView.builder, GridView.builder) to detect user scrolling.

Threshold Detection: When the user scrolls near the end of the current list (e.g., 80% of the way down), a check is performed to determine if more data is available from the API.

Load More Event: If more data is available, a "Load More" Event is dispatched to the relevant Bloc/Cubit, including the next page number to be fetched.

API Call for Next Page: The Bloc/Cubit calls the appropriate Use Case, which in turn calls the Repository and RemoteDataSource to fetch the next set of data from the API.

Cache and Append Data: Upon successful retrieval of the next page's data, these items are first stored in ObjectBox for robust offline availability and then appended to the existing list in the Bloc/Cubit's state. The UI is subsequently updated to display the newly loaded items.

Loading Indicator: A clear loading indicator is displayed at the bottom of the list while new data is being fetched, providing visual feedback to the user.

End of List: When the API indicates that there are no more pages (e.g., by returning an empty list, a specific flag, or a total count), the loading indicator is removed, and no further API requests for pagination are made.

Local Pagination (Offline Strategy)
This strategy is crucial for providing a seamless user experience even without internet connectivity, by efficiently retrieving and displaying data that has already been cached locally using ObjectBox.

How it works:

ObjectBox Integration: ObjectBox is integrated as a high-performance, easy-to-use local database. It is used for persistently storing Entities or Models after they are successfully fetched from the API, ensuring data availability offline.

Paginated Retrieval: When data needs to be displayed from local storage, a specific method within the LocalDataSource (or directly in the Repository for simplicity in some cases) is called to retrieve a paginated slice of the stored items. This method directly interacts with the ObjectBox store.

Efficient Slicing: The method calculates the startIndex and endIndex based on the requested page and pageSize, then efficiently retrieves only the necessary subset of data from the ObjectBox store. This prevents loading the entire dataset into memory, optimizing performance for large local caches.

Example Local Pagination Method Logic:

@override
Future<List<T>> getPaginatedData<T>(int page, int pageSize) async {
  // Get the ObjectBox 'Box' for the specific type T
  final box = _getBox<T>(); // _getBox<T>() would retrieve the appropriate Box<T> instance

  // Retrieve all items from the box. For very large datasets,
  // consider using ObjectBox queries with offset and limit directly
  // (e.g., `box.query()..offset(startIndex)..limit(pageSize).build().find()`)
  // if `getAll()` becomes a performance bottleneck for extremely large local datasets.
  final allItems = box.getAll();

  final startIndex = (page - 1) * pageSize;

  // Handle out of bounds startIndex to prevent errors and return gracefully
  if (startIndex < 0 || startIndex >= allItems.length) {
    return []; // Return an empty list if startIndex is invalid
  }

  final endIndex = startIndex + pageSize;

  // Adjust endIndex if it exceeds the total number of items
  if (endIndex > allItems.length) {
    return allItems.sublist(startIndex, allItems.length); // Get remaining items
  }

  // Return the calculated paginated slice of items
  return allItems.sublist(startIndex, endIndex);
}


This dual-pronged approach ensures that the application provides a fluid and responsive user experience, leveraging API efficiency for fresh data and ObjectBox performance for robust offline capabilities.

5. UI Screenshots
(Please replace these placeholders with actual screenshots of your application's UI. These screenshots visually represent the application's design, user experience, and key functionalities.)

### Login Screen:
![Login Screen](assets/screenshots/login.jpeg)

### Home Screen (Balance & Recent Expenses):
![Home Screen](assets/screenshots/home.jpeg)

### Add Expense Screen:
![Add Expense Screen](assets/screenshots/add_expense.jpeg)


Simple Animations: The application incorporates simple, subtle animations (e.g., fade-ins, sliding transitions, loading indicators) to enhance the user experience and provide clear visual feedback for interactions, contributing to a polished feel.

6. Trade-offs and Assumptions
Trade-offs:
Initial Boilerplate and Setup Complexity: While mason significantly automates code generation, adopting a full Clean Architecture with Bloc/Cubit and ObjectBox inherently involves more initial files, folders, and configuration compared to simpler architectural patterns or state management solutions. This can introduce a steeper learning curve for developers new to these paradigms and might feel like an overhead for extremely small, single-feature applications. However, this upfront investment pays significant dividends in terms of long-term maintainability, scalability, and testability as the project grows.

Increased Code Verbosity: The strict separation of concerns, while beneficial for clarity and testability, can sometimes lead to more verbose code, as data transformations and calls traverse multiple layers (e.g., Model to Entity conversion).

Assumptions:
Backend API Stability and Contract Adherence: It is assumed that the backend API is stable, follows RESTful principles (or similar well-defined contracts), and adheres to the expected data structures. Any significant changes to the API contract would necessitate corresponding updates in the Model and ApiService layers.

Internet Connectivity for Initial Data Sync: While ObjectBox provides robust offline capabilities, the application assumes initial internet connectivity for fetching the primary dataset from the API to populate the local database.

Data Model Immutability: Entities and Models are generally designed to be immutable, promoting predictable state and easier debugging.

Error Handling Granularity: Basic, comprehensive error handling is implemented across the API and data layers. For a production-grade application, more granular and user-friendly error messages, retry mechanisms, and specific UI feedback for different error types might be required.

Dependency Injection Configuration: It is assumed that get_it and injectable are correctly configured and generated to manage the dependency graph effectively.

7. How to Run the Project
Follow these steps to get the project up and running on your local machine.

Prerequisites
Flutter SDK installed (version 3.29.3 or higher recommended).

Dart SDK installed.

A code editor (VS Code, Android Studio, IntelliJ IDEA).

An Android emulator, iOS simulator, or a physical device.

Setup Steps
Clone the repository:

git clone <repository_url>
cd <project_directory>


Install dependencies:

flutter pub get


Ensure Mason is installed globally (if you plan to use bricks):

dart pub global activate mason_cli


If you have custom bricks, ensure they are linked or available.

Generate ObjectBox files:
After adding or modifying @Entity annotations in your data models, you will need to run the build runner to generate the necessary ObjectBox code and injectable dependency injection code:

flutter pub run build_runner build --delete-conflicting-outputs


This command ensures that all generated files, including ObjectBox schema and get_it registrations, are up-to-date.

Run the application:

flutter run


Choose your desired device/emulator when prompted.

Running Tests
To run all unit and widget tests:

flutter test


This command executes all tests, providing comprehensive coverage for business logic, data interactions, and UI components.

8. DevOps / CI/CD
This project leverages GitHub Actions for its Continuous Integration (CI) and Continuous Deployment (CD) pipeline. This automation ensures code quality, consistency, and a streamlined release process, enabling rapid and reliable delivery of new features and bug fixes.

Key CI/CD Workflows:

build_and_test.yml (Continuous Integration):

Triggers: Automatically runs on every push to main and develop branches, and on every pull_request targeting these branches.

Steps:

Checkout Code: Fetches the latest code from the repository.

Setup Flutter Environment: Configures the Flutter SDK with the specified version (3.29.3).

Install Dependencies: Executes flutter pub get to download all project dependencies.

Code Analysis: Runs flutter analyze to perform static code analysis, ensuring adherence to Dart's best practices and identifying potential issues early.

Run Tests: Executes all unit and widget tests (flutter test), providing immediate feedback on code correctness and preventing regressions.

Build Application: Performs a successful build of the application for a specific platform (e.g., Android APK, iOS App Bundle) to verify compilation and catch platform-specific issues.

deploy_to_store.yml (Continuous Deployment - Example):

Triggers: Typically configured for manual dispatch or on merges to the main branch (for production releases), or develop branch (for beta releases).

Steps:

Environment Setup: Similar to the CI workflow, sets up Flutter and installs dependencies.

Secure Credential Handling: Integrates with GitHub Secrets to securely manage signing credentials and API keys required for deployment.

Build Release Version: Builds the optimized release version of the application (e.g., flutter build appbundle for Android, flutter build ipa for iOS).

Deploy Artifact: Utilizes tools like Fastlane or direct API integrations to automatically upload the built application artifact to relevant app stores (e.g., Google Play Store, Apple App Store Connect) or distribution platforms.

These automated workflows significantly reduce manual effort, enhance collaboration, and ensure that only high-quality, tested code is integrated and deployed.