import 'package:flutter/material.dart';
import 'package:flutter_application_9/services/services.dart';
import 'package:flutter_application_9/models/usersModel.dart';
import 'package:flutter_application_9/services/services.dart';
import 'package:flutter_application_9/todo.dart';

class notepage extends StatefulWidget {
  @override
  State<notepage> createState() => _notpageState();
}

class _notpageState extends State<notepage> {
  int myIndex = 0;
  List<Widget> widgetList = [toDo()];
  Userservice _services = Userservice();
  List<UserModelData?> users = [];
  @override
  void initState() {
    super.initState();
    _services.fetchUsers().then((value) => {
          if (value != null && value.data != null)
            {
              setState(() {
                users = value.data!;
              })
            }
        });

        
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[50],
        appBar: AppBar(
          backgroundColor: Colors.orange[100],
          title: Text(
            "Users",
          ),
        ),
        body: Builder(builder: (context) {
          return (ListView.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                    "${users[index]!.firstName! + users[index]!.lastName!}"),
                subtitle: Text(users[index]!.email!),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(users[index]!.avatar!),
                ),
              );
            },
          ));
        }),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          backgroundColor: Colors.orange[50],
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.person,
              ),
              label: "Users",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.login,
                ),
                label: "Todo")
          ],
        ));
  }
}
