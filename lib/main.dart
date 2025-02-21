import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where2/carlist/viewmodel/carlist_viewmodel.dart';
import 'package:where2/home.dart';
import 'package:where2/manutencao/viewmodel/manutencao_modelview.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CarlistViewmodel()),
        ChangeNotifierProvider(create: (_) => ManutencaoModelview()),
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primaryColor: Colors.blue,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color.fromARGB(255, 41, 87, 126),
        ),
        
      ),
      home: Home(),
    );
  }
}
