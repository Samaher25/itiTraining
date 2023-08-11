import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/home_screen.dart';
import 'package:flutter_application_2/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
    final _formKey = GlobalKey<FormState>();
    TextEditingController emailcontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,toolbarHeight: 20,),
      body: 
       Form( key: _formKey ,
         child: Padding(
             padding: EdgeInsets.all(16.0),
             child: SingleChildScrollView(
               child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Image.asset('assets/logo.jpg',width: 200,height: 150),
                         Padding( padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    labelText: 'Email'
                  ),
                  validator: (value) {
                    if(value == null || value.contains("@") == false){
                      return " Enter valid Email ";
                    }
                  }, 
                ),
                         ),
                         //SizedBox(height: 16.0),
                         Padding(padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password'
                  ),
                  validator: (value ){
                    if( value == null || value.length < 8){
                      return " Enter valid Password ";
                    }
                  },
                ),
              ),
                SizedBox(height: 16.0),
             MyCustomButton(
              buttonLabel: "Login",   
                   onTap: () async {
                   if (_formKey.currentState!.validate()) {
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setString('email', emailcontroller.text);

                         Navigator.push(
                               context,
                             MaterialPageRoute(
                              builder: (context) =>  HomeScreen(
                              email: emailcontroller.text,
                             )),
                                  );
                       ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Text('Success')),
                          );
                        }
                      },
                    ),
                 Padding(
                    padding: const EdgeInsets.all(8.0),
                     child: Container(
                     width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                            ),
                          child: Center(
                              child: Text("No Account?Sign Up",
                              style: TextStyle(color: Colors.black,
                              fontSize: 20),),
                              ),
                       ),
                 ),
                   
                        ]
                       ),
             ),
                
             ),
       )
    );

  }
}
