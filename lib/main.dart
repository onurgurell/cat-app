import 'package:cat_app/core/constants/string_constants.dart';
import 'package:cat_app/features/home/presentation/pages/home_view.dart';
import 'package:cat_app/injection.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
  await setupInjection();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.titleAppBar,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
