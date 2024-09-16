
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malak_stem/Screens/OnBoarding.dart';
import 'package:malak_stem/Screens/localization/changelocal.dart';
import 'package:malak_stem/Shared/Reusable.dart';
import 'package:malak_stem/Widget/custombuttomlang.dart';

class Lang extends GetView<LocaleController> {
  const Lang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1".tr, style:TextStyle(
                color: Colors.black,
                fontSize: 27.0
                  ,fontWeight: FontWeight.bold
              )),
              const SizedBox(height: 20),
              CustomButtonLang(
                  textbutton: "Ar",
                  onPressed: () {
                    controller.changeLang("ar");
                   navigateTo(context, Onboarding());
                  }),
              CustomButtonLang(
                  textbutton: "En",
                  onPressed: () {
                    controller.changeLang("en");
                   navigateTo(context, Onboarding());
                  }),
            ],
          )),
    );
  }
}