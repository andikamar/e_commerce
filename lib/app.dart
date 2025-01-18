import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/bindings/general_bindings.dart';
import 'package:e_commerce/routes/app_routes.dart';
import 'package:e_commerce/utils/constraints/colors.dart';
import 'package:e_commerce/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,

      ///show loader or circular progress indicator meanwhile authentication repository is deciding to show relevant screen
      home: const Scaffold(
          backgroundColor: TColors.primary,
          body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}
