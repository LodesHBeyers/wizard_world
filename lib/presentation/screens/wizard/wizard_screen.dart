import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/elixir.dart';
import 'package:wizard_world/data/entities/wizard.dart';
import 'package:wizard_world/data/notifiers/wizards/wizard_notifier.dart';
import 'package:wizard_world/presentation/components/app_bar/styled_app_bar.dart';
import 'package:wizard_world/presentation/components/error_container.dart';
import 'package:wizard_world/presentation/components/loaders/animated_loader.dart';
import 'package:wizard_world/presentation/components/not_found_container.dart';
import 'package:wizard_world/presentation/screens/wizard/widgets/wizard_image.dart';
import 'package:wizard_world/services/routing/app_navigator.dart';
import 'package:wizard_world/services/routing/app_routes.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class WizardScreen extends ConsumerWidget {
  final Wizard wizard;
  const WizardScreen({
    super.key,
    required this.wizard,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          heading: wizard.fullName,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WizardPicture(
              fullName: wizard.fullName,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(
                  AppSizes.l,
                  AppSizes.l,
                  AppSizes.l,
                  0,
                ),
                padding: const EdgeInsets.all(
                  AppSizes.s,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(
                      AppSizes.s,
                    ),
                    topRight: Radius.circular(
                      AppSizes.s,
                    ),
                  ),
                ),
                child: ref.watch(wizardProvider(wizard.id)).when(
                      data: (Wizard embellishedWizard) => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: AppSizes.xxs,
                            ),
                            child: Text(
                              "Elixirs: ",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          if (wizard.elixirs.isEmpty)
                            Text(
                              "None as of yet.",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                          for (Elixir elixir in wizard.elixirs)
                            GestureDetector(
                              onTap: () {
                                AppNavigator.pushNamed(
                                  context,
                                  AppRoutes.elixir,
                                  args: elixir.id,
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "${wizard.elixirs.length > 1 ? "· " : ""}${elixir.name}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                  ),
                                  const Icon(
                                    Icons.chevron_right,
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      error: (Object e, __) {
                        if (e is DioException &&
                            e.response?.statusCode == 404) {
                          return NotFoundContainer(
                            text:
                                "The records have been wiped! We cannot find any trace of ${wizard.fullName}.",
                          );
                        }
                        return ErrorContainer(
                          text: "",
                          onRetry: () {
                            ref.invalidate(wizardProvider(wizard.id));
                          },
                        );
                      },
                      loading: () => const Center(
                        child: AnimatedLoader(),
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
