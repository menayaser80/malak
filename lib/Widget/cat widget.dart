import 'package:flutter/material.dart';
import 'package:malak_stem/Screens/Inner%20Screen/Sports.dart';
import 'package:malak_stem/Shared/Reusable.dart';
import 'package:malak_stem/Widget/Textwidget.dart';

import '../Screens/Inner Screen/Foods.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget(
      {Key? key,
      required this.catText,
      required this.imgPath,
      required this.passedColor})
      : super(key: key);
  final String catText, imgPath;
  final Color passedColor;

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: widget.passedColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: widget.passedColor.withOpacity(0.7),
            width: 2,
          ),
        ),
        child: Column(children: [
          // Container for the image
          Container(
            height: _screenWidth * 0.3,
            width: _screenWidth * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    widget.imgPath,
                  ),
                  fit: BoxFit.fill),
            ),
          ),
          // Category name
          Textwidget(
            textsize: 20,
            istitle: true,
            text: widget.catText,
            color: Colors.black,
          ),
        ]),
      ),
    );
  }
}
