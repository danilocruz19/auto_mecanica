import 'package:flutter/foundation.dart';

class StatusModel {
  String nomeDoCarro;
  String proprietarioDoCarro;
  String? servicoSelecionado;
  DateTime? dataPronta;
  String? valorDoServico;

  StatusModel({
    this.nomeDoCarro = '',
    this.proprietarioDoCarro = '',
    this.valorDoServico = '',
    this.servicoSelecionado,
    this.dataPronta,
  });

  Map<String, dynamic> toJson() {
    return {
      'nomeDoCarro': nomeDoCarro,
      'proprietarioDoCarro': proprietarioDoCarro,
      'servicoSelecionado': servicoSelecionado,
      'dataPronta': dataPronta?.toIso8601String(),
      'valorDoServico': valorDoServico,
    };
  }

  factory StatusModel.fromJson(Map<String, dynamic> json){
    return StatusModel(
      nomeDoCarro: json['nomeDoCarro'],
      proprietarioDoCarro: json['proprietarioDoCarro'],
      servicoSelecionado: json['servicoSelecionado'],
      dataPronta: json['dataPronta'] != null ? DateTime.parse(json['dataPronta']) : null,
      valorDoServico: json['valorDoServico'],
    );
  }
}
