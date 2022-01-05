// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';

class BenefitsWidget extends StatelessWidget {
  const BenefitsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
              backgroundColor: Colors.brown,
              backgroundImage: NetworkImage(
                  'https://image.shutterstock.com/image-vector/247-service-concept-open-support-260nw-1715470057.jpg')),
          title: Text(
            '24/7 Customer Support',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          subtitle: Text('We are here to help whenever you need us'),
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.brown,
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPpZA-n4bsOhtTccNIL91XdozbsVjNdfVZUeIy5-4Y8I6Yb-mTQIgqyWKhs0aco-mXrPU&usqp=CAU'),
          ),
          title: Text(
            'Secure Booking Process',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          subtitle: Text(
              'Your personal information is secured using the latest industry standard.'),
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.brown,
            backgroundImage: NetworkImage(
                'https://img.freepik.com/free-vector/facebook-like-icon_1017-8081.jpg?size=338&ext=jpg'),
          ),
          title: Text(
            'Trusted by Members',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          subtitle: Text('We have earned 4.5/5.0 stars on playstore.'),
        ),
        Divider(),
      ],
    );
  }
}
