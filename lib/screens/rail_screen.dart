// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class RailScreen extends StatefulWidget {
  const RailScreen({Key? key}) : super(key: key);

  @override
  _RailScreenState createState() => _RailScreenState();
}

class _RailScreenState extends State<RailScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rail screen',
      theme: ThemeData(
          primarySwatch: Colors.red, backgroundColor: Colors.grey[100]),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black87,
              )),
          title: Row(
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: Image.network(
                    'https://st.redbus.in/Images/redrail/rail_logo.png'),
              ),
              Text(
                ' Book Train Tickets',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 16),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 5,
                  child: Container(
                    height: 280,
                    width: 350,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration:
                              InputDecoration(prefixIcon: Icon(Icons.train)),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.train),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.today),
                            hintText: '10 Jan, Mon',
                            suffixIcon: Row(
                              children: [
                                SizedBox(
                                  width: 160,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Tomorrow',
                                      style: TextStyle(
                                        color: Colors.blue,
                                      )),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Day After',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 45,
                          width: 310,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('SEARCH TRAINS'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          SizedBox(width: 60),
                          Container(
                            height: 50,
                            width: 50,
                            child: Image.network(
                                'https://img.theweek.in/content/dam/week/news/biz-tech/images/2019/9/30/irctc-logo.jpg'),
                          ),
                          Text(
                            'IRCTC Authorised Partner',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Offers for you',
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 150,
                  width: 350,
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      title: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 100,
                        width: 100,
                        child: Row(children: [
                          Image.network(
                              'https://www.easemytrip.com/images/offer-img/emtmobiwik-lp.png?v=1'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                              'ZERO Service Charge.\nZERO Paymnet \nGateway Charge',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ]),
                      ),
                      // title: Text(
                      //     'ZERO Service Charge.ZERO Paymnet Gateway Charge\n',style:TextStyle(color: Colors.black)),
                      subtitle: Row(children: [
                        Text(
                          '\nview details',
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text('\nvalid till jan 31')
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Text('Why book with us?',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                        SizedBox(
                          height: 25,
                        ),
                        ListTile(
                          leading: SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.network(
                                'https://st.redbus.in/Images/redrail/auth_path.png'),
                          ),
                          title: Column(
                            children: [
                              Text('Authorised IRCTC\nPartner',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              Text(
                                  '      Book your train tickets with\n      confidence',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12)),
                              SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          leading: SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.network(
                                'https://st.redbus.in/Images/redrail/cust_sup.png'),
                          ),
                          title: Column(
                            children: [
                              Text('    Dedicated Customer\n    Support',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              Text(
                                  '     Get dedicated customer\n     support for all your queries',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12)),
                              SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          leading: SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.network(
                                'https://st.redbus.in/Images/redrail/inst_ref.png'),
                          ),
                          title: Column(
                            children: [
                              Text('Instant Refunds',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              Text(
                                  '              Get Instant Refunds on your \n              UPI payments',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12)),
                              SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
