import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luminexa_mobile/remoteDataSource/authDataSource.dart';
import 'package:luminexa_mobile/routes/routes.dart';
import 'package:luminexa_mobile/widgets/authWidgets/authWidgets.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/buttonWidget.dart';
import 'package:luminexa_mobile/widgets/titleWidget/titleWidget.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ConfirmPasswordController =
      TextEditingController();

  void register() async {
    final String userName = userNameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;
    final String confirmPassword = ConfirmPasswordController.text;

    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );

      await AuthDataSource.register(userName, email, password, confirmPassword);

      Navigator.of(context).popAndPushNamed(
        RouteManager.landingPage,
        arguments: {
          "isHost": [false]
        },
      );
    } catch (e) {
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
                height: 50,
              ),
              titleWidget(title: "Sign Up"),
              Container(
                height: 370,
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        styledTextField(
                          decoration: Theme.of(context).inputDecorationTheme,
                          controller: userNameController,
                          label: "Name",
                          hintText: "",
                          isPass: false,
                        ),
                        styledTextField(
                          decoration: Theme.of(context).inputDecorationTheme,
                          controller: emailController,
                          label: "Email",
                          hintText: "ex : name@email.com",
                          isPass: false,
                        ),
                        styledTextField(
                          decoration: Theme.of(context).inputDecorationTheme,
                          controller: passwordController,
                          label: "Password",
                          hintText: "",
                          isPass: true,
                        ),
                        styledTextField(
                          decoration: Theme.of(context).inputDecorationTheme,
                          controller: ConfirmPasswordController,
                          label: "Confirm Password",
                          hintText: "",
                          isPass: true,
                        )
                      ]),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    styledButton(
                      innerText: "Sign Up",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          register();
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
                          "Joined Us Before? ",
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
                            text: "Log In",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context)
                                    .popAndPushNamed(RouteManager.login);
                              },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
