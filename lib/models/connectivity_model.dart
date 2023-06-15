import 'dart:async';

class ConnectivityModel {
  String connectivitystatus;
  StreamSubscription? connectivitystream;

  ConnectivityModel({
   required this.connectivitystatus,
   this.connectivitystream,
});
}