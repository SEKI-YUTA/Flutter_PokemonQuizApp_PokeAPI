// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListScrenState.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListScreenStateImpl _$$ListScreenStateImplFromJson(
        Map<String, dynamic> json) =>
    _$ListScreenStateImpl(
      pokemonList: (json['pokemonList'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PokemonData.fromJson(e as Map<String, dynamic>))
          .toList(),
      shouldShowMoreLoadingUI:
          json['shouldShowMoreLoadingUI'] as bool? ?? false,
    );

Map<String, dynamic> _$$ListScreenStateImplToJson(
        _$ListScreenStateImpl instance) =>
    <String, dynamic>{
      'pokemonList': instance.pokemonList,
      'shouldShowMoreLoadingUI': instance.shouldShowMoreLoadingUI,
    };
