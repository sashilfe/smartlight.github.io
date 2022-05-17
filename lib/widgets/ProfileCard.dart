import 'package:flutter/material.dart';

import 'package:admin/providers/user_provider.dart';

// ignore: must_be_immutable
class ProfileCard extends StatefulWidget {
  UserProvider userProvider;

  ProfileCard({
    this.userProvider,
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.currentUserData;

    return Container(
      padding: EdgeInsets.only(left: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(userData.userNome,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Color(0xFF252733),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700)),
                  Text(userData.userFuncao,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Color(0xFF252733),
                          fontSize: 9.0,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              SizedBox(
                width: 10.0,
              ),
              /*DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: primaryColor,
                    width: 02.0,
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(04.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.network(
                      '${picture}',
                      fit: BoxFit.cover,
                      height: 44.0,
                      width: 44.0,
                    ),
                  ),
                ),
              ),*/
            ],
          )
        ],
      ),
    );
  }

  /*_getProfileData() {
    db.collection('UserData').doc(Uid).get().then((result) {
      var field = result.data();
      Nome = field['nome'];
      Funcao = field['funcao'];
      Foto = field['picture'];
    });
  }*/
}
