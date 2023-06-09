import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:luminexa_mobile/models/themesModel.dart';
import 'package:luminexa_mobile/providers/ThemeProvider.dart';
import 'package:luminexa_mobile/remoteDataSource/authDataSource.dart';
import 'package:luminexa_mobile/routes/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luminexa_mobile/widgets/authWidgets/authWidgets.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/buttonWidget.dart';
import 'package:luminexa_mobile/widgets/titleWidget/titleWidget.dart';
import 'package:provider/provider.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    final String email = emailController.text;
    final String password = passwordController.text;
    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );
      final response = await AuthDataSource.login(email, password);
      final data = response.data;
      final List<bool> isHost = List<bool>.from(data['isHost']);

      Navigator.of(context).popAndPushNamed(RouteManager.landingPage,
          arguments: {"isHost": isHost});
    } catch (e) {
      print(e);
      Navigator.of(context).pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Invalid Credentials"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('images/Logo.svg'),
                      ]),
                ),
                SizedBox(
                  height: 100,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    titleWidget(title: "Log In"),
                    Container(
                      height: 200,
                      child: Form(
                        key: _formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              styledTextField(
                                decoration:
                                    Theme.of(context).inputDecorationTheme,
                                controller: emailController,
                                hintText: "ex : name@email.com",
                                label: "Email",
                                isPass: false,
                              ),
                              styledTextField(
                                decoration:
                                    Theme.of(context).inputDecorationTheme,
                                controller: passwordController,
                                hintText: "",
                                label: "Password",
                                isPass: true,
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 165,
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      styledButton(
                        innerText: "Log In",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            login();
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "No account? ",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                  fontFamily: "RalewayBold",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).primaryColor,
                                  decoration: TextDecoration.underline),
                              text: "Sign Up",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context)
                                      .popAndPushNamed(RouteManager.signUp);
                                },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
