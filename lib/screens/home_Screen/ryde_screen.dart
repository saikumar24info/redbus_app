// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_color/flutter_color.dart';

class RyderScreen extends StatefulWidget {
  const RyderScreen({Key? key}) : super(key: key);

  @override
  _RyderScreenState createState() => _RyderScreenState();
}

class _RyderScreenState extends State<RyderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back,color: Colors.black,)),
        backgroundColor: Colors.white,
        title: Text(
          'rYde',
          style: TextStyle(
              color: Colors.red[600],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  color: Colors.indigo[400],
                ),
                Container(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Rent Cabs, TTs and Buses',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'With best drivers',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: 350,
                          height: 280,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    child: Image.network(
                                        'https://www.redbus.in/bushire/static/mwebv2/ryde/webhome/Component%2035.png'),
                                    height: 100,
                                    width: 100,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    child: Image.network(
                                        'https://www.redbus.in/bushire/static/mwebv2/ryde/webhome/Component%2036.png'),
                                    height: 100,
                                    width: 100,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    child: Image.network(
                                        'https://www.redbus.in/bushire/static/mwebv2/ryde/webhome/Component%2037.png'),
                                    height: 100,
                                    width: 100,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Outstation',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Text(
                                    'Hourly Rental',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Text(
                                    'Airport',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('  '),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'TRAVEL OUTSIDE YOUR CITY',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: 'Where to ?',
                                    prefixIcon: Icon(Icons.location_pin),
                                    suffixIcon: Icon(Icons.arrow_forward),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Card(
                elevation: 1,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(children: [
                    Row(children: [
                      Text(
                        'Look for',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' rYde Assured',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' partners to get',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: 190,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Image.network(
                                  'https://www.redbus.in/bushire/static/ryde/ryde_trusted_new_partner_one.png'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 190,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Image.network(
                                  'https://www.redbus.in/bushire/static/ryde/ryde_trusted_new_partner_two.png'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 190,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Image.network(
                                  'https://www.redbus.in/bushire/static/ryde/ryde_trusted_new_partner_three.png'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 190,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Image.network(
                                  'https://www.redbus.in/bushire/static/ryde/ryde_trusted_new_partner_four.png'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              child: Card(
                  elevation: 1,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(children: [
                      Text(
                        'Vehicles you can book',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              width: 190,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hatchbacks\nand Sedans',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '    ideal for\n    about 2-4 people',
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                  Image.network(
                                      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/sedan-1547832089.jpg?crop=1.00xw:0.502xh;0,0.260xh&resize=480:*'),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 190,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'SUVs',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '          ideal for\n         about 4-9 people',
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                  Image.network(
                                      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/suv-1547831746.jpg?crop=1.00xw:1.00xh;0,0&resize=320:*'),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 190,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tempo',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '    Travellers',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '         ideal for\n        about 8-16 people',
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                  Image.network(
                                      'https://previews.123rf.com/images/_fla/_fla1206/_fla120600512/14169775-delivery-van-hand-draw-illustration.jpg'),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 190,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Buses and',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    'Mini Buses',
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),
                                  ),
                                  Text(
                                    'ideal for more than',
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                    Text(
                                    '18 people',
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                  Image.network(
                                      'https://us.123rf.com/450wm/bruder/bruder1412/bruder141200012/34920398-stock-vector-a-illustration-of-white-coach-bus.jpg?ver=6'),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ]),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Card(
                elevation: 1,
                child: Column(
                  children: [
                    Text(
                      'Offers',
                      style: TextStyle(
                          color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.indigo[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 120,
                          width: 170,
                          child: Column(children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'INSTANT',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '500',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'View Details -->',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ]),
                        ),
                        SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.orange[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 120,
                          width: 170,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'INSTANT',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '750',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'View Details -->',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
