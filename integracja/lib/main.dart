import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:integracja/controllers/authentication/authentication_controller.dart';
import 'package:integracja/controllers/authentication/authentication_state.dart';
import 'package:integracja/network/api_base.dart';
import 'package:integracja/pages/home_page/home_page.dart';
import 'package:integracja/pages/login/login_page.dart';
import 'package:integracja/services/authentication_service.dart';
import 'package:integracja/utils/constrains.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initialize();
  runApp(MyApp());
}

void initialize() {
  Get.lazyPut(
    () => AuthenticationController(Get.put(RemoteAuthenticationService())),
  );
  Get.put(ApiBase());
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
      home: Obx(() {
        if (controller.state is Unauthenticated) {
          return LoginPage();
        } else if (controller.state is Authenticated) {
          return HomePage();
        } else
          return LoginPage();
      }),
    );
  }
}

ThemeData customTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
  );
}
