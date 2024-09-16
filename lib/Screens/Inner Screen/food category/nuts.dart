import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NutScreen extends StatelessWidget {
  const NutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
elevation: 0.0,
        title: Text('41'.tr,style: TextStyle(
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
                "74".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              Text(
                "75".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage(
                    "assets/images/nut1.jpg",
                  ),
                ),
              ),
              Text(
                "76".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage(
                    "assets/images/nut2.jpg",
                  ),
                ),
              ),
              Text(
                "77".tr,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Text(
                "78".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage(
                    "assets/images/nut3.jpg",
                  ),
                ),
              ),
              Text(
                "79".tr,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Text(
                "80".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage(
                    "assets/images/nut4.jpg",
                  ),
                ),
              ),
              Text(
                "81".tr,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Text(
                "82".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage(
                    "assets/images/nut5.png",
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
