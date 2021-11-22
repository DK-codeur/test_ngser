// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_ngser/utils/my_colors.dart';



class MainDrawer extends StatefulWidget {

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(elevation: 0, automaticallyImplyLeading: false,),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              color: MyColors.primary,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: MyColors.white,
                  child: Icon(Icons.person, color: Colors.black,),
                ),
                title: Text(
                  'TEAMSA',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 15,
                      color: MyColors.white
                  ),
                ),
                subtitle: Text(
                  'abc@gmail.com',
                  style: TextStyle(
                      fontSize: 13,
                      color: MyColors.white.withOpacity(0.8)
                  ),
                ),

                trailing: CircleAvatar(
                  child: Icon(Icons.add_comment_outlined),
                ),
              ),
            ),

            Expanded(
              child: Container(
                color: MyColors.primary,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView(
                    children: [
                      buildDrawerItem("Accueil", icon: Icons.home),
                      buildDrawerItem("Service", icon: Icons.rate_review_outlined),
                      buildDrawerItem("Historique", icon: Icons.list),
                      buildDrawerItem("Mon profil", icon: Icons.rate_review_outlined),
                      Divider(color: MyColors.white,),
                      buildDrawerItem("Notification", icon: Icons.notifications),
                      buildDrawerItem("Deconnexion", icon: Icons.logout),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }


  Widget buildDrawerItem(String title, {IconData? icon = Icons.info_outline, void Function()? onTap}) {
    return ListTile(
      // contentPadding: EdgeInsets.zero,
      minLeadingWidth: 0,
      onTap: onTap,
      leading: Icon(
        icon,
        color: MyColors.white,
      ),
      title: Text(
        '$title',
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: MyColors.white,
        ),
      ),
      
    );
  }


}