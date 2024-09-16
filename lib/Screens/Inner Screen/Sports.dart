import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SportsScreeen extends StatelessWidget {
  const SportsScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          '114'.tr,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "103".tr,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Text(
                "104".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage(
                    "assets/images/sport1.png",
                  ),
                ),
              ),
              Text(
                "105".tr,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Text(
                "106".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage(
                    "assets/images/sport2.jpg",
                  ),
                ),
              ),
              Text(
                "107".tr,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Text(
                "108".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage(
                    "assets/images/sport3.png",
                  ),
                ),
              ),
              Text(
                "109".tr,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Text(
                "110".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage(
                    "assets/images/sport4.png",
                  ),
                ),
              ),
              Text(
                "111".tr,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Text(
                "112".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage(
                    "assets/images/sport5.jpg",
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "113".tr,
                  style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
