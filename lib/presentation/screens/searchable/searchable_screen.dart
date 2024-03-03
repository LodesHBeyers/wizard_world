import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/notifiers/searchable_notifier.dart';
import 'package:wizard_world/presentation/components/loaders/animated_loader.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class SearchableScreen<T> extends ConsumerWidget {
  final String hintText;
  final Widget Function(BuildContext, T item) itemBuilder;
  final AutoDisposeAsyncNotifierProvider<SearchableNotifier<T>, List<T>>
      provider;

  const SearchableScreen({
    super.key,
    required this.hintText,
    required this.itemBuilder,
    required this.provider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: <Widget>[
        TextField(
          onChanged: ref.read(provider.notifier).onQueryChange,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSizes.s,
              vertical: AppSizes.xs,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppSizes.xxl,
              ),
            ),
          ),
        ),
        Expanded(
          child: ref.watch(provider).when(
                data: (List<T> items) {
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSizes.s,
                    ),
                    itemBuilder: (_, int index) {
                      return itemBuilder(
                        context,
                        items[index],
                      );
                    },
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: items.length,
                  );
                },
                error: (_, __) => const Offstage(),
                loading: () => const Center(
                  child: AnimatedLoader(),
                ),
              ),
        ),
      ],
    );
  }
}
