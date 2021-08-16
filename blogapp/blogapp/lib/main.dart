import 'package:blogapp/blocs/authbloc/auth_bloc.dart';
import 'package:blogapp/blocs/regisbloc/regis_bloc.dart';
import 'package:blogapp/repository/repositories.dart';
import 'package:blogapp/screen/home.dart';
import 'package:blogapp/screen/login.dart';
import 'package:blogapp/screen/resigter.dart';
import 'package:blogapp/screen/upnewpost.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/postbloc/post_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final _postReponsitori = Reponsitory();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PostBloc(_postReponsitori)..add(LoadPostEvent()),
        ),
        BlocProvider(
          create: (context) => AuthBloc()..add(AppStartEvent()),
        ),
        BlocProvider(
          create: (context) => RegisBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => HomeScreen(),
          '/add': (context) => UpNewPost(
                onSave: (image, title) {
                  BlocProvider.of<PostBloc>(context)
                    ..add(AddPostEvent(image: image, title: title));
                },
              ),
        },
      ),
    );
  }
}

class Controller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial) {
          return SplashScreen();
        } else if (state is AuthenticatedState) {
          return HomeScreen();
        } else if (state is UnAuthenticatedState) {
          return LoginScreen();
        } else {
          return Container();
        }
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Loading...'),
      ),
    );
  }
}
