import 'package:connectivity_plus/connectivity_plus.dart';

abstract interface class ConnectionChecker {
  Future<bool> get isConnected;
}

class ConnectionCheckerImpl implements ConnectionChecker {
  final Connectivity connectivity;
  ConnectionCheckerImpl({required this.connectivity});

  @override
  Future<bool> get isConnected async {
    bool isInternetConnected;
    List<ConnectivityResult> list = await connectivity.checkConnectivity();
    // connectivity.onConnectivityChanged.listen((List<ConnectivityResult> connectivityResult) async {
    //   if (connectivityResult.contains(ConnectivityResult.none)) {
    //     isInternetConnected = false;
    //   } else {
    //     isInternetConnected = true;
    //   }
    // });
    if (list.contains(ConnectivityResult.none)) {
      isInternetConnected = false;
    } else {
      isInternetConnected = true;
    }
    return isInternetConnected;
  }
}
