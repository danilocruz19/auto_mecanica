class StatusModel {
  String nomeDoCarro;
  String proprietarioDoCarro;
  String? servicoSelecionado;
  DateTime? dataPronta;

  StatusModel({
    this.nomeDoCarro = '',
    this.proprietarioDoCarro = '',
    this.servicoSelecionado,
    this.dataPronta,
  });
}
