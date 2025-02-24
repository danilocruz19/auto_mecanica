import 'package:flutter/material.dart';
import 'package:where2/features/status/model/status_model.dart';

class StatusModelview extends ChangeNotifier{
  final StatusModel _statusModel = StatusModel();
  get statusModel => _statusModel; 

  List<StatusModel> servicosMarcados = [];

  void adicionarServico(StatusModel servico){
    servicosMarcados.add(servico);
    notifyListeners();
  }
}