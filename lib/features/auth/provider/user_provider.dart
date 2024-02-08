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

  //TODO Register
  // Future<void> register({//TODO params }) {

  // }

  //TODO Logout
  // Future<void> logout() {

  // }

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
