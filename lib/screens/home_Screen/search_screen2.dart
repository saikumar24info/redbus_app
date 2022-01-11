// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:redbus_app/screens/home_Screen/home_screen.dart';

class SearchScreen2 extends StatefulWidget {
  const SearchScreen2({Key? key}) : super(key: key);

  @override
  _SearchScreen2State createState() => _SearchScreen2State();
}

class _SearchScreen2State extends State<SearchScreen2> {
  late String _toField;
  TextEditingController _toController = TextEditingController();

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
              enableSuggestions: true,
              controller: _toController,
              cursorColor: Colors.white,
              cursorHeight: 22,
              decoration: InputDecoration(
                hintText: 'Search...',
                suffixIcon: IconButton(
                  onPressed: () => _toController.clear(),
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
