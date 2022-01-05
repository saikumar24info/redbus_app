// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:redbus_app/common/data.dart';



class CustomList extends StatefulWidget {
  const CustomList({Key? key}) : super(key: key);

  @override
  _CustomListState createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemCount: data.length,
        separatorBuilder: (context, index) => Divider(
          thickness: 2,
        ),
        itemBuilder: (context, i) => Column(
          children: [
            ListTile(
              leading: Container(
                height: 25,
                width: 25,
                color: Colors.yellow,
                child: Image.network(
                    'https://cdn-icons-png.flaticon.com/128/269/269947.png'),
              ),
              title: Text(
                data[i].busName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text('${data[i].amount} ₹'),
              subtitle: Row(children: [
                Icon(Icons.watch_later),SizedBox(width: 1,),
                Text(data[i].time),
                
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
