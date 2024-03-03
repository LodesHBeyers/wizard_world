import 'package:wizard_world/presentation/screens/elixir/widgets/elixir_information_block.dart';

class ElixirDuration extends ElixirInfoBlock {
  final String duration;

  const ElixirDuration({
    super.key,
    required this.duration,
  });


  @override
  String get emptyString => "Unknown duration";

  @override
  List<String> get infoElements => <String>[
        if (duration.isNotEmpty) "Effective for $duration",
      ];

  @override
  String get title => "Duration:";
}
