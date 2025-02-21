import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:where2/manutencao/model/manutencao_model.dart';

class ManutencaoModelview extends ChangeNotifier {
  final ManutencaoModel _carModel = ManutencaoModel();
  get carModel => _carModel;

  Map<String, int> tiposDeServicos = {
    'Pintura': 250,
    'Manutenção': 500,
    'Lavagem': 30,
  };

  String numberFormat(int valor) {
    return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(valor);
  }
}
