// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'house_placement_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HousePlacementState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) intro,
    required TResult Function(
            List<MapEntry<House, Trait>> traitsPool, String text)
        selection,
    required TResult Function(House house) result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? intro,
    TResult? Function(List<MapEntry<House, Trait>> traitsPool, String text)?
        selection,
    TResult? Function(House house)? result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? intro,
    TResult Function(List<MapEntry<House, Trait>> traitsPool, String text)?
        selection,
    TResult Function(House house)? result,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Intro value) intro,
    required TResult Function(_Selection value) selection,
    required TResult Function(_Result value) result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Intro value)? intro,
    TResult? Function(_Selection value)? selection,
    TResult? Function(_Result value)? result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Intro value)? intro,
    TResult Function(_Selection value)? selection,
    TResult Function(_Result value)? result,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HousePlacementStateCopyWith<$Res> {
  factory $HousePlacementStateCopyWith(
          HousePlacementState value, $Res Function(HousePlacementState) then) =
      _$HousePlacementStateCopyWithImpl<$Res, HousePlacementState>;
}

/// @nodoc
class _$HousePlacementStateCopyWithImpl<$Res, $Val extends HousePlacementState>
    implements $HousePlacementStateCopyWith<$Res> {
  _$HousePlacementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IntroImplCopyWith<$Res> {
  factory _$$IntroImplCopyWith(
          _$IntroImpl value, $Res Function(_$IntroImpl) then) =
      __$$IntroImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$IntroImplCopyWithImpl<$Res>
    extends _$HousePlacementStateCopyWithImpl<$Res, _$IntroImpl>
    implements _$$IntroImplCopyWith<$Res> {
  __$$IntroImplCopyWithImpl(
      _$IntroImpl _value, $Res Function(_$IntroImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$IntroImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$IntroImpl implements _Intro {
  _$IntroImpl({required this.text});

  @override
  final String text;

  @override
  String toString() {
    return 'HousePlacementState.intro(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IntroImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IntroImplCopyWith<_$IntroImpl> get copyWith =>
      __$$IntroImplCopyWithImpl<_$IntroImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) intro,
    required TResult Function(
            List<MapEntry<House, Trait>> traitsPool, String text)
        selection,
    required TResult Function(House house) result,
  }) {
    return intro(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? intro,
    TResult? Function(List<MapEntry<House, Trait>> traitsPool, String text)?
        selection,
    TResult? Function(House house)? result,
  }) {
    return intro?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? intro,
    TResult Function(List<MapEntry<House, Trait>> traitsPool, String text)?
        selection,
    TResult Function(House house)? result,
    required TResult orElse(),
  }) {
    if (intro != null) {
      return intro(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Intro value) intro,
    required TResult Function(_Selection value) selection,
    required TResult Function(_Result value) result,
  }) {
    return intro(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Intro value)? intro,
    TResult? Function(_Selection value)? selection,
    TResult? Function(_Result value)? result,
  }) {
    return intro?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Intro value)? intro,
    TResult Function(_Selection value)? selection,
    TResult Function(_Result value)? result,
    required TResult orElse(),
  }) {
    if (intro != null) {
      return intro(this);
    }
    return orElse();
  }
}

abstract class _Intro implements HousePlacementState {
  factory _Intro({required final String text}) = _$IntroImpl;

  String get text;
  @JsonKey(ignore: true)
  _$$IntroImplCopyWith<_$IntroImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectionImplCopyWith<$Res> {
  factory _$$SelectionImplCopyWith(
          _$SelectionImpl value, $Res Function(_$SelectionImpl) then) =
      __$$SelectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MapEntry<House, Trait>> traitsPool, String text});
}

/// @nodoc
class __$$SelectionImplCopyWithImpl<$Res>
    extends _$HousePlacementStateCopyWithImpl<$Res, _$SelectionImpl>
    implements _$$SelectionImplCopyWith<$Res> {
  __$$SelectionImplCopyWithImpl(
      _$SelectionImpl _value, $Res Function(_$SelectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? traitsPool = null,
    Object? text = null,
  }) {
    return _then(_$SelectionImpl(
      traitsPool: null == traitsPool
          ? _value._traitsPool
          : traitsPool // ignore: cast_nullable_to_non_nullable
              as List<MapEntry<House, Trait>>,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectionImpl implements _Selection {
  _$SelectionImpl(
      {required final List<MapEntry<House, Trait>> traitsPool,
      required this.text})
      : _traitsPool = traitsPool;

  final List<MapEntry<House, Trait>> _traitsPool;
  @override
  List<MapEntry<House, Trait>> get traitsPool {
    if (_traitsPool is EqualUnmodifiableListView) return _traitsPool;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_traitsPool);
  }

  @override
  final String text;

  @override
  String toString() {
    return 'HousePlacementState.selection(traitsPool: $traitsPool, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectionImpl &&
            const DeepCollectionEquality()
                .equals(other._traitsPool, _traitsPool) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_traitsPool), text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectionImplCopyWith<_$SelectionImpl> get copyWith =>
      __$$SelectionImplCopyWithImpl<_$SelectionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) intro,
    required TResult Function(
            List<MapEntry<House, Trait>> traitsPool, String text)
        selection,
    required TResult Function(House house) result,
  }) {
    return selection(traitsPool, text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? intro,
    TResult? Function(List<MapEntry<House, Trait>> traitsPool, String text)?
        selection,
    TResult? Function(House house)? result,
  }) {
    return selection?.call(traitsPool, text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? intro,
    TResult Function(List<MapEntry<House, Trait>> traitsPool, String text)?
        selection,
    TResult Function(House house)? result,
    required TResult orElse(),
  }) {
    if (selection != null) {
      return selection(traitsPool, text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Intro value) intro,
    required TResult Function(_Selection value) selection,
    required TResult Function(_Result value) result,
  }) {
    return selection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Intro value)? intro,
    TResult? Function(_Selection value)? selection,
    TResult? Function(_Result value)? result,
  }) {
    return selection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Intro value)? intro,
    TResult Function(_Selection value)? selection,
    TResult Function(_Result value)? result,
    required TResult orElse(),
  }) {
    if (selection != null) {
      return selection(this);
    }
    return orElse();
  }
}

abstract class _Selection implements HousePlacementState {
  factory _Selection(
      {required final List<MapEntry<House, Trait>> traitsPool,
      required final String text}) = _$SelectionImpl;

  List<MapEntry<House, Trait>> get traitsPool;
  String get text;
  @JsonKey(ignore: true)
  _$$SelectionImplCopyWith<_$SelectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResultImplCopyWith<$Res> {
  factory _$$ResultImplCopyWith(
          _$ResultImpl value, $Res Function(_$ResultImpl) then) =
      __$$ResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({House house});
}

/// @nodoc
class __$$ResultImplCopyWithImpl<$Res>
    extends _$HousePlacementStateCopyWithImpl<$Res, _$ResultImpl>
    implements _$$ResultImplCopyWith<$Res> {
  __$$ResultImplCopyWithImpl(
      _$ResultImpl _value, $Res Function(_$ResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? house = null,
  }) {
    return _then(_$ResultImpl(
      house: null == house
          ? _value.house
          : house // ignore: cast_nullable_to_non_nullable
              as House,
    ));
  }
}

/// @nodoc

class _$ResultImpl implements _Result {
  _$ResultImpl({required this.house});

  @override
  final House house;

  @override
  String toString() {
    return 'HousePlacementState.result(house: $house)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultImpl &&
            (identical(other.house, house) || other.house == house));
  }

  @override
  int get hashCode => Object.hash(runtimeType, house);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      __$$ResultImplCopyWithImpl<_$ResultImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) intro,
    required TResult Function(
            List<MapEntry<House, Trait>> traitsPool, String text)
        selection,
    required TResult Function(House house) result,
  }) {
    return result(house);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? intro,
    TResult? Function(List<MapEntry<House, Trait>> traitsPool, String text)?
        selection,
    TResult? Function(House house)? result,
  }) {
    return result?.call(house);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? intro,
    TResult Function(List<MapEntry<House, Trait>> traitsPool, String text)?
        selection,
    TResult Function(House house)? result,
    required TResult orElse(),
  }) {
    if (result != null) {
      return result(house);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Intro value) intro,
    required TResult Function(_Selection value) selection,
    required TResult Function(_Result value) result,
  }) {
    return result(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Intro value)? intro,
    TResult? Function(_Selection value)? selection,
    TResult? Function(_Result value)? result,
  }) {
    return result?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Intro value)? intro,
    TResult Function(_Selection value)? selection,
    TResult Function(_Result value)? result,
    required TResult orElse(),
  }) {
    if (result != null) {
      return result(this);
    }
    return orElse();
  }
}

abstract class _Result implements HousePlacementState {
  factory _Result({required final House house}) = _$ResultImpl;

  House get house;
  @JsonKey(ignore: true)
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
