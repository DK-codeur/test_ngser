import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_ngser/providers/auth.dart';
import 'package:test_ngser/screens/auth/login_screen.dart';
import 'package:test_ngser/screens/profile_screen.dart';
import 'package:test_ngser/utils/my_colors.dart';

void main() async{
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: MyColors.primary, 
    )
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth()
        )
      ],
      child: MaterialApp(
        title: 'TeamSA',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "CenturyGothic",
          primarySwatch: MyColors.primary,
        ),
        home: LoginScreen()
      ),
    );
  }
}
