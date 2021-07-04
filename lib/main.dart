import 'package:flutter/material.dart';
import 'package:peliculas_curso/providers/moviesProvider.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart'; //para importar desde el archivo screen todo

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => MoviesProvider(), lazy: false
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Peliculas',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomeScreen(),
          'details': (_) => DetailScreen(),
        },
        theme: ThemeData.light()
            .copyWith(appBarTheme: AppBarTheme(color: Colors.indigo)));
  }
}
