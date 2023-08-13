import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String email = "";

  getCachedEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email') ?? '--';
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getCachedEmail();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
         Text("page1 \n $email"),
         );
  }
}