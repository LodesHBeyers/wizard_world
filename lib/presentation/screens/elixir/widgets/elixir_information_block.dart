import 'package:flutter/material.dart';
import 'package:wizard_world/utils/app_sizes.dart';

abstract class ElixirInfoBlock extends StatelessWidget {
  const ElixirInfoBlock({
    super.key,
  });

  String get title;
  List<String> get infoElements;
  String get emptyString;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            bottom: AppSizes.xxs,
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        if (infoElements.isEmpty)
          Text(
            emptyString,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        for (String info in infoElements)
          Text(
            "${infoElements.length > 1 ? "· " : ""}$info",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
      ],
    );
  }
}
