import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:collection/collection.dart';
import 'package:consult_citizen/app/models/citizien_model.dart';
import 'package:consult_citizen/app/repository/api_repository.dart';
import 'package:consult_citizen/app/repository/exceptions.dart';

class CitizienConsumerParams {
  final String name, surName, id;

  CitizienConsumerParams(
      {required this.name, required this.surName, required this.id});
}

class CitizenConsumer {
  Future<CitizenResponse> call({required CitizienConsumerParams params}) async {
    http.Response response = await Get.find<ApiRepository>()
        .getCitizienUser(documentNumber: params.id);
    switch (response.statusCode) {
      case 200:
        CitizenResponse citizenResponse =
            CitizenResponse.fromJson(json.decode(response.body));
        if (verifyNameMatch(
            citizenResponse: citizenResponse,
            name: params.name,
            surName: params.surName)) {
          return citizenResponse;
        } else {
          throw NoMatchName(
              "Su Nombre no coincide con los encontrados en su número de cédula");
        }
      case 500:
        throw Exception500(
            "En estos momentos no podemos realizar su solicitud.\nIntente de nuevo más tarde");
      default:
        throw Exception(
            "No pudimos realizar su consulta.\nIntente de nuevo más tarde");
    }
  }

  verifyNameMatch(
      {CitizenResponse? citizenResponse, String? name, String? surName}) {
    Function eq = const ListEquality().equals;
    List<String> fullNameArray = citizenResponse!.data!.fullName!.split(" ");

    if (eq(fullNameArray, citizenResponse.data!.arrayFullName)) {
      List<String> userCompleteName = name!.toUpperCase().trim().split(" ") +
          surName!.toUpperCase().trim().split(" ");

      if (eq(fullNameArray, userCompleteName)) {
        return true;
      }
    }
    return false;
  }
}
