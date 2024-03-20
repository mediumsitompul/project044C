import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'profile00.dart';
import 'package:shared_preferences/shared_preferences.dart';



class MenuProfile01 extends StatelessWidget {
  const MenuProfile01({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(250, 50, 50, 250),
          foregroundColor: Colors.white,
          title: const Center(child: Text("MENU PROFILE-01")),
          actions: [
            //IconButton(onPressed: () {}, icon: Icon(Icons.person))
            IconButton(
                onPressed: () {
                  print("+++++++++++++ profile");
                  //Navigator.pushReplacement(context, newRoute)
                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyProfile00(),));
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyProfile00(),));
                },
                icon: Icon(Icons.person))
          ],


          // actions: [
          //   IconButton(onPressed: () {}, icon: Icon(Icons.person))
          // ],



        ),
        body: const MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

//

  late SharedPreferences pref;
  late String username_pref_ = "";
  late String name_pref_ = "";

  Future<void> initial() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      username_pref_ = pref.getString('username_pref_').toString();
      name_pref_ = pref.getString('name_pref_').toString();
    });
  }

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

//


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("MENU PROFILE-01")),
          Text(username_pref_),
          Text(name_pref_),

        ],
      ),
    );
  }
}
