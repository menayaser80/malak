import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:malak_stem/Cubic/Cubit.dart';
import 'package:malak_stem/Cubic/States.dart';
import 'package:malak_stem/Screens/Auth/LoginScreen.dart';
import 'package:malak_stem/Screens/EditProfile.dart';
import 'package:malak_stem/Shared/Reusable.dart';
import 'package:malak_stem/Shared/auth%20instance.dart';
import 'package:malak_stem/Widget/Textwidget.dart';
import 'package:url_launcher/url_launcher.dart';




class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final User? user=authInstance.currentUser;
  @override
  Widget build(BuildContext context) {
    var isdark=MedicineCubit.get(context);

    return BlocConsumer<MedicineCubit,MedicineStates>(
      listener:(context,state){} ,
      builder: (context,state){
        var usermodel=MedicineCubit.get(context).usermodel;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child:usermodel!=null? Column(
            children: [
              Container(
                height: 190.0,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      child: Container(
                        height: 140.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0,),
                            topRight: Radius.circular(4.0,),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                                '${usermodel.cover}'
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      alignment: AlignmentDirectional.topCenter,
                    ),
                    CircleAvatar(
                      radius: 64.0,
                      backgroundColor:Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundImage: NetworkImage('${usermodel.image}'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                '${usermodel.name}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                '${usermodel.bio}',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              Text(
                '${usermodel.phone}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: ()async{
                          await launchUrl(Uri.parse("tel:+201015079262"));
                        },
                        child:Row(
                          children: [
                            Icon(Icons.phone_callback_outlined,color: Colors.blue,),
                            SizedBox(width: 5,),
                            Text("Contact us",style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),),
                          ],

                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    OutlinedButton(
                      onPressed: (){
                        navigateTo(context, EditProfile());
                      },
                      child:Icon(
                        IconlyLight.edit,
                        size: 16.0,
                      ),

                    ),
                  ],
                ),
              ),
              SwitchListTile(
                title:Textwidget(
                  text:isdark.isdark?'DarkMode':'LightMode',
                  color: Colors.blue,
                  textsize: 18.0,
                ),
                secondary: Icon(
                    isdark.isdark?Icons.dark_mode_outlined
                        :Icons.light_mode_outlined),
                value:isdark.isdark ,
                onChanged: (bool value){
                  MedicineCubit.get(context).changeappmode();

                },
              ),
              SizedBox(
                height: 5,
              ),
              OutlinedButton(
                onPressed: (){
                  if(user==null)
                  {
                    navigateTo(context, LoginScreen());
                    return;
                  }
                  warningDialog(title: 'Sign out', subtitle: 'Do you want sign out?', fct:()async{
                    await authInstance.signOut();
                    navigateTo(context, LoginScreen());
                  }, context: context);                },
                child:Center(
                  child: Text(
                    '${user==null?'Login':'LogOut'}',style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
                  ),
                  ),
                )

              ),


            ],
          ):SizedBox(),
        );
      },
    );
  }
}