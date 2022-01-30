// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:redbus_app/screens/home_Screen/home_screen.dart';

class SearchScreen2 extends StatefulWidget {
  final String from;
  const SearchScreen2({Key? key, required this.from}) : super(key: key);

  @override
  _SearchScreen2State createState() => _SearchScreen2State(from);
}

class _SearchScreen2State extends State<SearchScreen2> {
  List<String> _suggestions1 = [
    'Hyderabad',
    'Kurnool',
    'Vijayawada',
    'Guntur',
    'Visakhapatnam',
  ];
  final String from;
  late String _toField;
  TextEditingController _toController = TextEditingController();

  _SearchScreen2State(this.from);

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
            title: Autocomplete<String>(
              optionsBuilder: (TextEditingValue value) {
                // When the field is empty
                if (value.text.isEmpty) {
                  return [];
                }

                // The logic to find out which ones should appear
                return _suggestions1.where((suggestion) => suggestion
                    .toLowerCase()
                    .contains(value.text.toLowerCase()));
              },
              onSelected: (value) {
                setState(() {
                  _toField = value;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BusHomeScreen(from: from, to: _toField)));
                });
              },
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BusHomeScreen(
                              from: from, to: _suggestions1[index]))),
                  child: Card(
                    child: Center(
                      child: ListTile(
                        leading: Icon(Icons.search),
                        title: Text(
                          _suggestions1[index],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: _suggestions1.length, // 1000 list items
            ),
          ),
        ],
      ),
    );
  }
}
