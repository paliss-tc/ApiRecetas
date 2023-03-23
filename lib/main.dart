import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recepies_app/Themes/app_theme.dart';
import 'Providers/providers.dart';
import 'Screens/screens.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CoffeeDrinksProvider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee App',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'details': (_) => const DetailsScreen(),
        'recipes': (_) => const RecipesScreen(),
      },
      theme: AppTheme.lightTheme,
    );
  }
}
