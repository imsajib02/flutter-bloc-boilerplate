import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
  Future<bool> isConnectionActive();
}

class ConnectivityStatus implements NetworkInfo {

  @override
  Future<bool> isConnected() async {
    var result = await Connectivity().checkConnectivity();
    return result == ConnectivityResult.mobile || result == ConnectivityResult.wifi;
  }

  @override
  Future<bool> isConnectionActive() async {
    var result = await InternetConnectionChecker().isHostReachable(AddressCheckOptions(InternetAddress('8.8.8.8'), port: 53, timeout: const Duration(seconds: 2)));
    return result.isSuccess;
  }
}