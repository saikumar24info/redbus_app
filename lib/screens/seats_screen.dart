// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:redbus_app/common/bottom_navigation_bus_seats.dart';
import 'package:redbus_app/screens/details_screen.dart';

class SeatsScreen extends StatefulWidget {
  final String from, to, id, company, time, finalDate;
  final amount;
  const SeatsScreen({
    Key? key,
    required this.from,
    required this.to,
    required this.id,
    required this.company,
    required this.time,
    this.amount,
    required this.finalDate,
  }) : super(key: key);

  @override
  _SeatsScreenState createState() =>
      _SeatsScreenState(from, to, id, company, time, amount, finalDate);
}

class _SeatsScreenState extends State<SeatsScreen> {
  List<String> savedSeats = [];
  bool isClicked = false;
  final String from, to, id, company, time, finalDate;
  final int amount;
  _SeatsScreenState(this.from, this.to, this.id, this.company, this.time,
      this.amount, this.finalDate);
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
                    if (savedSeats.length > 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                              from: from,
                              to: to,
                              company: company,
                              amount: amount,
                              time: time,
                              finalDate: finalDate,
                              savedSeats: savedSeats),
                        ),
                      );
                    }
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
                        '$finalDate',
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
                                onTap: () {
                                  if (savedSeats.contains('1')) {
                                    savedSeats.remove('1');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('1');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('1');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '     1',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('1')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 89,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('2')) {
                                    savedSeats.remove('2');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('2');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('2');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '     2',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('2')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('3')) {
                                    savedSeats.remove('3');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('3');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('3');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '     3',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('3')
                                        ? Colors.green[100]
                                        : null,
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
                                onTap: () {
                                  if (savedSeats.contains('4')) {
                                    savedSeats.remove('4');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('4');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('4');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '     4',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('4')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('5')) {
                                    savedSeats.remove('5');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('5');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('5');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '     5',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('5')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 48,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('6')) {
                                    savedSeats.remove('6');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('6');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('6');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '     6',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('6')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('7')) {
                                    savedSeats.remove('7');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('7');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('7');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '     7',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('7')
                                        ? Colors.green[100]
                                        : null,
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
                                onTap: () {
                                  if (savedSeats.contains('8')) {
                                    savedSeats.remove('8');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('8');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('8');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '     8',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('8')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('9')) {
                                    savedSeats.remove('9');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('9');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('9');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '     9',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('9')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 48,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('10')) {
                                    savedSeats.remove('10');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('10');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('10');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    10',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('10')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('11')) {
                                    savedSeats.remove('11');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('11');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('11');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    11',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('11')
                                        ? Colors.green[100]
                                        : null,
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
                                onTap: () {
                                  if (savedSeats.contains('12')) {
                                    savedSeats.remove('12');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('12');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('12');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    12',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('12')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('13')) {
                                    savedSeats.remove('13');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('13');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('13');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    13',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('13')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 48,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('14')) {
                                    savedSeats.remove('14');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('14');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('14');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    14',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('14')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('15')) {
                                    savedSeats.remove('15');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('15');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('15');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    15',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('15')
                                        ? Colors.green[100]
                                        : null,
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
                                onTap: () {
                                  if (savedSeats.contains('16')) {
                                    savedSeats.remove('16');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('16');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('16');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    16',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('16')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('17')) {
                                    savedSeats.remove('17');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('17');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('17');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    17',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('17')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 48,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('18')) {
                                    savedSeats.remove('18');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('18');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('18');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '   18',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('18')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('19')) {
                                    savedSeats.remove('19');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('19');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('19');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    19',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('19')
                                        ? Colors.green[100]
                                        : null,
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
                                onTap: () {
                                  if (savedSeats.contains('20')) {
                                    savedSeats.remove('20');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('20');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('20');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    20',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('20')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('21')) {
                                    savedSeats.remove('21');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('21');
                                    }
                                  }
                                  savedSeats.contains('21');
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    21',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('21')
                                        ? Colors.green[100]
                                        : null,
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
                                    onTap: () {
                                      if (savedSeats.contains('22')) {
                                        savedSeats.remove('22');
                                      } else {
                                        if (savedSeats.length <= 3) {
                                          savedSeats.add('22');
                                        }
                                      }
                                      setState(() {
                                        savedSeats.contains('22');
                                      });
                                    },
                                    child: Stack(children: [
                                      _customWidget(),
                                      Text(
                                        '    22',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        color: savedSeats.contains('22')
                                            ? Colors.green[100]
                                            : null,
                                      ),
                                    ]),
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('23')) {
                                    savedSeats.remove('23');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('23');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('23');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    23',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('23')
                                        ? Colors.green[100]
                                        : null,
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
                                onTap: () {
                                  if (savedSeats.contains('24')) {
                                    savedSeats.remove('24');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('24');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('24');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    24',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('24')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('25')) {
                                    savedSeats.remove('25');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('25');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('25');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    25',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('25')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 48,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('26')) {
                                    savedSeats.remove('26');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('26');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('26');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    26',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('26')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('27')) {
                                    savedSeats.remove('27');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('27');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('27');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    27',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('27')
                                        ? Colors.green[100]
                                        : null,
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
                                onTap: () {
                                  if (savedSeats.contains('28')) {
                                    savedSeats.remove('28');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('28');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('28');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    28',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('28')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('29')) {
                                    savedSeats.remove('29');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('29');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('29');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    29',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('29')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 48,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('30')) {
                                    savedSeats.remove('30');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('30');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('30');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    30',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('30')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('31')) {
                                    savedSeats.remove('31');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('31');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('31');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    31',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('31')
                                        ? Colors.green[100]
                                        : null,
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
                                onTap: () {
                                  if (savedSeats.contains('32')) {
                                    savedSeats.remove('32');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('32');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('32');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    32',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('32')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('33')) {
                                    savedSeats.remove('33');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('33');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('33');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    33',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('33')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('34')) {
                                    savedSeats.remove('34');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('34');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('34');
                                  });
                                },
                                child: Stack(children: [
                                  _customWidget(),
                                  Text(
                                    '    34',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: savedSeats.contains('34')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('35')) {
                                    savedSeats.remove('35');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('35');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('35');
                                  });
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
                                    color: savedSeats.contains('35')
                                        ? Colors.green[100]
                                        : null,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (savedSeats.contains('36')) {
                                    savedSeats.remove('36');
                                  } else {
                                    if (savedSeats.length <= 3) {
                                      savedSeats.add('36');
                                    }
                                  }
                                  setState(() {
                                    savedSeats.contains('36');
                                  });
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
                                    color: savedSeats.contains('36')
                                        ? Colors.green[100]
                                        : null,
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
}
