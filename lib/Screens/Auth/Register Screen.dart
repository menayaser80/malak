import 'package:card_swiper/card_swiper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:malak_stem/Cubic/Cubit.dart';
import 'package:malak_stem/Cubic/States.dart';
import 'package:malak_stem/Screens/Auth/LoginScreen.dart';
import 'package:malak_stem/Screens/BottomBarScreen.dart';
import 'package:malak_stem/Widget/AuthButton.dart';
import 'package:malak_stem/Widget/Textwidget.dart';
import 'package:malak_stem/Widget/loading%20manager.dart';
import 'package:malak_stem/constants/swipper.dart';

import '../../Shared/Reusable.dart';


class RegisterScreen extends StatefulWidget {
  static const routeName = '/RegisterScreen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _addressTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  bool _obscureText = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailTextController.dispose();
    _passTextController.dispose();
    _addressTextController.dispose();
    _emailFocusNode.dispose();
    _passFocusNode.dispose();
    _addressFocusNode.dispose();
    super.dispose();
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicineCubit, MedicineStates>(
      listener: (context, state) {
        if (state is SuccessCreateUserState) {
          navigateandFinish(
            context,
            BottomBarScreen(),
          );
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
                  autoplayDelay: 6000,
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
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      const SizedBox(
                        height: 60.0,
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => Navigator.canPop(context)
                            ? Navigator.pop(context)
                            : null,
                        child: Icon(
                          IconlyLight.arrowLeft2,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Textwidget(
                        text: 'Welcome',
                        color: Colors.white,
                        textsize: 30,
                        istitle: true,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Textwidget(
                        text: "Sign up to continue",
                        color: Colors.white,
                        textsize: 18,
                        istitle: false,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => FocusScope.of(context)
                                  .requestFocus(_emailFocusNode),
                              keyboardType: TextInputType.name,
                              controller: _fullNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "This Field is missing";
                                } else {
                                  return null;
                                }
                              },
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                hintText: 'Full name',
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              focusNode: _emailFocusNode,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => FocusScope.of(context)
                                  .requestFocus(_passFocusNode),
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailTextController,
                              validator: (value) {
                                if (value!.isEmpty || !value.contains("@")) {
                                  return "Please enter a valid Email adress";
                                } else {
                                  return null;
                                }
                              },
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //Password
                            TextFormField(
                              focusNode: _passFocusNode,
                              obscureText: _obscureText,
                              keyboardType: TextInputType.visiblePassword,
                              controller: _passTextController,
                              validator: (value) {
                                if (value!.isEmpty || value.length < 7) {
                                  return "Please enter a valid password";
                                } else {
                                  return null;
                                }
                              },
                              style: const TextStyle(color: Colors.white),
                              onEditingComplete: () => FocusScope.of(context)
                                  .requestFocus(_addressFocusNode),
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.white,
                                  ),
                                ),
                                hintText: 'Password',
                                hintStyle: const TextStyle(color: Colors.white),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            TextFormField(
                              keyboardType: TextInputType.phone,
                              focusNode: _addressFocusNode,
                              textInputAction: TextInputAction.done,
                              onEditingComplete: ()
                              {
                                if(_formKey.currentState!.validate())
                                {
                                  MedicineCubit.get(context).
                                  userRegister(
                                    email:_emailTextController.text,
                                    password:_passTextController.text,
                                    phone: _addressTextController.text,
                                    name: _fullNameController.text,
                                  );
                                }
                              },
                              controller: _addressTextController,
                              validator: (value) {
                                if (value!.isEmpty || value.length < 10) {
                                  return "Please enter a valid  Phone Number";
                                } else {
                                  return null;
                                }
                              },
                              style: const TextStyle(color: Colors.white),
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              decoration: const InputDecoration(
                                hintText: 'Phone Number',
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),

                      ConditionalBuilder(
                        condition:state is !LoadingRegisterState,
                        builder: (context)=>AuthButton(
                          buttonText: 'Sign up',
                          fct: () {
                            if(_formKey.currentState!.validate())
                            {
                              MedicineCubit.get(context).
                              userRegister(
                                email:_emailTextController.text,
                                password:_passTextController.text,
                                phone: _addressTextController.text,
                                name: _fullNameController.text,
                              );
                            }
                          },
                        ),
                        fallback:(context)=>Center(child: CircularProgressIndicator()),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Already a user?',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Sign in',
                                  style: const TextStyle(
                                      color: Colors.lightBlue, fontSize: 18),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      navigateTo(context, LoginScreen());
                                    }),
                            ]),
                      ),
                    ],
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
