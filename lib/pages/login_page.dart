import 'package:flutter/material.dart';

import '../utils/routes.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  bool changeButton = false;
  // ignore: unused_field
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Image.asset("assets/images/CHANGE 2.jpeg"),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Let's Begin  $name",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Username",
                            labelText: "Email",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "UserName cannot be empty";
                          }

                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password should be greater than 6";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(height: 30),
                      //  AppButton(
                      // txtData: "Login",
                      // ontap: () {
                      //setState(() {
                      //  changeButton = true;
                      //  });
                      // Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //  }),
                      Material(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0XFF00FF19),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            height: 64,
                            width: changeButton ? 70 : 144,
                            child: Center(
                              child: changeButton
                                  ? const Icon(
                                      Icons.done,
                                      color: Colors.black,
                                    )
                                  : const Text(
                                      "Login",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Image.asset("assets/images/with.jpeg"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
