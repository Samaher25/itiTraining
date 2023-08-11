import 'package:flutter/material.dart';

class MyCustomButton extends StatefulWidget {
  String buttonLabel;
  void Function()? onTap;
  MyCustomButton({super.key,
  required this.buttonLabel,
  required this.onTap});

  @override
  State<MyCustomButton> createState() => _MyCustomButtonState();
}

class _MyCustomButtonState extends State<MyCustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
                   onTap: widget.onTap,
                     child: Padding(
                    padding: const EdgeInsets.all(8.0),
                     child: Container(
                     width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                            ),
                          child: Center(
                              child: Text(widget.buttonLabel,
                              style: TextStyle(color: Colors.white,
                              fontSize: 20),),
                              ),
                       ),
                     ),
                 );
  }
}