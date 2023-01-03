import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sitravel_app/colors.dart';
import 'package:sitravel_app/main.dart';
import 'package:sitravel_app/widgets/big_text.dart';
import 'package:sitravel_app/widgets/icon_text_widget.dart';
import 'package:sitravel_app/widgets/small_text.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.lightColor,
      appBar: AppBar(
          elevation: 10,
          backgroundColor: Color(0xFF0A2054),
          foregroundColor: Color.fromARGB(255, 255, 255, 255),
          title: BigText(
            text: "Edit Profil",
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          actions: []),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * .25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0)),
                color: AppColors.tealColor,
                image: DecorationImage(
                  image: AssetImage("assets/images/banner1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 140,
                      width: 140,
                      margin: EdgeInsets.only(top: size.height * .15),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(100.0),
                        image: DecorationImage(
                            image: AssetImage("assets/images/banner2.jpg"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      Container(
                        width: size.width * 1,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Nama'),
                        ),
                      ),
                      Container(
                        width: size.width * 1,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Email'),
                        ),
                      ),
                      Container(
                        width: size.width * 1,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'No. Handphone'),
                        ),
                      ),
                      Container(
                        width: size.width * 1,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Asal Kota'),
                        ),
                      ),
                      Container(
                        width: size.width * 1,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Alamat'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
