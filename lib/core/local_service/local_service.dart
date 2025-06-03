// lib/core/local/local_service.dart
import 'package:objectbox/objectbox.dart';

/// Abstract interface for a generic local persistence service.
///
/// This interface defines the contract for storing, retrieving, and managing
/// objects of type [T] in a local database.
abstract class LocalService {
  /// Puts a single object [object] of type [T] into the store.
  /// Returns the ID of the put object.
  Future<int> put<T>(T object);

  /// Puts multiple objects [objects] of type [T] into the store.
  /// Returns a list of the IDs of the put objects.
  Future<List<int>> putMany<T>(List<T> objects);

  /// Retrieves an object of type [T] by its [id] from the store.
  /// Returns the object if found, otherwise null.
  Future<T?> getById<T>(int id);

  /// Retrieves all objects of type [T] from the store.
  Future<List<T>> getAll<T>();
  Future<List<T>> getPaginatedData<T>(int page, int pageSize);

  /// Deletes an object of type [T] by its [id] from the store.
  /// Returns true if the object was successfully removed, false otherwise.
  Future<bool> deleteById<T>(int id);

  /// Deletes multiple objects of type [T] by their [ids] from the store.
  /// Returns the number of objects removed.
  Future<int> deleteMany<T>(List<int> ids);

  /// Queries objects of type [T] based on a given [condition].
  /// Returns a list of objects that match the condition.
  Future<List<T>> query<T>(Condition<T> condition);

  /// Closes the underlying database store.
  Future<void> close();
}
