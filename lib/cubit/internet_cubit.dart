import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyConnectionState {
  final bool connected;
  MyConnectionState(this.connected);
}

class ConnectionCubit extends Cubit<MyConnectionState> {
  late StreamSubscription<List<ConnectivityResult>> _subscription;
  ConnectionCubit() : super(MyConnectionState(false)) {
    _subscription = Connectivity().onConnectivityChanged.listen((results) { 
      // Use the first result in the list, or ConnectivityResult.none if empty
      final result = results.isNotEmpty ? results.first : ConnectivityResult.none;
      emit(MyConnectionState(result != ConnectivityResult.none));
    });
  }
  
  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}