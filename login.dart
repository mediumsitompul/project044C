import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:convert/convert.dart';
import 'dart:async';
import 'package:crypto/crypto.dart' as crypto;

import 'login_success.dart';
import 'login_failed.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'menu_profile00.dart';
import 'menu_profile01.dart';

class MyLogin extends StatelessWidget {
  const MyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyWidget(),
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
  TextEditingController username_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  late SharedPreferences pref;
  late bool newuser;

  Future<void> _login() async {
    //var url = Uri.parse("http://mediumsitompul.com/qcri/login3.php");
    //var url = Uri.parse("http://mediumsitompul.com/basicmobile/login3.php");
    var url = Uri.parse("http://mediumsitompul.com/basicmobile/login2.php");

    var response = await http.post(url, body: {
      "username": username_controller.text,
      //"password": password_controller.text,
      "password": generateMd5(generateMd5encode64(password_controller.text)),
    });

    var returnResult = jsonDecode(response.body);

    print("password encrypted ++++++ ");
    print(generateMd5(generateMd5encode64(password_controller.text)));

    print("returnResult +++++++++++++++++++");
    print(returnResult);

    if (returnResult == 'failed') {
      //........................................
      print("go to failed page");
      if (!mounted) return;
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const LoginFailed(),
      ));
    } else if (returnResult != 'failed') {
      //........................................
      print("go to success page");

      late SharedPreferences pref;
      pref = await SharedPreferences.getInstance();
      var name_pref = (returnResult[0]["name"]);
      var username_pref = (returnResult[0]["username"]);
      // //WRITE data name_, username_ to pref
      await pref.setString('name_pref_', name_pref);
      await pref.setString('username_pref_', username_pref);

      if (returnResult[0]["c_profile"] == 'p-00') {
        print("go to menu page-00");
      if (!mounted) return;
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const MenuProfile00(),
      ));

      } else if (returnResult[0]["c_profile"] == 'p-01') {
        print("go to menu page-01");
      if (!mounted) return;
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const MenuProfile01(),
      ));
      } else {
        print("go to menu page-0x");
      }

      // if (!mounted) return;
      // Navigator.of(context).push(MaterialPageRoute(
      //   builder: (context) => const LoginSuccess(),
      // ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'LOGIN\nNavigation Drawer',
        ),
        //backgroundColor: Colors.teal,
        backgroundColor: Color.fromARGB(250, 50, 50, 250),
        foregroundColor: Colors.white,
      ),

      drawer: Drawer(
        child: ListView(
          //padding: EdgeInsets.zero,
          children: [
            //.......................................
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Text(
                '\nDrawer Menu',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            //.......................................
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Home'),
              onTap: () {
                //Navigator.pop(context);
                print("Home pressed...");
                if (!mounted) return;
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyApp(),
                ));
              },
            ),
            //.......................................
            ListTile(
              leading: const Icon(
                Icons.app_registration,
              ),
              title: const Text('Signup'),
              onTap: () {
                print("Signup pressed...");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.list_alt,
              ),
              title: const Text('User List'),
              onTap: () {
                print("User List pressed...");
                Navigator.pop(context);
              },
            ),

            //.......................................
            ListTile(
              leading: const Icon(
                Icons.reset_tv,
              ),
              title: const Text('Reset Password'),
              onTap: () {
                print("Reset Password pressed...");
                Navigator.pop(context);
              },
            ),
            //.......................................
            ListTile(
              leading: const Icon(
                Icons.change_circle,
              ),
              title: const Text('Password change'),
              onTap: () {
                print("Password change pressed...");
                Navigator.pop(context);
              },
            ),
            //.......................................
            ListTile(
              leading: const Icon(
                Icons.add_alert,
              ),
              title: const Text('Flagging change'),
              onTap: () {
                print("Flagging change pressed...");
                Navigator.pop(context);
              },
            ),
            //.......................................
          ],
        ),
      ),
      //.............................................

      body: Center(
        child: Column(
          children: [
            const Expanded(
              child: Image(
                image: AssetImage('assets/images/medium.jpg'),
                width: 180,
                height: 180,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: username_controller,
                keyboardType: TextInputType.number,
                obscureText: false,
                maxLength: 16,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Username'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: password_controller,
                //obscureText: true,
                maxLength: 6,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Passwords'),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () {
                _login();
              },
              child: const Text(
                "L O G I N",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //.......................................
}

generateMd5(String data) {
  var content = const Utf8Encoder().convert(data);
  var md5 = crypto.md5;
  var digest = md5.convert(content);
  return hex.encode(digest.bytes);
}

generateMd5encode64(String data) {
  var content = const Utf8Encoder().convert(data);
  var md5 = crypto.md5;
  var digest = md5.convert(content);
  var _digest = hex.encode(digest.bytes);
  var encode64 = base64.encode(utf8.encode(_digest));
  return encode64;
}
