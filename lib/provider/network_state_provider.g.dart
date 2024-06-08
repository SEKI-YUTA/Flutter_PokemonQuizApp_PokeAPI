// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$networkConnectivityHash() =>
    r'c4300d61c3cb97ef14bd88b62a16c7fe94f49a10';

/// See also [networkConnectivity].
@ProviderFor(networkConnectivity)
final networkConnectivityProvider =
    AutoDisposeStreamProvider<ConnectivityResult>.internal(
  networkConnectivity,
  name: r'networkConnectivityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$networkConnectivityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NetworkConnectivityRef
    = AutoDisposeStreamProviderRef<ConnectivityResult>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
