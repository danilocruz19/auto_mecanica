import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:where2/carlist/model/carlist._model.dart';
import 'package:where2/carlist/viewmodel/carlist_viewmodel.dart';
import 'package:where2/manutencao/viewmodel/manutencao_modelview.dart';

class ManutencaoView extends StatefulWidget {
  const ManutencaoView({super.key});

  @override
  State<ManutencaoView> createState() => _ManutencaoViewState();
}

CarlistModel? carroSelecionado;
String? servicoSelecionado;
DateTime? dataSelecionada;

class _ManutencaoViewState extends State<ManutencaoView> {
  @override
  Widget build(BuildContext context) {
    final carModel = context.watch<CarlistViewmodel>();
    final manutencaoModel = context.watch<ManutencaoModelview>();

    _showDatePicker() {
      showDatePicker(
        context: context,
        firstDate: DateTime(2025),
        initialDate: DateTime.now(),
        lastDate: DateTime(2026),
      ).then((data) {
        if (data != null) {
          setState(() {
            dataSelecionada = data;
          });
        }
      });
    }

    // _showDatePicker() {
    //   showDatePicker(
    //     context: context,
    //     initialDate: DateTime.now(),
    //     firstDate: DateTime(2025),
    //     lastDate: DateTime(2026),
    //   ).then((data) {
    //   if (data != null) {
    //     setState(() {
    //       dataSelecionada = data; // Agora atualiza corretamente
    //     });
    //   }
    // });
    // }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<CarlistModel>(
              hint: Text('Selecione um carro'),
              isExpanded: true,
              value: carroSelecionado,
              onChanged: (CarlistModel? novaSelecao) {
                setState(() {
                  carroSelecionado = novaSelecao;
                });
              },
              items:
                  carModel.listaDeCarros.map((CarlistModel carro) {
                    return DropdownMenuItem(
                      value: carro,
                      child: Text(carro.nomeDoCarro),
                    );
                  }).toList(),
            ),
          ),
          ListTile(
            title: Text('Proprietário do carro'),
            trailing: Text(carroSelecionado?.donoDoCarro ?? ''),
          ),
          ListTile(
            title: Text(
              carroSelecionado?.nomeDoCarro ?? 'Nenhum carro selecionado',
            ),
            trailing: Text(carroSelecionado?.placaDoCarro ?? ''),
            subtitle: Text(carroSelecionado?.anoDoCarro ?? ''),
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text('Selecione o serviço desejado'),
            trailing: DropdownButton<String>(
              hint: Text('Selecione um serviço'),
              value: servicoSelecionado,
              onChanged: (String? novaSelecao) {
                setState(() {
                  servicoSelecionado = novaSelecao;
                });
              },
              items:
                  manutencaoModel.tiposDeServicos.entries.map((
                    MapEntry<String, int> entry,
                  ) {
                    return DropdownMenuItem<String>(
                      value: entry.key,
                      child: Text(entry.key),
                    );
                  }).toList(),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text('Valor do serviço'),
            trailing: Text(
              'Valor do serviço: ${manutencaoModel.numberFormat(manutencaoModel.tiposDeServicos[servicoSelecionado] ?? 0)}',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text(
              dataSelecionada == null
                  ? 'Nenhuma data selecionada'
                  : DateFormat('dd/MM/yyyy').format(dataSelecionada!),
            ),
            subtitle: Text(
              'Selecione a data em que o serviço ficará pronto!',
              style: TextStyle(fontSize: 11, color: Theme.of(context).primaryColor),
            ),
            trailing: TextButton(
              onPressed: _showDatePicker,
              child: Text('Selecionar Data'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Adicionar serviço'),
            ),
          ),
        ],
      ),
    );
  }
}
