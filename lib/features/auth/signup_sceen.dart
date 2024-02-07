// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:remotelock/features/auth/login_screen.dart';
import 'package:remotelock/features/auth/widgets/remontelock_button.dart';
import 'package:remotelock/features/auth/widgets/remotelock_textField.dart';
import 'package:remotelock/widgets/loader.dart';
import 'package:remotelock/widgets/widget_logo.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = false;
  final _formFieldKeyFullName = GlobalKey<FormFieldState<String>>();
  final _formFieldKeyEmail = GlobalKey<FormFieldState<String>>();
  final _formFieldKeyPassword = GlobalKey<FormFieldState<String>>();
  final _formFieldKeyPasswordConfirmation = GlobalKey<FormFieldState<String>>();

  Future<void> _createData() async {
    http.Response? response;
    var data;
    var dataErreur;

    setState(() {
      isLoading = true;
    });

    try {
      String fullname = _formFieldKeyFullName.currentState?.value ?? '';
      String email = _formFieldKeyEmail.currentState?.value ?? '';
      String password = _formFieldKeyPassword.currentState?.value ?? '';
      String passwordConfirm = _formFieldKeyPasswordConfirmation.currentState?.value ?? '';

      response = await http.post(Uri.parse('https://api-rtlock.ddnsfree.com/users/register'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'fullname': fullname,
            'email': email,
            'password': password,
            "passwordConfirm": passwordConfirm,
            "blockchain_pub_key": "string",
            "blockchain_priv_key_enc_pass": "stringf",
            "blockchain_priv_key_enc_mot": "stringe"
          }));

      if (response.statusCode == 200) {
        print('Try : Response status code: ${response.statusCode}');
        print('Try : Response body: ${response.body}');
        data = json.decode(response.body);
        print('Try : Response body: $data');
        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
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
        print('Response status code: ${response.statusCode}');
        print('Response body: ${response.body}');
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
        dragStartBehavior: DragStartBehavior.down,
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
                      _fullName(),
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
                      _confimPassword(),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                      ),
                      _loginButton(),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          const Gap(4),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                            },
                            child: const Text(
                              "Login now",
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
      "Register",
      style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
    );
  }

  Widget _fullName() {
    return RemoteLockTextField(
      textFieldKey: _formFieldKeyFullName,
      labelText: "Fullname",
      showToggleVisibility: false,
      hintText: "John Doe",
    );
  }

  Widget _email() {
    return RemoteLockTextField(
      textFieldKey: _formFieldKeyEmail,
      labelText: "Email",
      showToggleVisibility: false,
      hintText: "raziul.cse@gmail.com",
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
        ),
      ],
    );
  }

  Widget _confimPassword() {
    return Column(
      children: [
        RemoteLockTextField(
          textFieldKey: _formFieldKeyPasswordConfirmation,
          obscureText: false,
          showToggleVisibility: true,
          hintText: "Password Confirmation",
        ),
      ],
    );
  }

  Widget _loginButton() {
    return RemoteLockButton(
        onTap: () {
          // isLoading ? null : () => _createData();
          _createData();
        },
        labelText: "Register");
  }
}
