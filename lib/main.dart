import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:cinema_pedia/config/router/app_router.dart';
import 'package:cinema_pedia/config/theme/app_theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner:false,
      theme: AppTheme().getTheme(),
    );
  }
}
