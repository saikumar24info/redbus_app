// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SearchScreen2 extends StatefulWidget {
  const SearchScreen2({ Key? key }) : super(key: key);

  @override
  _SearchScreen2State createState() => _SearchScreen2State();
}

class _SearchScreen2State extends State<SearchScreen2> {

  late String _toField;
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
            centerTitle: false,
            title: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: TextFormField(
                  controller: _fromController,
                  onChanged: (value) {
                    _toField = value;
                  },
                  decoration: InputDecoration(
                      prefixIcon: IconButton( onPressed: (){ 
                        Navigator.pop(context);
                      },
                        icon:Icon(Icons.search),),
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
                  child: Center(
                    child: Text(
                      'hyderabad',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
