import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sitravel_app/colors.dart';
import 'package:sitravel_app/main.dart';
import 'package:sitravel_app/profile/profile_edit.dart';
import 'package:sitravel_app/widgets/big_text.dart';
import 'package:sitravel_app/widgets/icon_text_widget.dart';
import 'package:sitravel_app/widgets/small_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.lightColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.lightColor,
          foregroundColor: AppColors.mainColor,
          title: BigText(
            text: "Profile",
            color: AppColors.mainColor,
          ),
          actions: []),
      body: Stack(
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
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: BigText(
                    text: "Arthur Eldrich",
                    weight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 5),
                      child: IconTextWidget(
                        icon: Icons.location_on,
                        iconColor: AppColors.textColor2,
                        text: "Mars, Tatang Surya",
                        color: AppColors.textColor2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: size.width * 1,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: AppColors.greyColor,
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: InkWell(
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(width: 10),
                          BigText(
                            text: "Edit Profil",
                            size: 16,
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => ProfileEdit())));
                      },
                    ),
                  ),
                ),
                Container(
                  width: size.width * 1,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: AppColors.greyColor,
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: InkWell(
                      child: Row(
                        children: [
                          Icon(
                            Icons.history,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(width: 10),
                          BigText(
                            text: "History",
                            size: 16,
                          )
                        ],
                      ),
                      onTap: () {
                        print("TAPPED!!!");
                      },
                    ),
                  ),
                ),
                Container(
                  width: size.width * 1,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: AppColors.greyColor,
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: InkWell(
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(width: 10),
                          BigText(
                            text: "Pengaturan",
                            size: 16,
                          )
                        ],
                      ),
                      onTap: () {
                        print("TAPPED!!!");
                      },
                    ),
                  ),
                ),
                Container(
                  width: size.width * 1,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: AppColors.greyColor,
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: InkWell(
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(width: 10),
                          BigText(
                            text: "Logout",
                            size: 16,
                          )
                        ],
                      ),
                      onTap: () {
                        print("TAPPED!!!");
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
