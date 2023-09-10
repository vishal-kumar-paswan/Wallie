import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum InternetState { initial, gained, lost }

class InternetCubit extends Cubit<InternetState> {
  InternetCubit() : super(InternetState.initial) {
    _connectionSubscription = _connectivity.onConnectivityChanged.listen(
      (event) {
        if (event == ConnectivityResult.wifi ||
            event == ConnectivityResult.mobile) {
          emit(InternetState.gained);
        } else {
          emit(InternetState.lost);
        }
      },
    );
  }
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectionSubscription;

  @override
  Future<void> close() {
    _connectionSubscription?.cancel();
    return super.close();
  }
}
