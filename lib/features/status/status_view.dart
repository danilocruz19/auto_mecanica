import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:where2/features/status/modelview/status_modelview.dart';

class StatusView extends StatefulWidget {
  const StatusView({super.key});

  @override
  State<StatusView> createState() => _StatusViewState();
}

String? statusSelecionado;

class _StatusViewState extends State<StatusView> {
  @override
  Widget build(BuildContext context) {
    final statusModel = context.watch<StatusModelview>();
    return Scaffold(
      body:
          statusModel.servicosMarcados.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 10),
                    Text(
                      'Nenhum serviço encontrado.',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
              : ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: statusModel.servicosMarcados.length,
                itemBuilder: (context, index) {
                  final statusDentro = statusModel.servicosMarcados[index];
                  return ListTile(
                    title: Text(statusDentro.nomeDoCarro),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tipo de serviço: ${statusDentro.servicoSelecionado}',
                        ),
                        Text(
                          'Data prevista para o término: ${DateFormat('dd/MM/yyyy').format(statusDentro.dataPronta!)}',
                        ),
                        Text(
                          'Valor do serviço: ${statusDentro.valorDoServico}',
                        ),
                        Text(
                          'Proprietário do carro: ${statusDentro.proprietarioDoCarro}',
                        ),
                      ],
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: statusModel.excluirCarro,
        child: Icon(Icons.clear_all),
      ),
    );
  }
}
