import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:luminexa_mobile/screens/signUp.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luminexa_mobile/widgets/authWidgets/authWidgets.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/buttonWidget.dart';

class logIn extends StatefulWidget {
  const logIn({super.key});

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("images/Logo.svg"),
              SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.w900,
                                fontSize: 23),
                          ),
                        ]),
                  ),
                  Container(
                    height: 170,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          sytledTextField(
                            controller: emailController,
                            hintText: "Email",
                            label: "Email",
                            isPass: false,
                          ),
                          sytledTextField(
                            controller: passwordController,
                            hintText: "Password",
                            label: "Password",
                            isPass: true,
                          ),
                        ]),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    styledButton(innerText: "Sign In"),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "No account? ",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 14,
                              fontWeight: FontWeight.w800),
                        ),
                        Text.rich(TextSpan(
                            style: TextStyle(
                                fontFamily: "Raleway",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 63, 139, 0),
                                decoration: TextDecoration.underline),
                            text: "Sign Up",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return SignUp();
                                }));
                              }))
                      ],
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}