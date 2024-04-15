// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PokemonData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonDataImpl _$$PokemonDataImplFromJson(Map<String, dynamic> json) =>
    _$PokemonDataImpl(
      id: json['id'] as int,
      pokemonName: json['pokemonName'] as String,
      pokemonImageURL: json['pokemonImageURL'] as String,
      hp: json['hp'] as int,
      attack: json['attack'] as int,
      specialAttack: json['specialAttack'] as int,
      defense: json['defense'] as int,
      specialDefense: json['specialDefense'] as int,
      speed: json['speed'] as int,
      weight: json['weight'] as int,
      height: json['height'] as int,
      types: json['types'] as List<dynamic>,
    );

Map<String, dynamic> _$$PokemonDataImplToJson(_$PokemonDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pokemonName': instance.pokemonName,
      'pokemonImageURL': instance.pokemonImageURL,
      'hp': instance.hp,
      'attack': instance.attack,
      'specialAttack': instance.specialAttack,
      'defense': instance.defense,
      'specialDefense': instance.specialDefense,
      'speed': instance.speed,
      'weight': instance.weight,
      'height': instance.height,
      'types': instance.types,
    };
