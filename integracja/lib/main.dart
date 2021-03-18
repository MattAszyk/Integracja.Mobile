import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:integracja/controllers/authentication/authentication_controller.dart';
import 'package:integracja/controllers/authentication/authentication_state.dart';
import 'package:integracja/pages/home_page/home_page.dart';
import 'package:integracja/pages/login/login_page.dart';
import 'package:integracja/pages/play/play.dart';
import 'package:integracja/services/authentication_service.dart';
import 'package:integracja/utils/constrains.dart';

void main() {
  //initialize();
  runApp(MyApp());
}

void initialize() {
  Get.lazyPut(
    () => AuthenticationController(Get.put(RemoteAuthenticationService())),
  );
}

class MyApp extends GetWidget<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'inteGRAcja',
      theme: customTheme(),
      debugShowCheckedModeBanner: false,
      // BlocBuilder will listen to changes in AuthenticationState
      // and build an appropriate widget based on the state.
      home:
          /*Obx(() {
        if (controller.state is Unauthenticated) {
          return LoginPage();
        } else if (controller.state is Authenticated) {
          return HomePage(
            user: (controller.state as Authenticated).user,
          );
        } else
          return LoginPage();
      }),*/
          Play(),
    );
  }
}

ThemeData customTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
  );
}
