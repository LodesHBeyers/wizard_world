import 'package:wizard_world/data/entities/wizard.dart';
import 'package:wizard_world/presentation/screens/elixir/widgets/elixir_information_block.dart';

class ElixirInventors extends ElixirInfoBlock {
  final List<Wizard> inventors;

  const ElixirInventors({
    super.key,
    required this.inventors,
  });

  @override
  String get emptyString => "Inventors are not known";

  @override
  List<String> get infoElements => <String>[
        for (Wizard inventor in inventors) inventor.fullName,
      ];

  @override
  String get title => "Inventors:";
}
