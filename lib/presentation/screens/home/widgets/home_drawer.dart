import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/notifiers/theme/theme_notifier.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(
              AppSizes.s,
            ),
            child: Text(
              "App settings",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Consumer(
            builder: (_, WidgetRef ref, __) {
              return SegmentedButton<ThemeMode>(
                onSelectionChanged: (Set<ThemeMode> modes) {
                  // This will only ever have on value
                  ref
                      .read(
                        themeModeProvider.notifier,
                      )
                      .update(
                        (_) => modes.first,
                      );
                },
                segments: const <ButtonSegment<ThemeMode>>[
                  ButtonSegment<ThemeMode>(
                    value: ThemeMode.dark,
                    label: Text("Dark"),
                  ),
                  ButtonSegment<ThemeMode>(
                    value: ThemeMode.light,
                    label: Text("Light"),
                  ),
                  ButtonSegment<ThemeMode>(
                    value: ThemeMode.system,
                    label: Text("System"),
                  ),
                ],
                multiSelectionEnabled: false,
                selected: <ThemeMode>{
                  ref.watch(
                    themeModeProvider,
                  ),
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
