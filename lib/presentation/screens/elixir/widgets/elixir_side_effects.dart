import 'package:wizard_world/presentation/screens/elixir/widgets/elixir_information_block.dart';

class ElixirSideEffects extends ElixirInfoBlock {
  final String sideEffects;

  const ElixirSideEffects({
    super.key,
    required this.sideEffects,
  });

  @override
  String get emptyString => "No known side effects";

  @override
  List<String> get infoElements => <String>[
        if (sideEffects.isNotEmpty) sideEffects,
      ];

  @override
  String get title => "Side effects:";
}
