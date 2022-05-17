import 'dart:collection';

import 'package:admin/database/firebase_db.dart';
import 'package:admin/models/User_Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:admin/services/auth.dart';

class UserRepository extends ChangeNotifier {
  List<UserModel> _user = [];
  AuthService auth;
  FirebaseFirestore db;
  String nome;

  UserRepository({this.auth}) {
    _startRepository();
    readUser();
  }

  _startRepository() async {
    await _startFirestore();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  readUser() async {
    if (auth.currentUser != null && _user.isEmpty) {
      final snapshot =
          await db.collection('UserData').doc(auth.currentUser.uid).get();

      return snapshot.get('Name');
    }
  }

  UnmodifiableListView<UserModel> get lista => UnmodifiableListView(_user);
}
