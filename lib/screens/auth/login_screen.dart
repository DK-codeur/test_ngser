// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_ngser/screens/auth/register_screen.dart';
import 'package:test_ngser/screens/profile_screen.dart';
import 'package:test_ngser/utils/my_buttons.dart';
import 'package:test_ngser/utils/my_colors.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

    final _passwordFocus = FocusNode();

  bool _toggleVisibility = true;
  bool _isLoading = false; 


  @override
  void dispose() {
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            CircleAvatar(
              radius: 33,
            ),

            SizedBox(height: 25,),

            Text(
              "Connexion",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),
            ),

            SizedBox(height: 25,),
            

            TextFormField(
              controller: _usernameController,
              cursorColor: MyColors.primary,
              textInputAction: TextInputAction.next,
              style: TextStyle(
                fontSize: 13.5
              ),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: MyColors.primary,
                ),
                
                labelText: 'Adresse email / numero de compte',
                
              ),
              onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordFocus),
            ),

            SizedBox(height: 20,),

            TextFormField(
              controller: _passwordController,
              obscureText:_toggleVisibility,
              cursorColor: MyColors.primary,
              textInputAction: TextInputAction.done,
              focusNode: _passwordFocus,
              style: TextStyle(
                fontSize: 13.5
              ),
              decoration: InputDecoration(
                labelText: "Mot de Passe",
                labelStyle: TextStyle(
                  fontWeight: FontWeight.normal
                ),
                
                hintStyle: TextStyle(
                  fontFamily: 'CenturyGothic'
                ),
                prefixIcon: Icon(
                  Icons.lock,
                  color: MyColors.primary,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _toggleVisibility = !_toggleVisibility;
                    });
                  },

                  icon: _toggleVisibility
                  ? Icon( Icons.visibility, color: MyColors.primary,)
                  : Icon( Icons.visibility_off, color: MyColors.primary,)
                ),
              ),
            ),

            InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 25),
                child: Text(
                  "Mot de passe oublié",
                  textAlign: TextAlign.right,
                ),
              ),
            ),

            SizedBox(height: 25,),

            myButton(
              "SE CONNECTER",
              onPressed: () {
                Navigator.pushReplacement(
                  context, 
                  CupertinoPageRoute(
                    builder: (context) => ProfileScreen()
                  )
                );
              },
            ),

            SizedBox(height: 15,),

            InkWell(
              onTap: () {
                Navigator.push(
                  context, 
                  CupertinoPageRoute(
                    builder: (context) => RegisterScreen()
                  )
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    color: MyColors.black,
                    fontFamily: "CenturyGothic"
                  ) ,
                  children: const [
                    TextSpan(
                      text: "Pas de compte ?   ",
                    ),
                    TextSpan(
                      text: "s'inscrire",
                      style: TextStyle(
                        decoration: TextDecoration.underline
                      )
                    ),
                  ]
                ),
              ),
              ),
            ),
          ],
        ),
      )
    );
  }
}