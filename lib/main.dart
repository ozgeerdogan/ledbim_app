import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_9/models/usersModel.dart';
import 'package:flutter_application_9/services/services.dart';
import 'notepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

  var email = "";
  var password = "";

}

class _MyAppState extends State<MyApp> {
  //int curindex = 0;
  Userservice _services = Userservice();
  List<UserModelData> users = [];
  String? mail;
  String? pass;
  
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Form(
        key: _formkey,
        child: Scaffold(
            backgroundColor: Colors.orange[50],
            appBar: AppBar(
              backgroundColor: Colors.orange[50],
              centerTitle: true,
              title: Text(
                "ToDo List",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.list_alt),
                color: Colors.black,
              ),
            ),
            body: Builder(builder: (context) {
              return Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    SizedBox(
                      height: 90,
                    ),
                    Image.asset(
                      "images/not.png",
                      width: 120,
                      height: 120,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Your Mail",
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Please enter your mail");
                          } else {
                            return null;
                          }
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Your Password",
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please enter your password");
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        mail = value;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 250, height: 40),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            _formkey.currentState?.save();
                          }
                          ;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new notepage()));
                        },
                        child: Text(
                          "SİGN İN",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                      ),
                    )
                  ],
                ),
              );
            }),
            ),
      ),
    );
  }
}
