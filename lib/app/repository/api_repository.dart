import 'package:consult_citizen/app/repository/config.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  Future<http.Response> getCitizienUser({String? documentNumber}) async {
    http.Response response = await http.post(
        Uri.parse("${Config.apiUrl}/consultarNombres"),
        body: {"documentType": "CC", "documentNumber": documentNumber},
        headers: Config.header);
    return response;
  }
}
