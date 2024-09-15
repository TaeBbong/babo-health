// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WodImpl _$$WodImplFromJson(Map<String, dynamic> json) => _$WodImpl(
      date: (json['date'] as num).toInt(),
      work: json['work'] as String,
      set: (json['set'] as num).toInt(),
      rep: (json['rep'] as num).toInt(),
      weight: (json['weight'] as num).toDouble(),
    );

Map<String, dynamic> _$$WodImplToJson(_$WodImpl instance) => <String, dynamic>{
      'date': instance.date,
      'work': instance.work,
      'set': instance.set,
      'rep': instance.rep,
      'weight': instance.weight,
    };
