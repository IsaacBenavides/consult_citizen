import 'package:consult_citizen/app/dependency_injector.dart';
import 'package:consult_citizen/app/pages/form/form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  DependendyInjection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690),
        builder: () {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Consult Citizen',
            home: FormPage(),
          );
        });
  }
}
