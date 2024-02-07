// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:remotelock/features/auth/signup_sceen.dart';
import 'package:remotelock/features/auth/userData.dart';
import 'package:remotelock/features/auth/widgets/remontelock_button.dart';
import 'package:remotelock/features/auth/widgets/remotelock_social_button.dart';
import 'package:remotelock/features/auth/widgets/remotelock_textField.dart';
import 'package:remotelock/widgets/bottom_navbar.dart';
import 'package:remotelock/widgets/loader.dart';
import 'package:remotelock/widgets/widget_logo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<LoginScreen> {
  bool isLoading = false;

  final _formFieldKeyTitre = GlobalKey<FormFieldState<String>>();
  
  final _formFieldKeyPassword = GlobalKey<FormFieldState<String>>();

  String emailError = '';
  String passwordError = '';

  Future<void> _connectData() async {
    print("''''''''''''''''''''''''''''''''''''''''''''''''''''''");

    http.Response? response;
    var data;
    var dataErreur;

    // Réinitialise les messages d'erreur
    setState(() {
      emailError = '';
      passwordError = '';
    });

    setState(() {
      isLoading = true;
    });
    print("Avant le try");
    try {
      print("Début le try");

      String email = _formFieldKeyTitre.currentState?.value ?? '';
      String password = _formFieldKeyPassword.currentState?.value ?? '';

      response = await http.post(Uri.parse('https://api-rtlock.ddnsfree.com/users/login'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'email': email,
            'password': password,
          }));

      if (response.statusCode == 200) {
        print('Try : Response status code: ${response.statusCode}');
        print('Try : Response body: ${response.body}');
        print('Try : Response status code: ${response.statusCode}');
        data = json.decode(response.body);
        print('Try : Response body: $data');
        if (data.containsKey('user')) {
          String id = data['user']['id'];
          print(id);
          String accessToken = data['user']['access_token'];
          print(accessToken);
          String fullname = data['user']['fullname'];
          print(fullname);
          String email = data['user']['email'];
          print(email);
          String role = data['user']['role'];
          print(role);

          print("Milieu try 1");

          UserData.id = id;
          UserData.access_token = accessToken;
          UserData.fullname = fullname;
          UserData.email = email;
          UserData.role = role;
          print("Milieu try 2");

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('token', UserData.id);
          prefs.setString('username', UserData.access_token);
          prefs.setString('username', UserData.fullname);
          prefs.setString('username', UserData.email);
          prefs.setString('username', UserData.role);

          print("Dans le try 3");

          Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavBar()));

          print("Dans le try 4");
        }
      } else if (response.statusCode == 404) {
        // throw Exception('Failed to create data');
        // throw Exception('Failed to create data');
        print('Try : Response status code: ${response.statusCode}');
        // print('Try : Response body: ${response.body}');
        dataErreur = json.decode(response.body);
        print("Merci : $dataErreur");

        String detailValue = dataErreur['detail'];
        var snackBar = SnackBar(
          content: Text(detailValue),
          backgroundColor: Colors.red,
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (response.statusCode == 422) {
        print('Try : Response status code: ${response.statusCode}');
        dataErreur = json.decode(response.body);
        print("Merci : $dataErreur");

        String detailValue = dataErreur['detail'][0]['msg'];

        var snackBar = SnackBar(
          content: Text(detailValue),
          backgroundColor: Colors.red,
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (error) {
      print('Error during HTTP request: $error');
      if (response != null) {
        print('Catch : Response status code: ${response.statusCode}');
        print('Catch : Response body: ${response.body}');
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.grey, width: 1.5),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const WidgetLogo(),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                      ),
                      _texteEntete(),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                      ),
                      _email(),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                      ),
                      _password(),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                      ),
                      _loginButton(),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                      ),
                      const Text(
                        "Or continue with",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                      ),
                      _oauthTiers(),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          const Gap(4),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                            },
                            child: const Text(
                              "Create now",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (isLoading)
              const Positioned(
                child: Loader(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _texteEntete() {
    return const Text(
      "Login",
      style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
    );
  }

  Widget _email() {
    return RemoteLockTextField(
      textFieldKey: _formFieldKeyTitre,
      labelText: "Email",
      showToggleVisibility: false,
      hintText: "raziul.cse@gmail.com",
      // errorText: emailError,
    );
  }

  Widget _password() {
    return Column(
      children: [
        RemoteLockTextField(
          textFieldKey: _formFieldKeyPassword,
          obscureText: false,
          showToggleVisibility: true,
          hintText: "Password",
          // errorText: passwordError,
        ),
      ],
    );
  }

  Widget _loginButton() {
    return RemoteLockButton(
        onTap: () {
          // isLoading ? null : () => _connectData();
          _connectData();
        },
        labelText: "Log In");
  }

  Widget _oauthTiers() {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RemoteLockSocialButton(iconPathData: Icons.facebook, labelText: "Google"),
        Gap(18),
        RemoteLockSocialButton(iconPathData: Icons.facebook, labelText: "Facebook")
      ],
    );
  }
}
