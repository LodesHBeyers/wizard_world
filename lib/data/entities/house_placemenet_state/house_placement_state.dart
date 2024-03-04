import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/data/entities/trait.dart';

part 'house_placement_state.freezed.dart';

@freezed
class HousePlacementState with _$HousePlacementState {
  factory HousePlacementState.intro({
    required String text,
  }) = _Intro;

  factory HousePlacementState.selection({
    required List<MapEntry<House, Trait>> traitsPool,
    required String text,
  }) = _Selection;

  factory HousePlacementState.result({
    required House house,
  }) = _Result;
}
