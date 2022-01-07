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
         
            title: Container(
           
              height: 50,
            
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: TextFormField(
                  controller: _fromController,
                  onChanged: (value) {
                    _fromField = value;
                  },
                  onSaved: (value) {
                    _fromField = value!;
                  },
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BusHomeScreen()));
                        },
                        icon: Icon(Icons.search),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _fromController.clear();
                        },
                      ),
                      hintText: 'Search...',
                      border: InputBorder.none),
                ),
              ),
            ),
          ),

          // Other Sliver Widgets
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
