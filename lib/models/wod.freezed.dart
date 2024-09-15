// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wod.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Wod _$WodFromJson(Map<String, dynamic> json) {
  return _Wod.fromJson(json);
}

/// @nodoc
mixin _$Wod {
  int get date => throw _privateConstructorUsedError;
  String get work => throw _privateConstructorUsedError;
  int get set => throw _privateConstructorUsedError;
  int get rep => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WodCopyWith<Wod> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WodCopyWith<$Res> {
  factory $WodCopyWith(Wod value, $Res Function(Wod) then) =
      _$WodCopyWithImpl<$Res, Wod>;
  @useResult
  $Res call({int date, String work, int set, int rep, double weight});
}

/// @nodoc
class _$WodCopyWithImpl<$Res, $Val extends Wod> implements $WodCopyWith<$Res> {
  _$WodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? work = null,
    Object? set = null,
    Object? rep = null,
    Object? weight = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      work: null == work
          ? _value.work
          : work // ignore: cast_nullable_to_non_nullable
              as String,
      set: null == set
          ? _value.set
          : set // ignore: cast_nullable_to_non_nullable
              as int,
      rep: null == rep
          ? _value.rep
          : rep // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WodImplCopyWith<$Res> implements $WodCopyWith<$Res> {
  factory _$$WodImplCopyWith(_$WodImpl value, $Res Function(_$WodImpl) then) =
      __$$WodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int date, String work, int set, int rep, double weight});
}

/// @nodoc
class __$$WodImplCopyWithImpl<$Res> extends _$WodCopyWithImpl<$Res, _$WodImpl>
    implements _$$WodImplCopyWith<$Res> {
  __$$WodImplCopyWithImpl(_$WodImpl _value, $Res Function(_$WodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? work = null,
    Object? set = null,
    Object? rep = null,
    Object? weight = null,
  }) {
    return _then(_$WodImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      work: null == work
          ? _value.work
          : work // ignore: cast_nullable_to_non_nullable
              as String,
      set: null == set
          ? _value.set
          : set // ignore: cast_nullable_to_non_nullable
              as int,
      rep: null == rep
          ? _value.rep
          : rep // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WodImpl implements _Wod {
  _$WodImpl(
      {required this.date,
      required this.work,
      required this.set,
      required this.rep,
      required this.weight});

  factory _$WodImpl.fromJson(Map<String, dynamic> json) =>
      _$$WodImplFromJson(json);

  @override
  final int date;
  @override
  final String work;
  @override
  final int set;
  @override
  final int rep;
  @override
  final double weight;

  @override
  String toString() {
    return 'Wod(date: $date, work: $work, set: $set, rep: $rep, weight: $weight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WodImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.work, work) || other.work == work) &&
            (identical(other.set, set) || other.set == set) &&
            (identical(other.rep, rep) || other.rep == rep) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, work, set, rep, weight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WodImplCopyWith<_$WodImpl> get copyWith =>
      __$$WodImplCopyWithImpl<_$WodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WodImplToJson(
      this,
    );
  }
}

abstract class _Wod implements Wod {
  factory _Wod(
      {required final int date,
      required final String work,
      required final int set,
      required final int rep,
      required final double weight}) = _$WodImpl;

  factory _Wod.fromJson(Map<String, dynamic> json) = _$WodImpl.fromJson;

  @override
  int get date;
  @override
  String get work;
  @override
  int get set;
  @override
  int get rep;
  @override
  double get weight;
  @override
  @JsonKey(ignore: true)
  _$$WodImplCopyWith<_$WodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
