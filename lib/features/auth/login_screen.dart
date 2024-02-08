// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:remotelock/features/auth/provider/user_provider.dart';
import 'package:remotelock/features/auth/signup_sceen.dart';
import 'package:remotelock/features/auth/widgets/remontelock_button.dart';
import 'package:remotelock/features/auth/widgets/remotelock_social_button.dart';
import 'package:remotelock/features/auth/widgets/remotelock_textField.dart';
import 'package:remotelock/widgets/bottom_navbar.dart';
import 'package:remotelock/widgets/loader.dart';
import 'package:remotelock/widgets/widget_logo.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<LoginScreen> {
  // bool isLoading = false;

  final _formFieldKeyTitre = GlobalKey<FormFieldState<String>>();

  final _formFieldKeyPassword = GlobalKey<FormFieldState<String>>();

  String emailError = '';
  String passwordError = '';

  @override
  Widget build(BuildContext context) {
    ref.listen(userNotifierProvider, (previous, next) {
      if (next.hasError && previous?.hasError == false) {
        var snackBar = SnackBar(
          content: Text(next.error.toString()),
          backgroundColor: Colors.red,
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

      if (next.hasValue && next.value != null && previous?.value == null) {
        //TODO navigate home
        Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavBar()));
      }
    });

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
            // if (isLoading)
            //   const Positioned(
            //     child: Loader(),
            //   ),
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
    return Consumer(builder: (_, ref, __) {
      return ref.watch(userNotifierProvider).maybeWhen(
            orElse: () {
              return RemoteLockButton(
                  onTap: () {
                    ref.read(userNotifierProvider.notifier).login(
                          email: _formFieldKeyTitre.currentState?.value ?? '',
                          password: _formFieldKeyPassword.currentState?.value ?? '',
                        );
                  },
                  labelText: "Log In");
            },
            loading: () => const Loader(),
          );
    });

    // return RemoteLockButton(
    //     onTap: () {

    //       // isLoading ? null : () => _connectData();
    //       _connectData();
    //     },
    //     labelText: "Log In");
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
