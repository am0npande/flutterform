import 'package:flutter/material.dart';
import 'package:flutter_form/second_screen.dart';

import 'datastore.dart';

void main() {
  runApp(const MaterialApp(home: MyForm()));
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<StatefulWidget> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {

  var _formkey = GlobalKey<FormState>();

  var _name = TextEditingController();
  var _mobile = TextEditingController();
  var _password = TextEditingController();
  var _confirmPassword = TextEditingController();
  final _secondbranch = "this is second branch";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Form"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
        child: Form(
          key: _formkey,
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _name,
                validator: (msg) {
                  if (msg!.isEmpty) return "Please enter name";
                  if (msg.length < 3) return "Please enter name";
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Name",
                    hintText: "Enter your name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _mobile,
                keyboardType: TextInputType.phone,
                validator: (mobile) {
                  if (mobile!.isEmpty) return "Please enter your mobile no.";
                  if (mobile.length != 10) return "Not a valid number";
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Mobile",
                    hintText: "Enter your Phone Number ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),

              child: TextFormField(
                obscureText: true,
                controller: _password,
                keyboardType: TextInputType.phone,
                validator: (password){
                  if(password!.isEmpty){
                    return "Please enter your password";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your Password ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _confirmPassword,
                keyboardType: TextInputType.phone,
                obscureText: true,
                validator: (confirmPassword) {
                  if(confirmPassword!=_password.value.text){
                    return "Enter same password";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your Password ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
            ),

          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.done),
        onPressed: () async {
           if(_formkey.currentState!.validate()){
             await SharedPrefsHelper.saveFormData(
               name: _name.text,
               mobile: _mobile.text,
               password: _password.text
             );
             Navigator.push(context,MaterialPageRoute(builder:(context)=>const DataScreen()));

             _name.clear();
             _mobile.clear();
             _password.clear();
             _confirmPassword.clear();

           }
        },
      ),
    );
  }
}
