import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Initialization
  int temperature = 0;
  int maxTemp = 0;
  String weatherStateName = 'Loading.....';
  int humidity = 0;
  int windSpeed = 0;
  var currentDate = 'Loading...';
  String imageUrl = '';
  // where on earth id
  int woeid = 44418; // London is the default city
  String Location = 'London';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Screen"),
      ),
      body: Container(),
    );
  }
}
