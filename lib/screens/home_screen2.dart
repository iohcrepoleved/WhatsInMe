import 'package:flutter/material.dart';
import 'package:my_musical/widgets/favorite_widget.dart';
import 'package:my_musical/widgets/homepage_widget.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  final List<Widget> _widgetOptions = <Widget>[
    const FavoriteWidget(),
    const HomepageWidget(),
  ];
  int _selectedIndex = 0;
  onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: SafeArea(
        child: _widgetOptions.elementAt(
          _selectedIndex,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 13,
        unselectedFontSize: 13,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'My Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.web_asset),
            label: 'My Homepage',
          ),
        ],
        selectedItemColor: Colors.pink.shade300,
        currentIndex: _selectedIndex,
        onTap: onItemTap,
      ),
    );
  }
}
