import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where2/features/carlist/modelview/carlist_viewmodel.dart';

class CarlistView extends StatefulWidget {
  const CarlistView({super.key});

  @override
  State<CarlistView> createState() => _CarlistModelviewState();
}

class _CarlistModelviewState extends State<CarlistView> {
  @override
  Widget build(BuildContext context) {
    final carModel = context.watch<CarlistViewmodel>();
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: carModel.listaDeCarros.length,
        itemBuilder: (context, index) {
          final lista = carModel.listaDeCarros[index];
          return Dismissible(
            key: Key(lista.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              carModel.excluirCarro(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${lista.nomeDoCarro} placa: ${lista.placaDoCarro} excluído com sucesso',
                  ),
                ),
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              title: Text(lista.nomeDoCarro),
              trailing: Text(lista.placaDoCarro),
              subtitle: Text(lista.anoDoCarro.toString()),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            carModel.showAlert(context);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
