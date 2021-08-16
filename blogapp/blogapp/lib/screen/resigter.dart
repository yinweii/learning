import 'package:blogapp/blocs/regisbloc/regis_bloc.dart';
import 'package:blogapp/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisScreen extends StatefulWidget {
  @override
  _RegisScreenState createState() => _RegisScreenState();
}

class _RegisScreenState extends State<RegisScreen> {
  TextEditingController _emailControlle = TextEditingController();
  TextEditingController _passwordControlle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userRegisBloc = BlocProvider.of<RegisBloc>(context);
    return BlocProvider(
      create: (context) => RegisBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<RegisBloc, RegisState>(
                  builder: (context, state) {
                    if (state is RegisInitial) {
                      return Text(
                        "Enter Login Credentials",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.teal,
                        ),
                      );
                    } else if (state is RegisSuccsessState) {
                      navigateToHomeScreen(context);
                    } else if (state is RegisLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is RegisFaildState) {
                      return _showToast(state.error);
                    }
                    return Container();
                  },
                ),
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
                        onPressed: () {
                          userRegisBloc.add(
                            SignUpButtonEvent(
                              email: _emailControlle.text,
                              password: _passwordControlle.text,
                            ),
                          );
                          print('Sign Up');
                        },
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

  _showToast(String msg) {
    return Fluttertoast.showToast(msg: msg);
  }

  void navigateToHomeScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return HomeScreen();
    }));
  }
}
