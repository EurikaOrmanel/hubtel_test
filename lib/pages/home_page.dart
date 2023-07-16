import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hubtel_test/pages/history.dart';
import 'package:hubtel_test/pages/home.dart';
import 'package:hubtel_test/pages/scheduled.dart';
import 'package:hubtel_test/pages/send.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BottomNavigationBarItem> _bottomNavigationItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.phone), label: "Send"),
    BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
    BottomNavigationBarItem(icon: Icon(Icons.schedule), label: "Scheduled")
  ];

  final _pages = [HomeTab(), SendTab(), HistoryTab(), ScheduledTab()];

  int _currentTabIndex = 2;

  void _onBottomNavigationItemTapped(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: _pages[_currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onBottomNavigationItemTapped,
        items: _bottomNavigationItems,
        currentIndex: _currentTabIndex,
      ),
    );
  }
}
