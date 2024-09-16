import 'package:flutter/material.dart';
import 'package:malak_stem/Cubic/Cache%20helper.dart';
import 'package:malak_stem/Models/boarding%202.dart';
import 'package:malak_stem/Screens/BottomBarScreen.dart';
import 'package:malak_stem/Shared/Reusable.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class Onboardingscro extends StatefulWidget {
  @override
  State<Onboardingscro> createState() => _OnboardingscroState();
}

class _OnboardingscroState extends State<Onboardingscro> {
  var boardController=PageController();

  bool islast=false;
  void submit()
  {
    CachHelper.saveData(key:'on boarding', value:true,).then((value){
      if(value)
      {
        navigateTo(context,BottomBarScreen());
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          TextButton(onPressed:submit,
              child: Text(
                'SKIP',
              )),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index)
                {
                  if(index==boardingo.length -1)
                  {
                    setState(()
                    {
                      islast=true;
                    });
                  }else
                  {
                    setState(()
                    {
                      islast=false;
                    });
                  }
                },
                itemBuilder: (context,index)=>buildBoardingItem(boardingo[index]),
                itemCount: boardingo.length,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(controller: boardController,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5.0,
                    activeDotColor:Color(0xFF7441F2),
                  ),
                  count: boardingo.length,
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: (){
                    if(islast)
                    {
                      submit();
                    }else
                    {
                      boardController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,);
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(Boarding2 model)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text('${model.title}',
        style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color:  Colors.black
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Text('${model.body}',
        style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color:   Colors.black
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
    ],
  );
}