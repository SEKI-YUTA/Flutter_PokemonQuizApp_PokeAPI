// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caught_pokemon_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCaughtPokemonListHash() =>
    r'b4a6db605168f11e582d545c8e33e41b67505f78';

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

/// See also [getCaughtPokemonList].
@ProviderFor(getCaughtPokemonList)
const getCaughtPokemonListProvider = GetCaughtPokemonListFamily();

/// See also [getCaughtPokemonList].
class GetCaughtPokemonListFamily
    extends Family<AsyncValue<List<CaughtPokemon>>> {
  /// See also [getCaughtPokemonList].
  const GetCaughtPokemonListFamily();

  /// See also [getCaughtPokemonList].
  GetCaughtPokemonListProvider call(
    String uid,
  ) {
    return GetCaughtPokemonListProvider(
      uid,
    );
  }

  @override
  GetCaughtPokemonListProvider getProviderOverride(
    covariant GetCaughtPokemonListProvider provider,
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
  String? get name => r'getCaughtPokemonListProvider';
}

/// See also [getCaughtPokemonList].
class GetCaughtPokemonListProvider
    extends AutoDisposeFutureProvider<List<CaughtPokemon>> {
  /// See also [getCaughtPokemonList].
  GetCaughtPokemonListProvider(
    String uid,
  ) : this._internal(
          (ref) => getCaughtPokemonList(
            ref as GetCaughtPokemonListRef,
            uid,
          ),
          from: getCaughtPokemonListProvider,
          name: r'getCaughtPokemonListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCaughtPokemonListHash,
          dependencies: GetCaughtPokemonListFamily._dependencies,
          allTransitiveDependencies:
              GetCaughtPokemonListFamily._allTransitiveDependencies,
          uid: uid,
        );

  GetCaughtPokemonListProvider._internal(
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
    FutureOr<List<CaughtPokemon>> Function(GetCaughtPokemonListRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCaughtPokemonListProvider._internal(
        (ref) => create(ref as GetCaughtPokemonListRef),
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
  AutoDisposeFutureProviderElement<List<CaughtPokemon>> createElement() {
    return _GetCaughtPokemonListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCaughtPokemonListProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCaughtPokemonListRef
    on AutoDisposeFutureProviderRef<List<CaughtPokemon>> {
  /// The parameter `uid` of this provider.
  String get uid;
}

class _GetCaughtPokemonListProviderElement
    extends AutoDisposeFutureProviderElement<List<CaughtPokemon>>
    with GetCaughtPokemonListRef {
  _GetCaughtPokemonListProviderElement(super.provider);

  @override
  String get uid => (origin as GetCaughtPokemonListProvider).uid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
