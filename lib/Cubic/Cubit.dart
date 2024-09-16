import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:malak_stem/Cubic/Cache%20helper.dart';
import 'package:malak_stem/Cubic/States.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:malak_stem/Models/SocialUserModel.dart';
import 'package:malak_stem/Screens/Category%20Screen.dart';
import 'package:malak_stem/Screens/Home/HomeScreen.dart';
import 'package:malak_stem/Screens/Inner%20Screen/Intro%20Map.dart';
import 'package:malak_stem/Screens/Inner%20Screen/food%20category/ChatScreen.dart';
import 'package:malak_stem/Screens/Todo%20Tasks/archived_tasks.dart';
import 'package:malak_stem/Screens/Todo%20Tasks/done_tasks.dart';
import 'package:malak_stem/Screens/Todo%20Tasks/new_tasks.dart';
import 'package:malak_stem/Screens/profile%20screen.dart';
import 'package:malak_stem/constants/Colors.dart';
import 'package:sqflite/sqflite.dart';

class MedicineCubit extends Cubit<MedicineStates> {
  MedicineCubit() :super(SocialInitialState());

  static MedicineCubit get(context) => BlocProvider.of(context);
  SocialUserModel? usermodel;
  bool isdark = false;
  int currentindex = 0;
  List<Widget>screens = [
    HomeScreen(),
    CategoryScreen(),
    Chatoscreen(),
    IntroMap(),
    SettingScreen(),
  ];

  List<String>titles = [
    'Home',
    'Category',
    'Community',
    'GoogleMap',
    'Profile',
  ];
  void changebottom(int index)
  {
    currentindex=index;
    emit(ShopChangeBottomNavState());
  }
  Future userlogin({
    required String email,
    required String password,
    required BuildContext context
  })
  async
  {
    emit(SocialLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) async {
      print(value.user!.email);
      print(value.user!.uid);
      await CachHelper.saveData(key: 'uid', value: value.user!.uid);
      uid = value.user?.uid ?? '';
      MedicineCubit.get(context).getUserData();
      emit(SocialLoginSuccessState(value.user!.uid));
    }).catchError((error){
      emit(SocialLoginErrorState(error.toString()));
    }
    );
  }
  Future getUserData() async
  {
    if (uid != null) {
      emit(SocialGetUserLoadingState());
      await FirebaseFirestore.instance.collection('users').
      doc(uid).get()
          .then((value) {
        // print(value.data());
        usermodel = SocialUserModel.fromJson(value.data()!);
        emit(SocialGetUserSuccessState());
      })
          .catchError((error) {
        print(error.toString());
        emit(SocialGetUserErrorState(error.toString()));
        throw error;
      });
    }
  }
  IconData suffix=Icons.visibility_outlined;
  bool isPassword=true;
  void changepasswordvisibility()
  {
    isPassword=!isPassword;
    suffix=isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(SocialchangePasswordState());
  }
  void userCreate({
    required String email,
    required String name,
    required String phone,
    required String uid,

  })
  {
    SocialUserModel model=SocialUserModel(
      name: name,
      email: email,
      phone: phone,
      usertype:'patient',
      uid: uid,
      bio: 'write your Bio ....',
      image:'https://as1.ftcdn.net/v2/jpg/04/28/56/60/1000_F_428566061_Fkqaq0l831DXPM12Ixs9ds3waZWlCXHH.jpg',
      cover:'https://as1.ftcdn.net/v2/jpg/04/28/56/60/1000_F_428566061_Fkqaq0l831DXPM12Ixs9ds3waZWlCXHH.jpg',
      isEmailVerified: false,
    );
    FirebaseFirestore.instance.collection('users').doc(uid)
        .set(model.toMap()).then((value){
      emit(SuccessCreateUserState());
    }).catchError((error){
      emit(ErrorCreateUserState(error.toString()));
    });
  }
  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  })
  {
    emit(LoadingRegisterState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email:email ,
      password: password,
    ).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      userCreate(
        email:email,
        name:name,
        phone:phone ,
        uid:value.user!.uid,

      );
    }).catchError((error){
      emit(ErrorRegisterState(error.toString()));
    });

  }


  void changeappmode({bool? fromshared}) {
    if (fromshared != null) {
      isdark = fromshared;
      emit(AppChangeDarkState());
    }
    else {
      isdark = !isdark;
      CachHelper.putBoolean(key: 'isdark', value: isdark).then((value) {
        emit(AppChangeDarkState());
      });
    }
  }
  File? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      print('No Image Selected');
      emit(SocialProfileImagePickedErrorState());
    }
  }

  File? coverimage;

  Future<void> getCoverImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverimage = File(pickedFile.path);
      emit(SocialcoverimagePickedSuccessState());
    } else {
      print('No Image Selected');
      emit(SocialcoverimagePickedErrorState());
    }
  }

  void UploadProfileImage
      ({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri
        .file(profileImage!.path)
        .pathSegments
        .last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //  emit(SocialuploadimageSuccessState());
        print(value);
        updataUser(name: name,
            phone: phone,
            bio: bio,
            image: value,
           );
      }).catchError((error) {
        emit(SocialuploadimageErrorState());
      });
    }).catchError((error) {
      emit(SocialuploadimageErrorState());
    });
  }

  void UploadcoverImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri
        .file(coverimage!.path)
        .pathSegments
        .last}')
        .putFile(coverimage! as File)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(SocialuploadcoverimageSuccessState());
        print(value);
        updataUser(name: name,
            phone: phone,
            bio: bio,
            cover: value,
           );
      }).catchError((error) {
        emit(SocialuploadcoverimageErrorState());
      });
    }).catchError((error) {
      emit(SocialuploadcoverimageErrorState());
    });
  }

  void updataUser({
    required String name,
    required String phone,
    required String bio,
    String? cover,
    String? image,
  }) {
    SocialUserModel model = SocialUserModel(
      name: name,
      phone: phone,
      bio: bio,
      email: usermodel!.email,
      cover: cover ?? usermodel!.cover!,
      image: image ?? usermodel!.image!,
      uid: usermodel!.uid,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance.collection('users')
        .doc(model.uid).update(model.toMap())
        .then((value) {
      getUserData();
      emit(SocialUserUpdateSuccessState());
    })
        .catchError((error) {
      emit(SocialUserUpdateErrorState());
    });
  }
  int currentIndex = 0;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  List<Widget> scrons = const [
    NewTasks(),
    DoneTasks(),
    ArchivedTasks(),
  ];

  List<String> tetle = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  void changeIndex (int index){
    currentIndex = index ;
    emit(ChangeBottomNavBarState());
  }


  late Database database;
  List<Map> newTasks =[];
  List<Map> doneTasks =[];
  List<Map> archiveTasks =[];

  void createDatabase() {
    openDatabase(
      'todo.dp',
      version: 1,
      onCreate: (database, version) {
        debugPrint('DataBase Created ');

        database
            .execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT, date TEXT,time TEXT, status TEXT)')
            .then((value) {
          debugPrint(' Table Created ');
        }).catchError((error) {
          debugPrint('Error when Creating Table: ${error.toString()} ');
        });
      },
      onOpen: ( database) {
        getFromDatabase(database);
        debugPrint(' DataBase opened ');
      },
    ).then((value) {
      database = value ;
      emit(CreateDatabaseState());
    }).catchError((error){
      debugPrint('error when open database-> ${error.toString()}');
    });
  }



  Future insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
          'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "new")')
          .then((value) {
        debugPrint("$value inserted successfully ");
        emit(InsertToDatabaseState());
        getFromDatabase(database);
      }).catchError((error) {
        debugPrint('Error when inserting new record ${error.toString()}');
      });

      return null;
    });
  }

  void getFromDatabase(database)  {

    newTasks = [];
    doneTasks = [];
    archiveTasks = [];

    emit(GetDatabaseLoadingState());

    database.rawQuery('SELECT * FROM tasks').then((value) {

      value.forEach((element){
        if(element['status'] == 'new') {
          newTasks.add(element);
        } else if(element['status'] == 'done') {
          doneTasks.add(element);
        } else {
          archiveTasks.add(element);
        }
      });

      emit(GetDatabaseState());
    });

  }

  void updateDatabaseStatus({
    required String status,
    required int id,
  })
  {
    database.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      [status, id],
    ).then((value){

      getFromDatabase(database);
      emit(UpdateDatabaseStatusState());
    });
  }

  late int taskId;
  Future updateDatabaseTask({
    required String title,
    required String time,
    required String date,
    required int id,
  })
  async{
    database.rawUpdate(
      'UPDATE tasks SET title = ? ,time = ?, date = ? WHERE id = ?',
      [title,time,date, id],
    ).then((value){
      debugPrint("$value edited successfully ");
      emit(UpdateDatabaseTaskState());
      getFromDatabase(database);
    }).catchError((error){
      debugPrint('Error when editing the task ${error.toString()}');
    });
  }

  void deleteDatabase({
    required int id,
  })
  {
    database.rawDelete(
      'DELETE from tasks WHERE id = ?', [id],
    ).then((value){

      getFromDatabase(database);
      emit(DeleteDatabaseState());
    });
  }

  bool isBottomSheetShown = false;
  var fabIcon = Icons.edit;

  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  })
  {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(ChangeBottomSheetState());
  }


  void updateOnDismissedCancelScreens(){
    getFromDatabase(database);
    emit(GetDatabaseState());
  }
}