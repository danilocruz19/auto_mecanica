import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:where2/features/status/model/status_model.dart';

class StatusModelview extends ChangeNotifier {
  final StatusModel _statusModel = StatusModel();
  get statusModel => _statusModel;

  List<StatusModel> servicosMarcados = [];

  StatusModelview() {
    carregarServicos();
  }
  Future<void> salvarServicos() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> servicosJson =
        servicosMarcados
            .map((servicos) => jsonEncode(servicos.toJson()))
            .toList();
    await prefs.setStringList('servicos', servicosJson);
  }

  Future<void> carregarServicos() async {
    final prefs = await SharedPreferences.getInstance();
    final servicosJson = prefs.getStringList('servicos') ?? [];

    servicosMarcados.clear();
    servicosMarcados.addAll(
      servicosJson.map(
        (servicos) => StatusModel.fromJson(jsonDecode(servicos)),
      ),
    );
    notifyListeners();
  }

  void adicionarServico(StatusModel servico, BuildContext context) {
    bool existe = servicosMarcados.any(
      (s) => s.nomeDoCarro == servico.nomeDoCarro,
    );

    if (!existe) {
      servicosMarcados.add(servico);
      salvarServicos();
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Carro já adicionado a manutenção!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void excluirCarro() {
    servicosMarcados.removeLast();
    notifyListeners();
    salvarServicos();
  }
}
