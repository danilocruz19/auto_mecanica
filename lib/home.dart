import 'package:flutter/material.dart';
import 'package:where2/carlist/carlist_view.dart';
import 'package:where2/manutencao/manutencao_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
int index = 0;
void mudarTela(int newIndex){
  setState(() {
    index = newIndex;
  });
}

final List<Widget> _pages = [
  CarlistView(),
  ManutencaoView(), 
  Container(color: Colors.amber),
]; 

final List<String> titleAppBar = [
  'Carros cadastrados',
  'Marcar Manutenção',
  'Status da manutenção',
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(66, 129, 69, 69),
      appBar: AppBar(
        title: Text(titleAppBar[index]),
        centerTitle: true,
      ),
      body: _pages[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: mudarTela,
        currentIndex: index,
        unselectedItemColor: const Color.fromARGB(255, 129, 129, 129),
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.car_rental), label: 'Carros'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Manutenção'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Status'),
        ],
      ),
    );
  }
}