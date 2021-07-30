import 'package:consult_citizen/app/pages/w_long_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:consult_citizen/app/pages/form/form_controller.dart';
import 'package:consult_citizen/app/w_textformfield.dart';

class FormPage extends GetView<FormController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormFieldWidget(
                    hintText: "Nombres",
                    validator: controller.nameValidator,
                    controller: controller.nameController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]')),
                      FilteringTextInputFormatter.deny(RegExp('[.]'))
                    ],
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  TextFormFieldWidget(
                    hintText: "Apellidos",
                    validator: controller.surNameValidator,
                    controller: controller.surNameController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]')),
                      FilteringTextInputFormatter.deny(RegExp('[.]'))
                    ],
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  TextFormFieldWidget(
                    hintText: "No. de Cédula",
                    validator: controller.idValidator,
                    controller: controller.idController,
                    textInputType: TextInputType.numberWithOptions(
                        decimal: false, signed: false),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      FilteringTextInputFormatter.deny(RegExp('[,]'))
                    ],
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  LongElevatedButton(
                      onPressed: () {
                        controller.submit();
                      },
                      titleButton: "Continuar")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
