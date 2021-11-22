// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:test_ngser/utils/my_colors.dart';
import 'package:test_ngser/widgets/main_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mon Profil"
        ),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: CircleAvatar(
              radius: 14,
              backgroundColor: MyColors.white,
              child: Icon(Icons.person, color: MyColors.primary,)
            )
          ),

          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.notifications, color: MyColors.white, )
          )
        ],
      ),

      drawer: MainDrawer(),

      body: ListView(
        children: [
          Container( //color
            color: MyColors.primary,
            width: double.infinity,
            padding: EdgeInsets.all(18),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.amber,
                      child: CircleAvatar(
                        radius: 48,
                        child: CircleAvatar(
                          backgroundColor: MyColors.white,
                          radius: 30,
                          child: CircleAvatar(
                            backgroundColor: MyColors.primary,
                            radius: 28,
                            child: Icon(Icons.person, color: Colors.black, size: 37,),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "TEAMSA",
                            style: TextStyle(
                              color: MyColors.white,
                              fontSize: 26,
                            ),
                          ),

                          Text(
                            "TEST",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Sold: 17,967,344",
                    style: TextStyle(color: MyColors.white, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ), //end color

          
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Infos personnelles",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: MyColors.primary
              ),
            ),
          ),

          SizedBox(height: 30,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Row(
              children: [
                Text("Numero de téléphone: ", style: TextStyle(fontWeight: FontWeight.bold),),
                Text("877655567:"),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,  vertical: 5),
            child: Row(
              children: [
                Text("Numero de téléphone: ", style: TextStyle(fontWeight: FontWeight.bold),),
                Text("877655567:"),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,  vertical: 5),
            child: Row(
              children: [
                Text("Adresse email: ", style: TextStyle(fontWeight: FontWeight.bold),),
                Text("877655567:"),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,  vertical: 5),
            child: Row(
              children: [
                Text("Date de naissance: ", style: TextStyle(fontWeight: FontWeight.bold),),
                Text("877655567:"),
              ],
            ),
          ),

          Divider(height: 80,),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Editer mes infos",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: MyColors.primary
              ),
            ),
          ),

          SizedBox(height: 30,),

          Card(
            child: ListTile(
              leading: Icon(Icons.edit, color: Colors.amber,),
              title: Text("Editer mes info persos ", style: TextStyle(fontWeight: FontWeight.bold),),
              trailing: Icon(Icons.arrow_forward_ios_outlined, color: Colors.green),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.edit, color: Colors.amber,),
              title: Text("Editer mon mot de passe ", style: TextStyle(fontWeight: FontWeight.bold),),
              trailing: Icon(Icons.arrow_forward_ios_outlined, color: Colors.green),
            ),
          )


        ],
      ),
    );
  }
}