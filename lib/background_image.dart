import 'package:festival_post_app/util.dart';
import 'package:flutter/material.dart';

import 'constant.dart';
import 'festivalclass.dart';

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  List<String> img = [
    "images/b1.jpg",
    "images/b2.jpg",
    "images/b3.jpg",
    "images/b4.jfif",
    "images/b5.jpg",
    "images/b6.jpg",
  ];
  int iIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {

                Navigator.pushNamed(context, text);
              },
              icon: Icon(Icons.navigate_next)),
        ],
        title: Text("Select Background"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 300,
            width: 300,
            child: Image.asset(img[iIndex], fit: BoxFit.contain),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              color: Colors.black12,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                // scrollDirection: Axis.horizontal,
                itemCount: img.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      iIndex = index;
                      fest?.iIndex1 = index;
                      print(" Value :- ${fest?.iIndex1}");
                      setState(() {});
                    },
                    child: Container(
                      height: 280,
                      width: 40,
                      margin: EdgeInsets.all(10),
                      child: Image.asset(img[index], fit: BoxFit.fill),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
