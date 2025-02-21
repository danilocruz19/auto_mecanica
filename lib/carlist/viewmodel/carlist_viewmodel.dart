import 'package:flutter/material.dart';
import 'package:where2/carlist/model/carlist._model.dart';

class CarlistViewmodel extends ChangeNotifier {
  final CarlistModel _carModel = CarlistModel();
  get carModel => _carModel;

  final List<CarlistModel> listaDeCarros = [
    CarlistModel(
      nomeDoCarro: 'Vectra',
      anoDoCarro: '2010',
      placaDoCarro: 'PHM2S20',
      donoDoCarro: 'Danilo',
    ),
  ];

  final controllerNome = TextEditingController();
  final controllerAno = TextEditingController();
  final controllerPlaca = TextEditingController();
  final controllerDono = TextEditingController();

  void adicionarCarro(
    String nome,
    String anoDoCarro,
    String placaDoCarro,
    String donoDoCarro,
  ) {
    listaDeCarros.add(
      CarlistModel(
        nomeDoCarro: nome,
        anoDoCarro: anoDoCarro,
        placaDoCarro: placaDoCarro,
        donoDoCarro: donoDoCarro,
      ),
    );
    controllerDono.clear();
    controllerNome.clear();
    controllerPlaca.clear();
    controllerAno.clear();
    notifyListeners();
  }

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicione seu carro'),
          content: SizedBox(
            width: 150,
            height: 250,
            child: Column(
              children: [
                TextFormField(
                  controller: controllerDono,
                  decoration: InputDecoration(labelText: 'Dono do carro'),
                ),
                TextFormField(
                  controller: controllerNome,
                  decoration: InputDecoration(labelText: 'Nome do carro'),
                ),
                TextFormField(
                  controller: controllerAno,
                  decoration: InputDecoration(labelText: 'Ano do carro'),
                ),
                TextFormField(
                  controller: controllerPlaca,
                  decoration: InputDecoration(labelText: 'Placa do carro'),
                ),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    adicionarCarro(
                      controllerNome.text,
                      controllerAno.text,
                      controllerPlaca.text,
                      controllerDono.text,
                    );
                    notifyListeners();
                    Navigator.pop(context);
                  },
                  child: Text('Adicionar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Fechar', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void excluirCarro(int index){
    listaDeCarros.removeAt(index);
  }
}
