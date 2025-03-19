// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_the_question_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerTheQuestionRequest _$AnswerTheQuestionRequestFromJson(
        Map<String, dynamic> json) =>
    AnswerTheQuestionRequest(
      gameVocabularyId: json['gameVocabularyId'] as String,
      gameVocabularyTypeId: json['gameVocabularyTypeId'] as String,
      gameHistoryId: json['gameHistoryId'] as String,
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$AnswerTheQuestionRequestToJson(
        AnswerTheQuestionRequest instance) =>
    <String, dynamic>{
      'gameVocabularyId': instance.gameVocabularyId,
      'gameVocabularyTypeId': instance.gameVocabularyTypeId,
      'gameHistoryId': instance.gameHistoryId,
      'answer': instance.answer,
    };
