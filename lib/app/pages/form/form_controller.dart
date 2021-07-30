import 'package:consult_citizen/app/data/citizien_consumer.dart';
import 'package:consult_citizen/app/models/citizien_model.dart';
import 'package:consult_citizen/app/pages/second_page/second_page.dart';
import 'package:consult_citizen/app/repository/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late CitizenResponse response;

  TextEditingController nameController = TextEditingController();
  TextEditingController surNameController = TextEditingController();
  TextEditingController idController = TextEditingController();

  get nameValidator => MultiValidator([
        RequiredValidator(errorText: 'Ingrese su Nombre'),
        MinLengthValidator(3, errorText: 'Debe tener más de 3 caracteres'),
      ]);

  get surNameValidator => MultiValidator([
        RequiredValidator(errorText: 'Ingrese su Apellido'),
        MinLengthValidator(3, errorText: 'Debe tener más de 3 caracteres'),
      ]);
  get idValidator => MultiValidator([
        RequiredValidator(errorText: 'Ingrese su No. de Cédula'),
        MinLengthValidator(7, errorText: 'Debe tener más de 7 caracteres'),
      ]);

  submit() async {
    if (formKey.currentState!.validate()) {
      Get.dialog(AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: SizedBox(
            height: 100,
            width: 150,
            child: Center(child: CircularProgressIndicator())),
      ));

      String alertMessage = "";
      try {
        response = await CitizenConsumer().call(
            params: CitizienConsumerParams(
                name: nameController.text,
                surName: surNameController.text,
                id: idController.text));
      } on NoMatchName catch (e) {
        alertMessage = e.message;
      } on Exception500 catch (e) {
        alertMessage = e.message;
      } on Exception catch (e) {
        alertMessage = e.toString();
      } finally {
        Get.back();
        if (alertMessage != "") {
          Get.dialog(AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: SizedBox(
                height: 100,
                width: 500,
                child: Center(
                    child: Text(
                  alertMessage,
                  style: TextStyle(fontSize: 25),
                ))),
          ));
        } else {
          Get.to(() => SecondPage(
                text: response.data!.fullName!,
              ));
        }
      }
    }
  }
}
