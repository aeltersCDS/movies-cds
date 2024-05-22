import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_cds/layers/presentation/app_root.dart';
import 'package:movies_cds/layers/presentation/common/styles/styles.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies CDS',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const AppRoot(),
    );
  }
}
