import 'dart:convert';

class ResultCep {
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;
  String unidade;
  String ibge;
  String gia;

  ResultCep({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.unidade,
    required this.ibge,
    required this.gia,
  });

  bool get isValid =>
      logradouro.isNotEmpty && bairro.isNotEmpty && localidade.isNotEmpty;

  factory ResultCep.fromJson(String str) => ResultCep.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultCep.empty() {
    return ResultCep(
      cep: '',
      logradouro: '',
      complemento: '',
      bairro: '',
      localidade: '',
      uf: '',
      unidade: '',
      ibge: '',
      gia: '',
    );
  }

  factory ResultCep.fromMap(Map<String, dynamic> json) => ResultCep(
        cep: json["cep"] ?? "",
        logradouro: json["logradouro"] ?? "",
        complemento: json["complemento"] ?? "",
        bairro: json["bairro"] ?? "",
        localidade: json["localidade"] ?? "",
        uf: json["uf"] ?? "",
        unidade: json["unidade"] ?? "",
        ibge: json["ibge"] ?? "",
        gia: json["gia"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "cep": cep,
        "logradouro": logradouro,
        "complemento": complemento,
        "bairro": bairro,
        "localidade": localidade,
        "uf": uf,
        "unidade": unidade,
        "ibge": ibge,
        "gia": gia,
      };
}
