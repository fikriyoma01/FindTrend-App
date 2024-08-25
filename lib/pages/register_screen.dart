import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/user.dart';
import 'home_page.dart'; 

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await DatabaseHelper.instance
          .insertUser(User(email: _email, password: _password));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                HomePage()), 
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    !value!.contains('@') ? 'Please enter a valid email' : null,
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) =>
                    value!.length < 6 ? 'Password too short' : null,
                onSaved: (value) => _password = value!,
                obscureText: true,
              ),
              ElevatedButton(
                child: Text('Register'),
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
