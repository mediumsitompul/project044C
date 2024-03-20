import 'package:flutter/material.dart';
import 'login.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Building Layouts')),
        ),
        body: MyProject(),
      ),
    );
  }
}

class MyProject extends StatefulWidget {
  MyProject({Key? key}) : super(key: key);

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  @override
  Widget build(BuildContext context) {
    //NO.1A............................... buttonSection-1a ..............................
    Widget imageSection = Container(
      //padding: const EdgeInsets.all(10),
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Row(
        //If Column is not working, must 'Row'
        children: const [
          Expanded(
            //Keyword
            child: Image(
              image: NetworkImage(
                  'http://mediumsitompul.com/basicmobile/images/toba.jpg'),
            ),
          ),
        ],
      ),
    );
    //............................................................... buttonSection-1b ..............................

    //NO.2A ....................................... buttonSection-2a ..............................
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //agar rata kiri
              children: [
                const Text(
                  'Danau Toba / Tao Toba',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Samosir, Sumatera Utara, Indonesia',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('5'),
        ],
      ),
    );
    //.......................................................... buttonSection-2b ..............................

    //NO.3A................................ buttonSection-3a ..............................
    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Container(
      padding: const EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // _buildButtonColumn(color, Icons.login, 'LOGIN'),
          // _buildButtonColumn(color, Icons.call, 'CALL'),
          // _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          // _buildButtonColumn(color, Icons.share, 'SHARE'),

          GestureDetector(
            onTap: () {
              print('Click LOGIN');
              if (!mounted) return;
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MyLogin(),
              ));
            },
            child: _buildButtonColumn(color, Icons.login, 'LOGIN'),
          ),

          GestureDetector(
            onTap: () {
              print('Click CALL');
            },
            child: _buildButtonColumn(color, Icons.call, 'CALL'),
          ),

          GestureDetector(
            onTap: () {
              print('Click ROUTE');
            },
            child: _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          ),

          GestureDetector(
            onTap: () {
              print('Click SHARE');
            },
            child: _buildButtonColumn(color, Icons.share, 'SHARE'),
          ),
        ],
      ),
    );
    //.................................buttonSection-3b ..............................

    //NO.4A.............................. textSection-4a ..............................
    Widget textSection = Container(
      padding: const EdgeInsets.all(30),
      child: const Text(
        ' Danau Toba (surat Batak: Tao Toba) adalah '
        ' danau alami berukuran besar di Indonesia yang berada di '
        ' kaldera Gunung Supervulkan. Danau ini memiliki panjang '
        ' 100 kilometer (62 mil), lebar 30 kilometer (19 mi), dan '
        ' kedalaman 508 meter (1.667 ft). Danau ini terletak di tengah '
        ' pulau Sumatra bagian utara dengan ketinggian permukaan '
        ' sekitar 900 meter (2.953 ft). Danau ini membentang dari '
        ' 2.88°N 98.52°E sampai 2.35°N 99.1°E. Ini adalah danau '
        ' terbesar di Indonesia dan danau vulkanik terbesar di dunia ',
        softWrap: true,
      ),
    );
    //................................... textSection-4b ..............................

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Front Page',
      home: Scaffold(
        body: ListView(
          children: [
            imageSection, //ROW:1
            titleSection, //ROW:2
            buttonSection, //ROW:3
            textSection, //ROW:4
          ],
        ),
        //"FloatingActionButton"
      ),
    );
  }

  //,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
  //Common Properties Widget buttonSection
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
  //,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
}
