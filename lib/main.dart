import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where2/features/carlist/modelview/carlist_viewmodel.dart';
import 'package:where2/features/status/modelview/status_modelview.dart';
import 'package:where2/home.dart';
import 'package:where2/features/manutencao/modelview/manutencao_modelview.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CarlistViewmodel()),
        ChangeNotifierProvider(create: (_) => ManutencaoModelview()),
        ChangeNotifierProvider(create: (_) => StatusModelview()),
        ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        fontFamily: 'OpenSans',
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 111, 15)),
        primaryColor: Colors.blue,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color.fromARGB(255, 73, 30, 1),
        ),
        
      ),
      home: Home(),
    );
  }
}
