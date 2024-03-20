import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyProfile00 extends StatelessWidget {
  const MyProfile00({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 50, 5, 210),
              foregroundColor: Colors.white,
              title: const Center(child: Text('MY PROFILE'))),
          body: const MyWidget(),
        ));
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool error = false, dataloaded = false;
  var datauser;
  int n = 0;
  var sum1;
  var sum2;
  var username1a;

  var name_;
  var username_;
  var birthday_;
  var flagging_;
  var c_profile_;

  //.........................................................................................

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
    loaddata();
  }

  //.........................................................................................

  //=========================================================================================
  void loaddata() {
    Future.delayed(Duration.zero, () async {
      final dataurl =
          Uri.parse("https://mediumsitompul.com/basicmobile/profile.php");
      var res = await http.post(dataurl, body: {
        "username": username_pref_.toString(),
      });

      if (res.statusCode == 200) {
        setState(() {
          var datauser = json.decode(res.body);

          print("datauser +++++++++++++++++++++++++++++");
          print(datauser);

          //............................................
          //MENGAMBIL Data Field yang ada di table
          name_ = (datauser[0]["name"]);
          username_ = (datauser[0]["username"]);
          birthday_ = (datauser[0]["birthday"]);
          flagging_ = (datauser[0]["flagging"]);
          c_profile_ = (datauser[0]["c_profile"]);

          //............................................

          dataloaded = true;
        });
      } else {
        //there is error
        setState(() {
          error = true;
        });
      }
    });
  }
  //=========================================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 60,
          ),

          //................................................................................
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          "Username: ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ))),
              ),
              SizedBox(
                height: 36,
                width: 165,
                child: TextField(
                  //controller: hpController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: username_.toString()),
                ),
              )
            ],
          ),
          //................................................................................

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          "N a m e: ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ))),
              ),
              SizedBox(
                height: 36,
                width: 165,
                child: TextField(
                  //controller: hpController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: name_.toString()),
                ),
              )
            ],
          ),
          //.................................................................................
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          "Birthday: ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ))),
              ),
              SizedBox(
                height: 36,
                width: 165,
                child: TextField(
                  //controller: hpController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: birthday_.toString()),
                ),
              )
            ],
          ),
          //................................................................................
          //.................................................................................
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          "Flagging: ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ))),
              ),
              SizedBox(
                height: 36,
                width: 165,
                child: TextField(
                  //controller: hpController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: flagging_.toString()),
                ),
              )
            ],
          ),
          //................................................................................
          //.................................................................................
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          "C_Profile: ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ))),
              ),
              SizedBox(
                height: 36,
                width: 165,
                child: TextField(
                  //controller: hpController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: c_profile_.toString()),
                ),
              )
            ],
          ),
          //................................................................................

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(120, 40, 2, 2),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                        onPressed: () {
                          //_update1();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white),
                        child: const Text("UPDATE PROFILE"))),
              ),
            ],
          ),

          //................................................................................
          //................................................................................

          //................................................................................
        ],
      ),
    );
  }
}
