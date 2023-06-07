import 'package:flutter/material.dart';
import 'package:my_musical/screens/music_screen.dart';
import 'package:my_musical/screens/restaurant_screen.dart';

class EtcScreen extends StatefulWidget {
  const EtcScreen({super.key});

  @override
  State<EtcScreen> createState() => _EtcScreenState();
}

class _EtcScreenState extends State<EtcScreen> {
  final List<Widget> _widgetOptions = <Widget>[
    const MusicScreen(),
    const RestaurantScreen()
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        foregroundColor: Colors.white,
        title: const Text('My Favorite'),
      ),
      body: SafeArea(
        child: _widgetOptions.elementAt(
          _selectedIndex,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: '음악',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_play),
            label: '공연',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: '맛집',
          )
        ],
        selectedItemColor: Colors.pink.shade300,
        currentIndex: _selectedIndex,
        onTap: onItemTap,
      ),
    );
  }
}
