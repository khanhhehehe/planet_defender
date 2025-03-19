// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_configs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeConfig _$TimeConfigFromJson(Map<String, dynamic> json) => TimeConfig(
      id: json['id'] as String? ?? '',
      roundNumber: json['roundNumber'] as int? ?? 0,
      gameVocabPDType: $enumDecodeNullable(
              _$GameVocabularyTypeEnumMap, json['gameVocabPDType']) ??
          GameVocabularyType.none,
      time: json['time'] as int? ?? 0,
      percent: json['percent'] as int? ?? 0,
    );

Map<String, dynamic> _$TimeConfigToJson(TimeConfig instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roundNumber': instance.roundNumber,
      'gameVocabPDType': _$GameVocabularyTypeEnumMap[instance.gameVocabPDType]!,
      'time': instance.time,
      'percent': instance.percent,
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
