import 'package:freezed_annotation/freezed_annotation.dart';

part 'wod.freezed.dart';
part 'wod.g.dart';

@freezed
class Wod with _$Wod {
  factory Wod(
      {int? id,
      required int date,
      required String work,
      required int setCount,
      required int rep,
      required double weight}) = _Wod;
  factory Wod.fromJson(Map<String, dynamic> json) => _$WodFromJson(json);
}
