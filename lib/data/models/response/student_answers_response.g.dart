// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_answers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentAnswersResponse _$StudentAnswersResponseFromJson(
        Map<String, dynamic> json) =>
    StudentAnswersResponse(
      type: $enumDecodeNullable(_$GameVocabularyTypeEnumMap, json['type']) ??
          GameVocabularyType.none,
      questionContent: json['questionContent'] as String? ?? "",
      key: json['key'] as String? ?? '',
      answer: json['answer'] as String? ?? '',
      isCorrect: json['isCorrect'] as bool? ?? false,
    );

Map<String, dynamic> _$StudentAnswersResponseToJson(
        StudentAnswersResponse instance) =>
    <String, dynamic>{
      'type': _$GameVocabularyTypeEnumMap[instance.type]!,
      'questionContent': instance.questionContent,
      'key': instance.key,
      'answer': instance.answer,
      'isCorrect': instance.isCorrect,
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
