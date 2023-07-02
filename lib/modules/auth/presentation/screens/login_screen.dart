import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testprojectfirebase/layout/home_layout.dart';

import '../../../../shared/componantes/componants.dart';
import '../../auth_functions.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool is_obsecure = true;

  _logInFun() async {
    AuthFunctions authFunctions = AuthFunctions();
    await authFunctions.login(emailcontroller.text, passwordcontroller.text);
    if (FirebaseAuth.instance.currentUser?.uid != null) {
      await Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeLayout()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DefaultFormfield(
                      controller: emailcontroller,
                      inputtype: TextInputType.emailAddress,
                      Onsubmit: (value) {
                        print(value);
                      },
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'email must be written';
                        }
                        return null;
                      },
                      label: 'username',
                      preicon: Icons.account_circle),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultFormfield(
                    controller: passwordcontroller,
                    inputtype: TextInputType.visiblePassword,
                    isPassword: is_obsecure,
                    Onsubmit: (value) {
                      print(value);
                    },
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Password must be written';
                      }
                    },
                    label: 'Password',
                    preicon: Icons.lock,
                    sufix:
                        is_obsecure ? Icons.visibility : Icons.visibility_off,
                    sufpressed: () {
                      setState(() {
                        is_obsecure = !is_obsecure;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultButton(
                      backgroundcolor: Color(0xFFC2185B),
                      function: _logInFun,
                      text: 'login'),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'You don\'t have an account ?',
                        style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()),
                            );
                          },
                          child: const Text(
                            'Sign UP Now',
                            style: TextStyle(fontSize: 16),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
