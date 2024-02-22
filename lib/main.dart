import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/services/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ref.read(themeDataProvider),
      home: Scaffold(
        appBar: AppBar(),
        body: const Placeholder(),
      ),
    );
  }
}
