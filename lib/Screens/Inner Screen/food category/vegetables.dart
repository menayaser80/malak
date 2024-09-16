import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VegetablesScreen extends StatelessWidget {
  const VegetablesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          '40'.tr,
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
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "50".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage(
                    "assets/images/veg1.jpg",
                  ),
                ),
              ),
              Text(
                "51".tr,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Text(
                "52".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage(
                    "assets/images/veg2.jpg",
                  ),
                ),
              ),
          Text(
            "53".tr,
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.red),
          ),
              Text(
                "54".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              Text(
                "55".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage(
                    "assets/images/veg3.jpg",
                  ),
                ),
              ),
              Text(
                "56".tr,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Text(
                "57".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage(
                    "assets/images/veg4.jpg",
                  ),
                ),
              ),
              Text(
                "58".tr,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Text(
                "59".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              Text(
                "60".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage(
                    "assets/images/veg5.png",
                  ),
                ),
              ),
              Text(
                "61".tr,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Text(
                "62".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage(
                    "assets/images/veg6.jpg",
                  ),
                ),
              ),
              Text(
                "63".tr,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Text(
                "64".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage(
                    "assets/images/veg7.jpg",
                  ),
                ),
              ),
              Text(
                "65".tr,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Text(
                "66".tr,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage(
                    "assets/images/veg8.png",
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
