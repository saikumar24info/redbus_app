// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CustomBottomNaviagationBar extends StatefulWidget {
  const CustomBottomNaviagationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNaviagationBarState createState() =>
      _CustomBottomNaviagationBarState();
}

class _CustomBottomNaviagationBarState
    extends State<CustomBottomNaviagationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: CircleAvatar(
            
              backgroundImage: NetworkImage(
                  'https://cdn3.vectorstock.com/i/1000x1000/05/22/bus-black-icon-large-vehicle-for-passengers-vector-26240522.jpg'),
            ),
            title: Text('Why book\nthis bus?',
                style: TextStyle(color: Colors.black, fontSize: 12)),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTS4wMFRKMsxOy8LoLyjeWIk7pdJYX9cUWP-VskhDIE3z5qfgAz8lG3ycLIVWMOYtvC16A&usqp=CAU'),
            ),
            title: Text('Boarding/\nDropping',
                style: TextStyle(color: Colors.black, fontSize: 12)),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgxai9ma4CYF2FRREnCKLc5YUcMlWZwhcukpSQKpI35tk6Rx3nBCYdijfoHhPxJ31re68&usqp=CAU'),
            ),
            title: Text('Amenities\nPhotos',
                style: TextStyle(color: Colors.black, fontSize: 12)),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/600px_White_star_on_Black_background.svg/1280px-600px_White_star_on_Black_background.svg.png'),
            ),
            title: Text('Ratings &\nReviews',
                style: TextStyle(color: Colors.black, fontSize: 12)),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAb0OudKnttnKiSvo8Oou9JSpFzKWOTGygKQ&usqp=CAU'),
            ),
            title: Text('Booking\nPolicies',
                style: TextStyle(color: Colors.black, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
