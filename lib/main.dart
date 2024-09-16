import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:malak_stem/Cubic/Cache%20helper.dart';
import 'package:malak_stem/Cubic/Cubit.dart';
import 'package:malak_stem/Cubic/MyBlocObserver.dart';
import 'package:malak_stem/Cubic/States.dart';
import 'package:malak_stem/Screens/Splash%20Screen.dart';
import 'package:malak_stem/Screens/localization/changelocal.dart';
import 'package:malak_stem/Screens/localization/localization.dart';
import 'package:malak_stem/Screens/localization/services.dart';
import 'package:malak_stem/constants/Themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  Bloc.observer = MyBlocObserver();
  await CachHelper.init();
  bool? isdark = CachHelper.getData(key: 'isdark');
  runApp( MyApp(isdark));
}

class MyApp extends StatefulWidget {

  final bool? isdark;
  MyApp(this.isdark);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  final Future<FirebaseApp> firebaseinitilization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebaseinitilization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(child: CircularProgressIndicator()),
              ),
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: Text('An Error occured'),
                ),
              ),
            );
          }

          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => MedicineCubit()..getUserData(),
              ),
            ],
            child: BlocConsumer<MedicineCubit, MedicineStates>(
              listener: (context, state) {},
              builder: (context, state) {
                LocaleController controller = Get.put(LocaleController());
                return GetMaterialApp(
                  translations: MyTranslation(),
                  locale: controller.language,
                  title: 'Malak Stem',
                  debugShowCheckedModeBanner: false,
                  theme: lighttheme,
                  darkTheme: darkTheme,
                  themeMode: MedicineCubit.get(context).isdark
                      ? ThemeMode.dark
                      : ThemeMode.light,
                  home: Welcome(),
                );
              },
            ),
          );
        });
  }
}
