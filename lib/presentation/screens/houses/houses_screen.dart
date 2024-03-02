import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/data/notifiers/houses/houses_notifier.dart';
import 'package:wizard_world/presentation/components/app_bar/styled_app_bar.dart';
import 'package:wizard_world/presentation/components/loaders/animated_loader.dart';
import 'package:wizard_world/presentation/screens/houses/widgets/house_card.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class HousesScreen extends ConsumerWidget {
  const HousesScreen({super.key});

  final String hogwartsHousesInfo =
      "Hogwarts School of Witchcraft and Wizardry was divided into four Houses: Gryffindor, founded by Godric Gryffindor; Hufflepuff, founded by Helga Hufflepuff; Ravenclaw, founded by Rowena Ravenclaw; and Slytherin, founded by Salazar Slytherin.";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<House>> housesState = ref.watch(
      housesProvider,
    );

    return Scaffold(
      appBar: StyledAppBar(
        heading: "Houses",
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(
              AppSizes.s,
            ),
            child: Text(
              hogwartsHousesInfo,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          housesState.when(
            data: (List<House> houses) => Expanded(
              child: GridView.custom(
                padding: const EdgeInsets.all(
                  AppSizes.l,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: AppSizes.s,
                  crossAxisSpacing: AppSizes.s,
                  mainAxisExtent: 165,
                ),
                childrenDelegate: SliverChildListDelegate(
                  <Widget>[
                    for (House house in houses)
                      HouseCard(
                        house: house,
                      ),
                  ],
                ),
              ),
            ),
            error: (Object e, StackTrace s) => const Text("ERROR"),
            loading: () => const Center(
              child: AnimatedLoader(),
            ),
          ),
        ],
      ),
    );
  }
}
