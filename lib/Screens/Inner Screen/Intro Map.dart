import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malak_stem/Screens/Google%20Map.dart';
import 'package:malak_stem/Shared/Reusable.dart';

class IntroMap extends StatelessWidget {
  const IntroMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomAppBar(
          color:Color(0xff4CB9E7),
          surfaceTintColor: Color(0xff4CB9E7),
          height: 70,
          child: MaterialButton(
             child: Text("117".tr,style: TextStyle(
                 fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white

             ),),
              onPressed: () async {
                navigateTo(context, MapScreen());
              }),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage(
                    "assets/images/intromap.jpg",
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "115".tr,
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 35.0),
                child: Text(
                  "116".tr,
                  style: TextStyle(fontSize: 25.0, color: Colors.black),
                ),
              ),
              Text(
                "119".tr,
                style: TextStyle(fontSize: 25.0, color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  "120".tr,
                  style: TextStyle(fontSize: 25.0, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
