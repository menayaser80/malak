import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:malak_stem/Cubic/Cubit.dart';
import 'package:malak_stem/Cubic/States.dart';
import 'package:malak_stem/Screens/Category%20Screen.dart';
import 'package:malak_stem/Screens/Home/HomeScreen.dart';
import 'package:malak_stem/Screens/Inner%20Screen/History.dart';
import 'package:malak_stem/Screens/Inner%20Screen/food%20category/ChatScreen.dart';
import 'package:malak_stem/Screens/profile%20screen.dart';
import 'package:malak_stem/Shared/Reusable.dart';

class BottomBarScreen extends StatefulWidget {
  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int Selectedindex = 0;


  final List<Map<String, dynamic>> pages = [
    {
      'page': HomeScreen(),
    },
    {
      'page': CategoryScreen(),
    },
    {
      'page': Chatoscreen(),
    },
    {
      'page': SettingScreen(),
    },
  ];
  void Selectedpage(int index) {
    setState(() {
      Selectedindex = index;
    });
  }
  var emailcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var isdark = MedicineCubit.get(context);

    return BlocConsumer<MedicineCubit, MedicineStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MedicineCubit.get(context);
        return Scaffold(
          drawer: Drawer(
            backgroundColor: Colors.white,
            child: ListView(
              children: [
                DrawerHeader(
                  child: Image(
                    image: AssetImage(
                      'assets/images/12.png',
                    ),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                InkWell(
                  onTap: (){
                    navigateTo(context, History());
                  },
                  child: ListTile(
                    leading: const Icon(
                      Icons.history,
                      color: Colors.green,
                    ),
                    title: const Text(
                      'History',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Text(
              cubit.titles[cubit.currentindex],
              style: TextStyle(
                color: isdark.isdark ? Colors.blue : Colors.black,
              ),
            ),
          ),
          body: cubit.screens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            currentIndex: cubit.currentindex,
            onTap: (index) {
              cubit.changebottom(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category_outlined,
                ),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                ),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.map_outlined,
                ),
                label: 'Google maps',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'Setting',
              ),
            ],
          ),
        );
      },
    );
  }
}
