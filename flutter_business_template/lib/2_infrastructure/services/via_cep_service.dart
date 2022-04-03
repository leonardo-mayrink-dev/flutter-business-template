import 'package:flutter_business_template/1_domain/0_entities/result_cep.dart';
import 'package:flutter_business_template/2_infrastructure/util/message_util.dart';
import 'package:http/http.dart' as http;

class ViaCepService {
  static Future<ResultCep> fetchCep({required String cep}) async {
    final response = await http.get(
      Uri.parse('https://viacep.com.br/ws/$cep/json/'),
    );

    ResultCep result;
    if (response.statusCode == 200) {
      result = ResultCep.fromJson(response.body);
    } else {
      result = ResultCep.empty();
    }

    if (!result.isValid) {
      MessageUtil.addMessage("CEP não encontrado!");
    }

    return result;
  }
}
