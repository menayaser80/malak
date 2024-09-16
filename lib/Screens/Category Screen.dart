import 'package:flutter/material.dart';
import 'package:malak_stem/Screens/Inner%20Screen/Foods.dart';
import 'package:malak_stem/Screens/Inner%20Screen/Sports.dart';
import 'package:malak_stem/Screens/Todo%20Tasks/Bottom%20todo%20screens.dart';
import 'package:malak_stem/Shared/Reusable.dart';
import 'package:malak_stem/Widget/cat%20widget.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffB7DFF5),
    const Color(0xffFFFFFF),
  ];
  int Selectindex = 0;

  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/food.jpg',
      'catText': 'Nutrition',
    },
    {
      'imgPath': 'assets/images/sport.jpg',
      'catText': 'Excercises',
    },
    {
      'imgPath': 'assets/images/tasks.png',
      'catText': 'Tasks',
    },

  ];
  final List<Map<String, dynamic>> pages = [
    {
      'page': FoodScreeen(),
    },
    {
      'page': SportsScreeen(),
    },
    {
      'page': Bottomtodo(),
    },

  ];

  void Selectedpage(int index) {
    setState(() {
      Selectindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 240 / 250,
            crossAxisSpacing: 10,
            // Vertical spacing
            mainAxisSpacing: 10,
            // Horizontal spacing
            children: List.generate(3, (index) {
              return InkWell(
                onTap: () {
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
