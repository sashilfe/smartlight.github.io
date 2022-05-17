import 'package:admin/models/User_Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  /*void addUserData({
    User currentUser,
    String userName,
    String userImage,
    String userEmail,
  }) async {
    await FirebaseFirestore.instance
        .collection("usersData")
        .doc(currentUser.uid)
        .set(
      {
        "userName": userName,
        "userEmail": userEmail,
        "userImage": userImage,
        "userUid": currentUser.uid,
      },
    );
  }*/

  UserModel currentData;

  void getUserData() async {
    UserModel userModel;
    await FirebaseFirestore.instance
        .collection('UserData')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((result) {
      var field = result.data();
      userModel = UserModel(
          userEmail: field['email'],
          userPicture: field['picture'],
          userNome: field['nome'],
          userFuncao: field['funcao']);

      print(userModel.userNome);
      currentData = userModel;
      notifyListeners();
    });
  }

  UserModel get currentUserData {
    print(currentData.userNome);
    return currentData;
  }
}
