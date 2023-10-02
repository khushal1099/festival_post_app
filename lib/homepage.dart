import 'dart:typed_data';

import 'package:festival_post_app/util.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print(postlist.length);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Festival Post Maker"),
        centerTitle: true,
        leading: SizedBox(width: 5,),
      ),
      body: ListView.separated(itemBuilder: (context, index) {
        return  Column(
          children: [
            if(postlist[index]!=0)
            Container(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.only(top:10),
              height: 400,
              width: 400,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
              child: Image.memory(postlist[index],fit: BoxFit.cover,)
            ),
            if(postlist[index]==0)
              ListView.separated(itemBuilder: (context, index) {
               return Container(
                  height: 350,
                  width: 350,
                  color: Colors.grey,
                  child: Center(child: Text("Please Create Post",style: TextStyle(fontSize: 30),)),
                );
              }, separatorBuilder: (context, index) {
                return Divider(
                  thickness: 5,
                );
              }, itemCount: postlist.length),
          ],
        );
      }, separatorBuilder: (context, index) {
        return Divider(
          thickness: 5,
        );
      }, itemCount: postlist.length),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.pushNamed(context, background);
          }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
