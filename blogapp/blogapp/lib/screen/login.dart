import 'package:blogapp/blocs/loginbloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailControlle = TextEditingController();
  TextEditingController _passwordControlle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: TextField(
                    controller: _emailControlle,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: "E-mail",
                      hintText: "E-mail",
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: TextField(
                    controller: _passwordControlle,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      hintText: "Password",
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: RaisedButton(
                        color: Colors.cyan,
                        child: Text("Login"),
                        textColor: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      child: RaisedButton(
                        color: Colors.cyan,
                        child: Text("Sign Up Now"),
                        textColor: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
