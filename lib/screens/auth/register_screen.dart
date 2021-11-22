// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:test_ngser/providers/auth.dart';
import 'package:test_ngser/utils/my_buttons.dart';
import 'package:test_ngser/utils/my_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  DateTime selectedDate = DateTime.now();
  String? _setDate;

  final _usernameController = TextEditingController();
  final _userfirstnameController = TextEditingController();
  final _useremailController = TextEditingController();
  final _usermsidnController = TextEditingController();

  final _dateController = TextEditingController();

  final _passwordFocus = FocusNode();

  bool _toggleVisibility = true;
  
  bool _isLoading = false; 

  final _form = GlobalKey<FormState>();

  Future<void> _submit() async {
    if(!_form.currentState!.validate()) {
      //invalid
      return;
    }

    _form.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    FocusScope.of(context).unfocus();

    //reg
    try{
      await Provider.of<Auth>(context, listen: false).register(
        _usernameController.text,
        _userfirstnameController.text,
        _dateController.text,
        _useremailController.text,
        _usermsidnController.text,
      ).then((value) => {
        print("$value"),

        if (value.contains("error")) {

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Inscription impossible"))
          ),

        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor: MyColors.primary, content: Text("Inscription fait...Connectez vous"))
          ),
          
          Navigator.pop(context)
        }
      });
    } catch(error) {
      throw error;
    }

    setState(() {
      _isLoading = false;
    });

    // if (Provider.of<Auth>(context, listen: false).isAuth ) {
      
    // } 

  }


  @override
  void dispose() {
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  void initState() {
     _dateController.text = DateFormat('dd-MM-yyyy').format(DateTime.now());
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        elevation: 0,
         iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              CircleAvatar(
                radius: 33,
              ),

              SizedBox(height: 25,),

              Text(
                "Inscription",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold
                ),
              ),

              SizedBox(height: 25,),
              

              TextFormField(
                autocorrect: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _usernameController,
                cursorColor: MyColors.primary,
                textInputAction: TextInputAction.next,
                style: TextStyle(
                  fontSize: 13.5
                ),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: MyColors.primary,
                  ),
                  
                  labelText: 'Nom',
                  
                ),

                validator: (value) {
                  if (value.toString().isEmpty ) {
                    return 'Entrez un nom';
                  }

                  if (value.toString().length < 4 ) {
                    return '3 caractères minimum';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20,),


              TextFormField(
                autocorrect: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _userfirstnameController,
                cursorColor: MyColors.primary,
                textInputAction: TextInputAction.next,
                style: TextStyle(
                  fontSize: 13.5
                ),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: MyColors.primary,
                  ),
                  labelText: 'Prénoms',
                  
                ),

                validator: (value) {
                  if (value.toString().isEmpty ) {
                    return 'Entrez un nom';
                  }

                  if (value.toString().length < 4 ) {
                    return '3 caractères minimum';
                  }
                  return null;
                },
              ),

              GestureDetector(
                onTap: () => _selectDate(context),
                child: TextFormField(
                  enabled: false, 
                  keyboardType: TextInputType.text,
                  controller: _dateController,
                  decoration: InputDecoration(
                  
                  labelText: "Date de naissance",
                  labelStyle: TextStyle(fontSize: 14),
                  prefixIcon: Icon(Icons.date_range, color: MyColors.primary,),
                  border: UnderlineInputBorder()
                ),
                  onSaved: (val) {
                    _setDate = val;
                  },

                ),
              ),

              TextFormField(
                autocorrect: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _useremailController,
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
                  labelText: 'Adresse email',
                  
                ),

                validator: (value) {
                  if (value.toString().isEmpty || !value.toString().contains('@')) {
                    return 'Email invalide';
                  }
                  return null;
                },
              ),

              TextFormField(
                autocorrect: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _usermsidnController,
                cursorColor: MyColors.primary,
                textInputAction: TextInputAction.next,
                style: TextStyle(
                  fontSize: 13.5
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.call,
                    color: MyColors.primary,
                  ),
                  labelText: 'Numéro Téléphone',
                  
                ),

                validator: (value) {
                  if (value.toString().isEmpty ) {
                    return 'Entrez un nom';
                  }

                  if (value.toString().length != 10 ) {
                    return 'le numero doit comporté 10 chiffre';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20,),

              _isLoading ? Center(child: CircularProgressIndicator(),) 
              : myButton(
                "S'INSCRIRE",
                onPressed: () {
                  _submit();
                }
              ),

              SizedBox(height: 10,),

              InkWell(
                onTap: () {
                  Navigator.pop(context);
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
                        text: "déjà inscrit ?",
                      ),
                      TextSpan(
                        text: "   se connecter",
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
        ),
      )
    );
  }

  Future<dynamic> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      // locale : const Locale("fr","FR"),
      initialDate: selectedDate, //revoi
      helpText: "DATE",
      cancelText: 'FERMER',
      errorFormatText: 'Entrer une date valide',
      fieldLabelText: 'Entrer une date',
      errorInvalidText: 'Entrer une date valide',
      // initialDatePickerMode: DatePickerMode.year,
      firstDate: DateTime(1991),
      lastDate: DateTime(2031)
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
        
      });
    }
    
  }
  
}