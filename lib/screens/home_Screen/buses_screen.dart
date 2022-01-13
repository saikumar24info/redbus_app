// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:redbus_app/common/custom_tile.dart';
import 'package:redbus_app/common/data.dart';

class BusesShowingScreen extends StatelessWidget {
  const BusesShowingScreen({Key? key, required this.from, required this.to})
      : super(key: key);

  final String from, to;
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection(from)
        .where('to', isEqualTo: to)
        .snapshots();

    return MaterialApp(
      title: 'Buses screen',
      theme: ThemeData(backgroundColor: Colors.pink[50]),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back)),
          backgroundColor: Colors.red,
          title: Text('$from ' + "->" + ' $to'),

        
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('No buses are Available in this route');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Text("Loading......",
                      style: TextStyle(color: Colors.blue, fontSize: 15)));
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  height: 150,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            child: Image.network(
                                'https://static.vecteezy.com/system/resources/thumbnails/001/500/616/small/building-icon-free-vector.jpg'),
                          ),
                          Text('1 REST STOP', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                               data['Time'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Price: ${data['Amount']} ₹',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Image.network(
                                'https://cdn-icons-png.flaticon.com/512/269/269947.png'),
                            height: 25,
                            width: 25,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(data['Name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          
                        ],
                      ),
                      SizedBox(
                        height:5,
                      ),
                      Row(children: [
                        Text('Ac/Sleeper (2+1)',
                            style: TextStyle(fontSize: 12)),
                      ]),
                      SizedBox(
                      height:5,
                      ),
                      Row(children: [
                        Text(
                            'Return trip redDeal:Unlock min.₹ 100 on return ticket',
                            style: TextStyle(
                                
                                fontSize: 12,
                                color: Colors.red)),
                      ]),
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
        // body: CustomScrollView(
        //   slivers: [
        //     SliverAppBar(
        //       leading: IconButton(
        //         onPressed: () {
        //           Navigator.pop(context);
        //         },
        //         icon: Icon(
        //           Icons.arrow_back,
        //           color: Colors.black,
        //         ),
        //       ),
        //       title: Text(
        //         '$from'+' $to',
        //         style: TextStyle(color: Colors.black),
        //       ),
        //       actions: [
        //         SizedBox(
        //           height: 30,
        //         ),
        //         Text(
        //           '6 Jan',
        //           textAlign: TextAlign.center,
        //           style: TextStyle(color: Colors.black),
        //         )
        //       ],
        //       backgroundColor: Colors.white70,
        //       pinned: true,
        //       snap: false,
        //       floating: false,
        //       expandedHeight: 100.0,
        //     ),
        //     SliverList(
        //       delegate: SliverChildBuilderDelegate(
        //         (BuildContext context, int i) {
        //           return Container(
        //             decoration: BoxDecoration(
        //               border: Border.all(color: Colors.white),
        //               borderRadius: BorderRadius.circular(5),
        //             ),
        //             height: 100,
        //             child: ListTile(
        //               title: Row(children: [
        //                 Container(
        //                     width: 30,
        //                     height: 30,
        //                     color: Colors.yellow,
        //                     child: Image.network(
        //                         'https://cdn-icons-png.flaticon.com/128/269/269947.png')),
        //                 SizedBox(
        //                   width: 10,
        //                 ),
        //                 Text('${data[i].busName}'),
        //               ]),
        //               trailing: Text('₹ ${data[i].amount}'),
        //               subtitle: Row(children: [
        //                 Text('${data[i].time}'),
        //                 Text('\nA/c Seater / Sleeper (2+1)'),
        //               ]),
        //             ),
        //           );
        //         },
        //         childCount: data.length,
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
