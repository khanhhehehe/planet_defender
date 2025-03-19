// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vocabulary_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVocabularyTypesModel _$GameVocabularyTypesModelFromJson(
        Map<String, dynamic> json) =>
    GameVocabularyTypesModel(
      id: json['id'] as String? ?? '',
      createdUserId: json['createdUserId'] as String? ?? '',
      updatedUserId: json['updatedUserId'] as String? ?? '',
      createdFullName: json['createdFullName'] as String? ?? '',
      updatedFullName: json['updatedFullName'] as String? ?? '',
      createdDate: json['createdDate'] as String? ?? '',
      updatedDate: json['updatedDate'] as String? ?? '',
      gameVocabType: json['gameVocabType'] as String? ?? '',
      questionContent: json['questionContent'] as String? ?? '',
      alternateSpelling: (json['alternateSpelling'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      gameVocabularyId: json['gameVocabularyId'] as String? ?? '',
    );

Map<String, dynamic> _$GameVocabularyTypesModelToJson(
        GameVocabularyTypesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdUserId': instance.createdUserId,
      'updatedUserId': instance.updatedUserId,
      'createdFullName': instance.createdFullName,
      'updatedFullName': instance.updatedFullName,
      'createdDate': instance.createdDate,
      'updatedDate': instance.updatedDate,
      'gameVocabType': instance.gameVocabType,
      'questionContent': instance.questionContent,
      'alternateSpelling': instance.alternateSpelling,
      'gameVocabularyId': instance.gameVocabularyId,
    };
