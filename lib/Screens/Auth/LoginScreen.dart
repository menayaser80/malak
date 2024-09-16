import 'package:card_swiper/card_swiper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:malak_stem/Cubic/Cache%20helper.dart';
import 'package:malak_stem/Cubic/Cubit.dart';
import 'package:malak_stem/Cubic/States.dart';
import 'package:malak_stem/Screens/Auth/Register%20Screen.dart';
import 'package:malak_stem/Screens/BottomBarScreen.dart';

import 'package:malak_stem/Screens/Home/HomeScreen.dart';
import 'package:malak_stem/Screens/on%20boarding%202.dart';
import 'package:malak_stem/Shared/Reusable.dart';
import 'package:malak_stem/Widget/AuthButton.dart';
import 'package:malak_stem/Widget/Textwidget.dart';
import 'package:malak_stem/Widget/loading%20manager.dart';
import 'package:malak_stem/constants/swipper.dart';

import 'forget password.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailTextController = TextEditingController();
  final passTextController = TextEditingController();
  final passFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  var obscureText = true;

  @override
  void dispose() {
    emailTextController.dispose();
    passTextController.dispose();
    passFocusNode.dispose();
    super.dispose();
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicineCubit, MedicineStates>(
      listener: (context, state) {
        if (state is SocialLoginErrorState) {
          showToast(
            text: state.error,
            state: ToastColor.ERROR,
          );
        }
        if (state is SocialLoginSuccessState) {
          CachHelper.saveData(
            key: 'uid',
            value: state.uid,
          ).then((value) {
            navigateandFinish(context, Onboardingscro());
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: LoadingManager(
            isLoading: _isLoading,
            child: Stack(
              children: [
                Swiper(
                  duration: 800,
                  autoplayDelay: 8000,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      Constantt.authImagesPaths[index],
                      fit: BoxFit.cover,
                    );
                  },
                  autoplay: true,
                  itemCount: Constantt.authImagesPaths.length,
                ),
                Container(
                  color: Colors.black.withOpacity(0.7),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 120,
                        ),
                        Textwidget(
                          text: '10'.tr,
                          color: Colors.white,
                          textsize: 30,
                          istitle: true,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Textwidget(
                          text: 'Sign in to continue',
                          color: Colors.white,
                          textsize: 18,
                          istitle: false,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                onEditingComplete: () => FocusScope.of(context)
                                    .requestFocus(passFocusNode),
                                controller: emailTextController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty || !value.contains('@')) {
                                    return 'Please enter a valid email address';
                                  } else {
                                    return null;
                                  }
                                },
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  hintText: '2'.tr,
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              TextFormField(
                                textInputAction: TextInputAction.done,
                                onEditingComplete: () {
                                  if (formKey.currentState!.validate()) {
                                    MedicineCubit.get(context).userlogin(
                                        email: emailTextController.text,
                                        password: passTextController.text,
                                        context: context);
                                  }
                                },
                                controller: passTextController,
                                focusNode: passFocusNode,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: obscureText,
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 7) {
                                    return 'Please enter a valid Password';
                                  } else {
                                    return null;
                                  }
                                },
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        obscureText = !obscureText;
                                      });
                                    },
                                    child: Icon(
                                      obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white,
                                    ),
                                  ),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              navigateTo(context, ForgetPasswordScreen());
                            },
                            child: Text(
                              'Forget password?',
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ConditionalBuilder(
                          condition: state is! SocialLoginLoadingState,
                          builder: (context) => AuthButton(
                            fct: () {
                              if (formKey.currentState!.validate()) {
                                MedicineCubit.get(context).userlogin(
                                    email: emailTextController.text,
                                    password: passTextController.text,
                                    context: context);
                              }
                            },
                            buttonText: 'Login',
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.white,
                                thickness: 2,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Textwidget(
                                text: 'OR', color: Colors.white, textsize: 18),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.white,
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AuthButton(
                          fct: () {
                            navigateTo(context, BottomBarScreen());
                          },
                          buttonText: 'Continue as a Guest',
                          primary: Colors.black,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Don\'t have an account?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                              children: [
                                TextSpan(
                                  text: '   Sign up',
                                  style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      navigateTo(context, RegisterScreen());
                                    },
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
