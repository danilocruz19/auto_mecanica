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
                  return Dismissible(
                    key: Key(statusDentro.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      statusModel.excluirCarro(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${statusDentro.nomeDoCarro}: Removido com sucesso!',
                          ),
                        ),
                      );
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.delete, color: Colors.white,),
                    ),
                    child: ListTile(
                    title: Text(statusDentro.nomeDoCarro ?? 'nao encontrado'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tipo de serviço: ${statusDentro.servicoSelecionado ?? 'nao encontrado'}',
                        ),
                        Text(
                          'Data prevista para o término: ${statusDentro.dataPronta != null 
                          ? DateFormat('dd/MM/yyyy').format(statusDentro.dataPronta!)
                          : 'Não encontrado'}',
                        ),
                        Text(
                          'Valor do serviço: ${statusDentro.valorDoServico ?? 'Nao encontrado'}',
                        ),
                        Text(
                          'Proprietário do carro: ${statusDentro.proprietarioDoCarro ?? 'nao encontrado'}',
                        ),
                      ],
                    ),
                  ),
                  );
                },
              ),
    );
  }
}
