import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/destinationcarousel.dart';
import '../widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];
  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        // print(_selectedIndex);
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4E1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'What would you like to find?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map((MapEntry map) => _buildIcon(map.key))
                  .toList(),
            ),
            SizedBox(
              height: 20.0,
            ),
            DestinationCarousel(),
            SizedBox(
              height: 20.0,
            ),
            HotelCarousel()
          ],
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentTab,
          onItemSelected: (int value) {
            setState(() {
              _currentTab = value;
            });
          },
          items: [
            BottomNavyBarItem(
              icon: Icon(
                Icons.search,
                size: 30.0,
              ),
              title: Text(''),
              inactiveColor: Colors.grey,
              activeColor: Colors.redAccent,
            ),
            BottomNavyBarItem(
              icon: Icon(
                Icons.local_pizza,
                size: 30.0,
              ),
              title: Text(''),
              inactiveColor: Colors.grey,
              activeColor: Colors.yellow[800],
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.account_circle),
              title: Text(''),
              inactiveColor: Colors.grey,
              activeColor: Colors.amberAccent,
            ),
          ],
        ),
      ),
    );
  }
}

// BottomNavigationBar(
//   currentIndex: _currentTab,
//   onTap: (int value) {
//     setState(() {
//       _currentTab = value;
//     });
//   },
//   items: [
//     BottomNavigationBarItem(
//       icon: Icon(
//         Icons.search,
//         size: 30.0,
//       ),
//       title: SizedBox.shrink(),
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(
//         Icons.local_pizza,
//         size: 30.0,
//       ),
//       title: SizedBox.shrink(),
//     ),
//     BottomNavigationBarItem(
//       icon: CircleAvatar(
//         radius: 15.0,
//         backgroundImage: AssetImage('assets/images/steph.jpg'),
//       ),
//       title: SizedBox.shrink(),
//     ),
//   ],
// ),
