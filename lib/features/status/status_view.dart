import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where2/features/status/modelview/status_modelview.dart';

class StatusView extends StatefulWidget {
  const StatusView({super.key});

  @override
  State<StatusView> createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
  @override
  Widget build(BuildContext context) {
    final statusModel = context.watch<StatusModelview>();
    return Scaffold(
      body:
          statusModel.servicosMarcados.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: statusModel.servicosMarcados.length,
                itemBuilder: (context, index) {
                  final statusDentro = statusModel.servicosMarcados[index];
                  return Card(
                    child: Column(
                      children: [
                        Text('Carro: ${statusDentro.nomeDoCarro}'),
                        Text(
                          'Tipo de serviço: ${statusDentro.servicoSelecionado}',
                        ),
                        Text('Data prazo: ${statusDentro.dataPronta}'),
                        Text(
                          'Proprietário do carro: ${statusDentro.proprietarioDoCarro}',
                        ),
                      ],
                    ),
                  );
                },
              ),
    );
  }
}
