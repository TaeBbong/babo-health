// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WodImpl _$$WodImplFromJson(Map<String, dynamic> json) => _$WodImpl(
      id: (json['id'] as num?)?.toInt(),
      date: (json['date'] as num).toInt(),
      work: json['work'] as String,
      setCount: (json['setCount'] as num).toInt(),
      rep: (json['rep'] as num).toInt(),
      weight: (json['weight'] as num).toDouble(),
    );

Map<String, dynamic> _$$WodImplToJson(_$WodImpl instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'work': instance.work,
      'setCount': instance.setCount,
      'rep': instance.rep,
      'weight': instance.weight,
    };
