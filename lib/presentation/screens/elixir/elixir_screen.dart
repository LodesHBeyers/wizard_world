import 'package:flutter/material.dart';
import 'package:wizard_world/data/entities/elixir.dart';
import 'package:wizard_world/presentation/components/app_bar/styled_app_bar.dart';
import 'package:wizard_world/presentation/screens/elixir/widgets/elixir_duration.dart';
import 'package:wizard_world/presentation/screens/elixir/widgets/elixir_header.dart';
import 'package:wizard_world/presentation/screens/elixir/widgets/elixir_ingredients.dart';
import 'package:wizard_world/presentation/screens/elixir/widgets/elixir_inventors.dart';
import 'package:wizard_world/presentation/screens/elixir/widgets/elixir_side_effects.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class ElixirScreen extends StatelessWidget {
  final Elixir elixir;

  const ElixirScreen({
    super.key,
    required this.elixir,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          color: Theme.of(context).colorScheme.inversePrimary,
          titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: 1.25,
              ),
        ),
      ),
      child: Scaffold(
        appBar: StyledAppBar(
          heading: elixir.name,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.s,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSizes.l,
                  ),
                  child: ElixirHeader(
                    effect: elixir.effect,
                    characteristics: elixir.characteristics,
                  ),
                ),
                Divider(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSizes.l,
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: "The ${elixir.name} is considered to be ",
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: <TextSpan>[
                        TextSpan(
                          text: elixir.difficulty.localizedValue
                                  .startsWith(RegExp(r'[AEIOU aeiou]'))
                              ? "an "
                              : "a ",
                        ),
                        TextSpan(
                          text: elixir.difficulty.localizedValue,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const TextSpan(
                          text: " difficulty elixir.",
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Card(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      AppSizes.s,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ElixirInventors(
                          inventors: elixir.inventors,
                        ),
                        const Divider(),
                        ElixirSideEffects(
                          sideEffects: elixir.sideEffects,
                        ),
                        const Divider(),
                        ElixirIngredients(
                          ingredients: elixir.ingredients,
                        ),
                        const Divider(),
                        ElixirDuration(
                          duration: elixir.time,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSizes.l,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
