// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meteorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meteorite _$MeteoriteFromJson(Map<String, dynamic> json) => Meteorite(
      id: json['id'] as String? ?? '',
      isEnable: json['isEnable'] as bool? ?? false,
      gameVocabType: $enumDecodeNullable(
              _$GameVocabularyTypeEnumMap, json['gameVocabType']) ??
          GameVocabularyType.none,
      roundNumber: json['roundNumber'] as int? ?? 0,
      questionContent: json['questionContent'] as String? ?? "",
      time: json['time'] as int? ?? 0,
      percent: json['percent'] as int? ?? 0,
      y: (json['y'] as num?)?.toDouble() ?? 0,
      x: (json['x'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$MeteoriteToJson(Meteorite instance) => <String, dynamic>{
      'id': instance.id,
      'gameVocabType': _$GameVocabularyTypeEnumMap[instance.gameVocabType]!,
      'roundNumber': instance.roundNumber,
      'questionContent': instance.questionContent,
      'time': instance.time,
      'percent': instance.percent,
      'y': instance.y,
      'x': instance.x,
      'isEnable': instance.isEnable,
    };

const _$GameVocabularyTypeEnumMap = {
  GameVocabularyType.none: 'None',
  GameVocabularyType.alternateSpelling: 'AlternateSpelling',
  GameVocabularyType.usEquivalent: 'UsEquivalent',
  GameVocabularyType.definition: 'Definition',
  GameVocabularyType.hint: 'Hint',
  GameVocabularyType.exampleSentence: 'ExampleSentence',
  GameVocabularyType.image: 'Image',
  GameVocabularyType.audio: 'Audio',
  GameVocabularyType.synonym: 'Synonym',
  GameVocabularyType.antonym: 'Antonym',
  GameVocabularyType.phoneticTranscription: 'PhoneticTranscription',
  GameVocabularyType.jumbledSpelling: 'JumbledSpelling',
};
