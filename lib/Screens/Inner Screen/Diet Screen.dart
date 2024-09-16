import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malak_stem/Screens/Inner%20Screen/food%20category/fats.dart';
import 'package:malak_stem/Screens/Inner%20Screen/food%20category/fruits.dart';
import 'package:malak_stem/Screens/Inner%20Screen/food%20category/grains.dart';
import 'package:malak_stem/Screens/Inner%20Screen/food%20category/legume.dart';
import 'package:malak_stem/Screens/Inner%20Screen/food%20category/meat.dart';
import 'package:malak_stem/Screens/Inner%20Screen/food%20category/milk.dart';
import 'package:malak_stem/Screens/Inner%20Screen/food%20category/nuts.dart';
import 'package:malak_stem/Screens/Inner%20Screen/food%20category/oil.dart';
import 'package:malak_stem/Screens/Inner%20Screen/food%20category/seeds.dart';
import 'package:malak_stem/Screens/Inner%20Screen/food%20category/vegetables.dart';
import 'package:malak_stem/Shared/Reusable.dart';
import 'package:malak_stem/Widget/Textwidget.dart';
import 'package:malak_stem/Widget/cat%20widget.dart';

class DietScreen extends StatelessWidget {
  DietScreen({Key? key}) : super(key: key);

  List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
  ];

  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/froro.jpg',
      'catText': '39'.tr,
    },
    {
      'imgPath': 'assets/images/vegete.jpg',
      'catText': '40'.tr,
    },
    {
      'imgPath': 'assets/images/nono.jpg',
      'catText': '41'.tr,
    },
    {
      'imgPath': 'assets/images/fishand meat.jpg',
      'catText': '42'.tr,
    },
    {
      'imgPath': 'assets/images/gege.jpg',
      'catText': '43'.tr,
    },
    {
      'imgPath': 'assets/images/milk.jpg',
      'catText': '44'.tr,
    },
    {
      'imgPath': 'assets/images/oils.jpg',
      'catText': '45'.tr,
    },
    {
      'imgPath': 'assets/images/seeds.jpg',
      'catText': '46'.tr,
    },
    {
      'imgPath': 'assets/images/fats.jpg',
      'catText': '47'.tr,
    },
    {
      'imgPath': 'assets/images/legumes.jpg',
      'catText': '48'.tr,
    },
  ];
  final List<Map<String, dynamic>> pages = [
    {
      'page': FruitsScreen(),
    },
    {
      'page': VegetablesScreen(),
    },
    {
      'page': NutScreen(),
    },
    {
      'page': MeatScreen(),
    },
    {
      'page': GrainsScreen(),
    },
    {
      'page': MilkScreen(),
    },
    {
      'page': OilScreen(),
    },
    {
      'page': SeedScreen(),
    },
    {
      'page': FatScreen(),
    },
    {
      'page': LegumeScreen(),
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Textwidget(
            text: '49'.tr,
            textsize: 24,
            istitle: true,
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 240 / 250,
            crossAxisSpacing: 10,
            // Vertical spacing
            mainAxisSpacing: 10,
            // Horizontal spacing
            children: List.generate(10, (index) {
              return InkWell(
                onTap: (){
                  navigateTo(context, pages[index]['page']);

                },
                child: CategoriesWidget(
                  catText: catInfo[index]['catText'],
                  imgPath: catInfo[index]['imgPath'],
                  passedColor: gridColors[index],
                ),
              );
            }),
          ),
        ));
  }
}
