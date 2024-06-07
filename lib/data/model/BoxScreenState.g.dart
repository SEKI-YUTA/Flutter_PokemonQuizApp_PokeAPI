// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BoxScreenState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoxScreenStateImpl _$$BoxScreenStateImplFromJson(Map<String, dynamic> json) =>
    _$BoxScreenStateImpl(
      caughtPokemonList: (json['caughtPokemonList'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PokemonData.fromJson(e as Map<String, dynamic>))
          .toList(),
      shouldShowMoreLoadingUI:
          json['shouldShowMoreLoadingUI'] as bool? ?? false,
    );

Map<String, dynamic> _$$BoxScreenStateImplToJson(
        _$BoxScreenStateImpl instance) =>
    <String, dynamic>{
      'caughtPokemonList': instance.caughtPokemonList,
      'shouldShowMoreLoadingUI': instance.shouldShowMoreLoadingUI,
    };
