import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/notifiers/searchable_notifier.dart';
import 'package:wizard_world/presentation/screens/searchable/searchable_screen.dart';
import 'package:wizard_world/utils/app_sizes.dart';

void showSearchableModal<T>(
  BuildContext context, {
  required String hintText,
  required AutoDisposeAsyncNotifierProvider<SearchableNotifier<T>, List<T>>
      provider,
  required Widget Function(BuildContext, T) itemBuilder,
}) =>
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => SizedBox(
        width: AppSizes.sw(context),
        height: AppSizes.sh(context) * .65,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSizes.s,
            AppSizes.s,
            AppSizes.s,
            0,
          ),
          child: SearchableScreen<T>(
            hintText: hintText,
            provider: provider,
            itemBuilder: itemBuilder,
          ),
        ),
      ),
    );
