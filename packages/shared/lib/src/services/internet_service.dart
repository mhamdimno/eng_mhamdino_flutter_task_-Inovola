import 'dart:async';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class InternetService {
  final InternetConnectionChecker _connectionChecker = InternetConnectionChecker.instance;
  final StreamController<bool> _connectivityStreamController = StreamController<bool>.broadcast();
  late StreamSubscription<InternetConnectionStatus> _subscription;

  InternetService() {
    _init();
  }

  void _init() {
    // Listen to connectivity changes and convert them to bool
    _subscription = _connectionChecker.onStatusChange.listen((status) {
      final isConnected = status == InternetConnectionStatus.connected;
      _connectivityStreamController.add(isConnected);
    });
  }

  /// Checks the current connectivity state
  Future<bool> isConnected() async {
    final status = await _connectionChecker.hasConnection;
    return status;
  }

  /// Provides a stream of connectivity changes
  Stream<bool> get connectivityStream =>
      _connectivityStreamController.stream;

  /// Dispose resources to prevent memory leaks
  void dispose() {
    _subscription.cancel();
    _connectivityStreamController.close();
  }
}
