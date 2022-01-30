// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:redbus_app/screens/home_Screen/home_screen.dart';

class SearchScreen1 extends StatefulWidget {
  final String to;
  const SearchScreen1({Key? key, required this.to}) : super(key: key);

  @override
  _SearchScreen1State createState() => _SearchScreen1State(to);
}

class _SearchScreen1State extends State<SearchScreen1> {
  final String to;
  final List<String> _suggestions = [
    'Hyderabad',
    'Kurnool',
    'Khammam',
    'Warangal',
    'Guntur'
  ];

  late String _fromField;
  TextEditingController _fromController = TextEditingController();

  _SearchScreen1State(this.to);
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
                return _suggestions.where((suggestion) => suggestion
                    .toLowerCase()
                    .contains(value.text.toLowerCase()));
              },
              onSelected: (value) {
                setState(() {
                  _fromField = value;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BusHomeScreen(from: _fromField, to: to)));
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
                              from: _suggestions[index], to: to))),
                  child: Card(
                    child: Center(
                      child: ListTile(
                        leading: Icon(Icons.search),
                        title: Text(
                          _suggestions[index],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: _suggestions.length, // 1000 list items
            ),
          ),
        ],
      ),
    );
  }
}
