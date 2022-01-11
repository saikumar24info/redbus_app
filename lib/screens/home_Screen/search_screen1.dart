// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:redbus_app/screens/home_Screen/home_screen.dart';

class SearchScreen1 extends StatefulWidget {
  const SearchScreen1({Key? key}) : super(key: key);

  @override
  _SearchScreen1State createState() => _SearchScreen1State();
}

class _SearchScreen1State extends State<SearchScreen1> {
  late String _fromField;
  TextEditingController _fromController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 60,
            floating: true,
            pinned: true,
            snap: false,
            title: TextFormField(
              controller: _fromController,
              cursorColor: Colors.white,
              cursorHeight: 22,
              decoration: InputDecoration(
                hintText: 'Search...',
                suffixIcon: IconButton(
                  onPressed: () =>_fromController.clear(),
                  icon: Icon(
                    Icons.cancel_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 400,
                  child: Center(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
