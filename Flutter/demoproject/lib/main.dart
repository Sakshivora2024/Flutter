import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "World",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Text(
            "Welcome to World!!!",
            style: TextStyle(fontSize: 30.0),
          ),
        ),
        drawer: Drawer(
            child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blueAccent),
                  accountName: Text("Sakshi Vora",style: TextStyle(fontSize: 18),),
                  accountEmail: Text("sakshi01@gmail.com",style: TextStyle(fontSize: 15)),
                  currentAccountPictureSize: Size.square(40),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 1, 167, 255),
                    child: Text("S",style: TextStyle(fontSize: 30.0,color: Colors.blue),),
                  ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("My Profile"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text("My Course"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text("Go Premium"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text("Saved Profile"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text("Edit Profile"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("LogOut"),
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],
        )),
        floatingActionButton: FloatingActionButton(
          elevation: 8.0,
          child: Icon(Icons.add),
          backgroundColor: Colors.blueAccent,
          onPressed: (){
            print("I am Floating Action Button");
          },
        ),
      ),
    );
  }
}
