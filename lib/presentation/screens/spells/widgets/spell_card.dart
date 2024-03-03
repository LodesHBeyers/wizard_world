import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:wizard_world/data/enums/spell_light.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class SpellCard extends StatelessWidget {
  final String name;
  final Color color;
  final String effect;
  final SpellLight light;
  final String incantation;
  final String type;

  SpellCard({
    super.key,
    required this.name,
    required this.color,
    required this.effect,
    required this.light,
    required this.incantation,
    required this.type,
  });

  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        if (incantation.isEmpty) {
          return;
        }
        flutterTts
          ..setLanguage("en-US")
          ..setSpeechRate(.3)
          ..setVolume(1.0)
          ..speak(incantation);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Incantation: ",
                    ),
                    Expanded(
                      child: Text(
                        incantation.isNotEmpty ? incantation : "Unknown",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              letterSpacing: 2,
                            ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.xs,
                    vertical: AppSizes.xxs,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _CardInfoRow(
                        label: "Effect",
                        value: effect,
                      ),
                      _CardInfoRow(
                        label: "Light",
                        value: light.localizedValue,
                      ),
                      _CardInfoRow(
                        label: "Type",
                        value: type,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (incantation.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.xs,
              ),
              child: Icon(
                Icons.play_circle_fill,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
        ],
      ),
    );
  }
}

class _CardInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _CardInfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: label,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Colors.grey,
            ),
        children: <TextSpan>[
          TextSpan(
            text: " · ",
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w900,
                ),
          ),
          TextSpan(
            text: value,
          ),
        ],
      ),
    );
  }
}
