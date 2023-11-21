import 'package:flutter/material.dart';

import 'package:flutter_application_ab9/presentation/screen/data.dart';

import 'package:flutter_application_ab9/presentation/screen/scan.dart';

import 'package:lottie/lottie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  final List<Widget> _children = [
    DataFromAPI(),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Lottie.asset('assets/Animation.json',
              width: 150, height: 150, fit: BoxFit.fill),
          SizedBox(height: 20),
          Lottie.asset('assets/Animation2.json',
              width: 150, height: 150, fit: BoxFit.fill),
        ],
      ),
    ),
    ScanPage(),
  ];

  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        controller: _pageController,
        children: _children,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        selectedItemColor: Colors.teal[800],
        unselectedItemColor: Colors.teal[300],
        elevation: 8.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28),
            label: 'Дом',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work, size: 28),
            label: 'Работа',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, size: 28),
            label: 'Аккаунт',
          ),
        ],
      ),
    );
  }
}
