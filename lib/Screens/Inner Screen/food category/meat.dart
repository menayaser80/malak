import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeatScreen extends StatelessWidget {
  const MeatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
elevation: 0.0,
        title: Text('42'.tr,style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
          color: Colors.black,
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
         
              Text(
                "83".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage(
                    "assets/images/fish1.jpg",
                  ),
                ),
              ),

              Text(
                "84".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage(
                    "assets/images/fish3.jpg",
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
