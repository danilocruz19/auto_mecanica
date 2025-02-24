class CarlistModel {
  String nomeDoCarro;
  String anoDoCarro;
  String placaDoCarro;
  String donoDoCarro;

  CarlistModel({
    this.nomeDoCarro = '',
    this.anoDoCarro = '',
    this.placaDoCarro = '',
    this.donoDoCarro = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'nomeDoCarro': nomeDoCarro,
      'anoDoCarro': anoDoCarro,
      'placaDoCarro': placaDoCarro,
      'donoDoCarro': donoDoCarro,
    };
  }

  // Criando um objeto a partir do JSON
  factory CarlistModel.fromJson(Map<String, dynamic> json) {
    return CarlistModel(
      nomeDoCarro: json['nomeDoCarro'],
      anoDoCarro: json['anoDoCarro'],
      placaDoCarro: json['placaDoCarro'],
      donoDoCarro: json['donoDoCarro'],
    );
  }
}
