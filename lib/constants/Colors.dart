import 'package:flutter/material.dart';
import 'package:malak_stem/Cubic/Cache%20helper.dart';
import 'package:malak_stem/Screens/Auth/LoginScreen.dart';
import 'package:malak_stem/Shared/Reusable.dart';

const defaultcolor=Colors.blue;
const kDefaultPadding = 8.0;
const kLoginUid = 'Uid';
String? uid;
void signout(context)
{
  CachHelper.removeData(key: 'token',).then((value){
    if(value)
    {
      navigateandFinish(context, LoginScreen());
    }
  });
}