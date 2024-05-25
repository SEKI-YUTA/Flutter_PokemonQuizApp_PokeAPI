// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getUserDataHash() => r'27f785e4c758ca62d66e0ae52e949eb146847669';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getUserData].
@ProviderFor(getUserData)
const getUserDataProvider = GetUserDataFamily();

/// See also [getUserData].
class GetUserDataFamily extends Family<AsyncValue<UserData?>> {
  /// See also [getUserData].
  const GetUserDataFamily();

  /// See also [getUserData].
  GetUserDataProvider call(
    String uid,
  ) {
    return GetUserDataProvider(
      uid,
    );
  }

  @override
  GetUserDataProvider getProviderOverride(
    covariant GetUserDataProvider provider,
  ) {
    return call(
      provider.uid,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getUserDataProvider';
}

/// See also [getUserData].
class GetUserDataProvider extends AutoDisposeFutureProvider<UserData?> {
  /// See also [getUserData].
  GetUserDataProvider(
    String uid,
  ) : this._internal(
          (ref) => getUserData(
            ref as GetUserDataRef,
            uid,
          ),
          from: getUserDataProvider,
          name: r'getUserDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserDataHash,
          dependencies: GetUserDataFamily._dependencies,
          allTransitiveDependencies:
              GetUserDataFamily._allTransitiveDependencies,
          uid: uid,
        );

  GetUserDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
  }) : super.internal();

  final String uid;

  @override
  Override overrideWith(
    FutureOr<UserData?> Function(GetUserDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserDataProvider._internal(
        (ref) => create(ref as GetUserDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserData?> createElement() {
    return _GetUserDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserDataProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetUserDataRef on AutoDisposeFutureProviderRef<UserData?> {
  /// The parameter `uid` of this provider.
  String get uid;
}

class _GetUserDataProviderElement
    extends AutoDisposeFutureProviderElement<UserData?> with GetUserDataRef {
  _GetUserDataProviderElement(super.provider);

  @override
  String get uid => (origin as GetUserDataProvider).uid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
