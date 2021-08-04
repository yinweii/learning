import 'package:cubits/cubit/counter_cubit.dart';
import 'package:cubits/screen/second_screen.dart';
import 'package:cubits/screen/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Demo Bloc',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state.isIncrement == true) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                      duration: Duration(microseconds: 5),
                      content: Text('Incremant')));
                } else if (state.isIncrement == false) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                      duration: Duration(microseconds: 5),
                      content: Text('Decrement')));
                }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: TextStyle(color: Colors.green, fontSize: 60),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: widget.color,
              child: Text(
                'Go to SecondScreen',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: widget.color,
              child: Text(
                'Go to ThirdScreen',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
