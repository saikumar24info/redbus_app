// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:redbus_app/common/bottom_navigation_bus_seats.dart';
import 'package:redbus_app/screens/details_screen.dart';

class SeatsScreen extends StatefulWidget {
  final String from, to, id, company, time;
  final amount;
  const SeatsScreen({
    Key? key,
    required this.from,
    required this.to,
    required this.id,
    required this.company,
    required this.time,
    this.amount,
  }) : super(key: key);

  @override
  _SeatsScreenState createState() =>
      _SeatsScreenState(from, to, id, company, time, amount);
}

class _SeatsScreenState extends State<SeatsScreen> {
  List<String> savedSeats = [];
  bool isClicked = false;
  final String from, to, id, company, time;
  final int amount;
  _SeatsScreenState(
      this.from, this.to, this.id, this.company, this.time, this.amount);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      title: 'Bus Seats screen',
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: AppBar(
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(from: from, to: to)));
                  },
                  child: Text('Next')),
            ],
            elevation: 0,
            flexibleSpace: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Text(
                      company,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ]),
                  Row(children: [
                    SizedBox(
                      width: 65,
                    ),
                    Text(
                      from + ' - ' + to,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ]),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 65,
                      ),
                      Text(
                        time,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '19 Jan 2022',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNaviagationBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Card(
                  elevation: 1,
                  child: Container(
                    height: 400,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment(0.7, 0.0),
                            child: Container(
                              width: 25,
                              height: 25,
                              child: Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWpeDcI_0Sl2S7ljYw_Bp5EEXRCS9NpYf7Cg&usqp=CAU'),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '     1',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: isClicked ? Colors.green[50] : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 89,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '     2',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '     3',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '     4',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '     5',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 48,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '     6',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '     7',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '     8',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '     9',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 48,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    10',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    11',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    12',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    13',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 48,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    14',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    15',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: isClicked ? Colors.green[50] : null,
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    16',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    17',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 48,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '   18',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    19',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    20',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    21',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 48,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Stack(children: [
                                      _customWidget(),
                                      Text(
                                        '    22',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 30,
                                      ),
                                    ]),
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    23',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    24',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    25',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 48,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    26',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    27',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    28',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    29',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 48,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    30',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    31',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    32',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    33',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    34',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _onSelect();
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    35',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _onSelect();
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    36',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customWidget() {
    return Container(
      child: Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIc9TxpOn_7pmJKqO-kxQlRRUCluXnGZ4Clsczk1wuo_8-UxY6O90DKAbJ_qTdEccxYSE&usqp=CAU'),
      height: 30,
      width: 30,
    );
  }

  void _onSelect() {
    setState(() {
      isClicked = !isClicked;
    });
  }
}
