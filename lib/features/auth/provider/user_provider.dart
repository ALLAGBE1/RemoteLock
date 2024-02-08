import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:remotelock/models/userData.dart';

class UserNotifier extends AsyncNotifier<UserData?> {
  @override
  FutureOr<UserData?> build() {
    //TODO : check whether the user already exists (checks shared preferences)
    return null;
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      UserData? userData;

      final response = await http.post(Uri.parse('https://api-rtlock.ddnsfree.com/users/login'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'email': email,
            'password': password,
          }));
      final data = json.decode(response.body);

      if (response.statusCode != 200) {
        throw Exception('Erreur NOT 200 TEST');
      }

      if (data.containsKey('user')) {
        final dataUser = data['user'] as Map<String, dynamic>;
        String id = dataUser['id'];
        String accessToken = dataUser['access_token'];
        String fullname = dataUser['fullname'];
        String email = dataUser['email'];
        String role = dataUser['role'];

        userData = UserData(
          id: id,
          access_token: accessToken,
          fullname: fullname,
          email: email,
          role: role,
        );

        //TODO => save uses into shared preferences
      }
      return userData;
    });
  }

  Future<void> updateName(String newName) async {
    // Faire de façon syncrhone

    // state = state.value!.copyWith(fullName:newName);
    // unawaited(CALL API);
    // unawaited(UPDATE PREFERENCES);

    //TODO mettre à jour les préférences

    // Façon asynchrone
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
//TODO call API to change name
// return new UserData
      return;
    });
  }
}

final userNotifierProvider = AsyncNotifierProvider<UserNotifier, UserData?>(UserNotifier.new);

// Future<void> _connectData() async {
//   print("''''''''''''''''''''''''''''''''''''''''''''''''''''''");

//   http.Response? response;
//   var data;
//   var dataErreur;

//   // Réinitialise les messages d'erreur
//   setState(() {
//     emailError = '';
//     passwordError = '';
//     isLoading = true;
//   });

//   print("Avant le try");
//   try {
//     print("Début le try");

//     String email = _formFieldKeyTitre.currentState?.value ?? '';
//     String password = _formFieldKeyPassword.currentState?.value ?? '';

//     response = await http.post(Uri.parse('https://api-rtlock.ddnsfree.com/users/login'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(<String, dynamic>{
//           'email': email,
//           'password': password,
//         }));

//     if (response.statusCode == 200) {
//       print('Try : Response status code: ${response.statusCode}');
//       print('Try : Response body: ${response.body}');
//       print('Try : Response status code: ${response.statusCode}');
//       data = json.decode(response.body);
//       print('Try : Response body: $data');
//       if (data.containsKey('user')) {
//         String id = data['user']['id'];
//         print(id);
//         String accessToken = data['user']['access_token'];
//         print(accessToken);
//         String fullname = data['user']['fullname'];
//         print(fullname);
//         String email = data['user']['email'];
//         print(email);
//         String role = data['user']['role'];
//         print(role);

//         print("Milieu try 1");

//         UserData.id = id;
//         UserData.access_token = accessToken;
//         UserData.fullname = fullname;
//         UserData.email = email;
//         UserData.role = role;
//         print("Milieu try 2");

//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         prefs.setString('token', UserData.id);
//         prefs.setString('username', UserData.access_token);
//         prefs.setString('username', UserData.fullname);
//         prefs.setString('username', UserData.email);
//         prefs.setString('username', UserData.role);

//         print("Dans le try 3");

//         Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavBar()));

//         print("Dans le try 4");
//       }
//     } else if (response.statusCode == 404) {
//       // throw Exception('Failed to create data');
//       // throw Exception('Failed to create data');
//       print('Try : Response status code: ${response.statusCode}');
//       // print('Try : Response body: ${response.body}');
//       dataErreur = json.decode(response.body);
//       print("Merci : $dataErreur");

//       String detailValue = dataErreur['detail'];
//       var snackBar = SnackBar(
//         content: Text(detailValue),
//         backgroundColor: Colors.red,
//       );

//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     } else if (response.statusCode == 422) {
//       print('Try : Response status code: ${response.statusCode}');
//       dataErreur = json.decode(response.body);
//       print("Merci : $dataErreur");

//       String detailValue = dataErreur['detail'][0]['msg'];

//       var snackBar = SnackBar(
//         content: Text(detailValue),
//         backgroundColor: Colors.red,
//       );

//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     }
//   } catch (error) {
//     print('Error during HTTP request: $error');
//     if (response != null) {
//       print('Catch : Response status code: ${response.statusCode}');
//       print('Catch : Response body: ${response.body}');
//     }
//   }

//   setState(() {
//     isLoading = false;
//   });
// }
