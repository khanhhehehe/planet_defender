// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionsModel _$QuestionsModelFromJson(Map<String, dynamic> json) =>
    QuestionsModel(
      gameVocabType: $enumDecodeNullable(
              _$GameVocabularyTypeEnumMap, json['gameVocabType']) ??
          GameVocabularyType.none,
      questionContent: json['questionContent'] as String? ?? "",
      alternateSpelling: (json['alternateSpelling'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      gameVocabularyId: json['gameVocabularyId'] as String? ?? '',
      id: json['id'] as String? ?? "",
      createdUserId: json['createdUserId'] as String? ?? "",
      updatedUserId: json['updatedUserId'] as String? ?? "",
      createdFullName: json['createdFullName'] as String? ?? "",
      updatedFullName: json['updatedFullName'] as String? ?? "",
      createdDate: BaseModel.dateFromJson(json['createdDate'] as String?),
      updatedDate: BaseModel.dateFromJson(json['updatedDate'] as String?),
    );

Map<String, dynamic> _$QuestionsModelToJson(QuestionsModel instance) {
  final val = <String, dynamic>{
    'gameVocabType': _$GameVocabularyTypeEnumMap[instance.gameVocabType]!,
    'questionContent': instance.questionContent,
    'alternateSpelling': instance.alternateSpelling,
    'gameVocabularyId': instance.gameVocabularyId,
    'id': instance.id,
    'createdUserId': instance.createdUserId,
    'updatedUserId': instance.updatedUserId,
    'createdFullName': instance.createdFullName,
    'updatedFullName': instance.updatedFullName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('createdDate', instance.createdDate?.toIso8601String());
  writeNotNull('updatedDate', instance.updatedDate?.toIso8601String());
  return val;
}

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
