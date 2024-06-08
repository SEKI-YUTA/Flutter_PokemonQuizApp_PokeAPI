import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_state_provider.g.dart';

@riverpod
Stream<ConnectivityResult> networkConnectivity(NetworkConnectivityRef ref) {
  return Connectivity().onConnectivityChanged.map((it) => it.first);
}