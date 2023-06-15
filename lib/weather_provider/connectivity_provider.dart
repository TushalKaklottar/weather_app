import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import '../models/connectivity_model.dart';

class ConnectivityProvider extends ChangeNotifier {
  Connectivity connectivity = Connectivity();

  ConnectivityModel connectivityModel = ConnectivityModel(connectivitystatus: "Waiting");

  void CheckInternetstatus () {
    connectivityModel.connectivitystream = connectivity.onConnectivityChanged.listen((ConnectivityResult connectivityResult) {
      switch(connectivityResult) {
        case ConnectivityResult.wifi :
          connectivityModel.connectivitystatus = "wifi";
          notifyListeners();
          break;
        case ConnectivityResult.mobile :
          connectivityModel.connectivitystatus = "mobile";
          notifyListeners();
          break;
        default:
          connectivityModel.connectivitystatus = "Waiting..";
          notifyListeners();
          break;
      }
    });
  }
}