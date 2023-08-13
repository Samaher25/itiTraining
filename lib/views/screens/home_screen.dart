import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/screens/page1.dart';
import 'package:flutter_application_2/views/screens/page2.dart';
import 'package:flutter_application_2/views/screens/page3.dart';
import 'package:flutter_application_2/views/screens/page4.dart';

class HomeScreen extends StatefulWidget {
  String email;
  HomeScreen({super.key,required this.email});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int currentIndex =0;
 static const TextStyle optionStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);


  static const List<Widget> pages = <Widget> [
  Page1(),
  Page2(),
  Page3(),
  Page4()
  ];

    void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.redAccent, 
      toolbarHeight:30 ,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_ios) ,
      ),
      ),

      
      body: Center(
        child: pages.elementAt(currentIndex),
      ),

     /* body: Center(
        child: Text(widget.email),
      ),*/


      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",
        backgroundColor:Colors.blueAccent ),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search",
        backgroundColor: Colors.amberAccent),
        BottomNavigationBarItem(icon: Icon(Icons.security), label: "Security",
        backgroundColor: Colors.greenAccent),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile",
        backgroundColor: Colors.orangeAccent), 
      ],
          currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,),

    );
  }
}