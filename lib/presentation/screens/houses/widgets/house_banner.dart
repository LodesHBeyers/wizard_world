import 'package:flutter/material.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/utils/house_styles.dart';

class HouseBanner extends StatelessWidget {
  final House house;

  const HouseBanner({
    super.key,
    required this.house,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CustomBannerPaint(
        color: house.houseColor,
      ),
      size: const Size(
        180,
        380,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 60,
          ),
          Text(
            house.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Container(
            width: 150,
            height: 150,
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  house.houseBadge,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }
}

class _CustomBannerPaint extends CustomPainter {
  final Color color;

  _CustomBannerPaint({
    required this.color,
  });

  final Paint accentPaint = Paint()
    ..color = const Color.fromARGB(255, 255, 214, 181)
    ..strokeWidth = .8;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint primaryPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..lineTo(
        0,
        size.height,
      )
      ..lineTo(
        size.width * .5,
        size.height * .8,
      )
      ..lineTo(
        size.width,
        size.height,
      )
      ..lineTo(
        size.width,
        0,
      )
      ..close();
    canvas.drawPath(
      path,
      primaryPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // Shape will never change
    return false;
  }
}
