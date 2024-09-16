import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeedScreen extends StatelessWidget {
  const SeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
elevation: 0.0,
        title: Text('46'.tr,style: TextStyle(
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
                "97".tr,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image(
                        image: AssetImage(
                          "assets/images/seed1.jpg",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image(
                        image: AssetImage(
                          "assets/images/seed 2.jpg",
                        ),
                      ),
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),
      ),

    );
  }
}
