import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'constant.dart';
import 'util.dart';

class Discpage extends StatefulWidget {
  const Discpage({super.key});

  @override
  State<Discpage> createState() => _DiscState();
}
class _DiscState extends State<Discpage> {

  String text1="";
  double sliderVal1 = 0;
  double sliderVal2 = 0;
  double rotate1 = 0;
  String image="";
  int cIndex1 = 0;
  int fIndex1 = 0;
  double textSize1 = 12;
  bool isBold1 = false;
  Alignment textTopPos1 = Alignment(0.5, 0.5);


  TextEditingController controller1 = TextEditingController();
  GlobalKey key = GlobalKey();
  // Uint8List? asUint8List;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Edit Discription"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            // var text1 = fest.text1;
            print(text1);
            Share.share(text1??"");
          }, icon: Icon(Icons.share)),

          IconButton(onPressed: () async {
            // To get byte data
            RenderRepaintBoundary renderObject = key.currentContext?.findRenderObject() as RenderRepaintBoundary ;
            var image = await renderObject.toImage();
            ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
            fest.asUint8List = byteData?.buffer.asUint8List();

            /// To save file
            var applicationDocumentsDirectory = await getApplicationDocumentsDirectory();
            var date = DateTime.now().toString();
            String filePath = "${applicationDocumentsDirectory.path}/${date}_img.jpg";
            File file = File(filePath);
            await file.writeAsBytes(fest.asUint8List?.toList() ?? []);

            postlist.add(fest.asUint8List!);
            print(postlist.length);
            setState(() {});

            Navigator.pushNamed(context, homepage);
            print("Downlaod");
          }, icon: Icon(Icons.download))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RepaintBoundary(
                key: key,
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 300,
                  width: 400,
                  child: Stack(
                    children: [
                      Container(
                        height:400,
                        width: 400,
                        child: Image.asset(img[fest!.iIndex1],fit: BoxFit.contain,),
                      ),
                      Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: fest!.textTopPos,
                              child: Transform.rotate(
                                angle: fest!.rotate,
                                child: SelectableText(
                                  "${fest!.text}",
                                  style: fonts[fest!.fIndex].copyWith(
                                      color: colors[fest!.cIndex],
                                      fontSize: fest!.textSize,
                                      fontWeight:
                                      fest!.isBold ? FontWeight.bold : FontWeight.normal),
                                  // style: TextStyle(fontFamily: "Schyler",fontSize: textSize,fontWeight: isBold ? FontWeight.bold:FontWeight.normal),
                                ),
                              ),
                            ),
                            Align(
                              alignment: textTopPos1,
                              child: Transform.rotate(
                                angle: rotate1,
                                child: SelectableText(
                                  text1,
                                  style: fonts[fIndex1].copyWith(
                                      color: colors[cIndex1],
                                      fontSize: textSize1,
                                      fontWeight:
                                      isBold1 ? FontWeight.bold : FontWeight.normal),
                                  // style: TextStyle(fontFamily: "Schyler",fontSize: textSize,fontWeight: isBold ? FontWeight.bold:FontWeight.normal),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller1,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: "Enter Discription",
                        fillColor: Colors.grey,
                        filled: true,
                        // border: OutlineInputBorder.none
                      ),
                      onChanged: (value) {
                        text1 = value;
                        setState(() {});
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        cIndex1 = 0;
                        fIndex1 = 0;
                        text1 = "";
                        textSize1 = 12;
                        isBold1 = false;
                        controller1.clear();
                        setState(() {});
                      },
                      icon: Icon(Icons.refresh,size: 30)),
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        textSize1++;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.text_increase,
                        size: 28,
                      )),
                  IconButton(
                      onPressed: () {
                        textSize1--;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.text_decrease_sharp,
                        size: 28,
                      )),
                  IconButton(
                      onPressed: () {
                        isBold1 = !isBold1;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.format_bold,
                        size: 28,
                      )),
                  IconButton(
                      onPressed: () {
                        rotate1 = 0;
                        setState(() {});
                      },
                      icon: Icon(Icons.restart_alt_sharp)),
                  IconButton(
                      onPressed: () {
                        rotate1 = rotate1 + 35;
                        setState(() {});
                      },
                      icon: Icon(Icons.rotate_90_degrees_ccw)),
                ],
              ),
              Container(
                height: 100,
                margin: EdgeInsets.all(10),
                color: Colors.black12,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        fIndex1 = index;
                        setState(() {});
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "Aa",
                            style: fonts[index].copyWith(fontSize: 40),
                          )),
                    );
                  },
                  itemCount: fonts.length,
                ),
              ),
              Slider(
                value: sliderVal1,
                min: -1,
                max: 1,
                onChanged: (value) {
                  sliderVal1 = value;
                  textTopPos1 = Alignment(value, 0.5);
                  setState(() {});
                },
              ),
              Slider(
                value: sliderVal2,
                min: -1,
                max: 1,
                onChanged: (value) {
                  sliderVal2 = value;
                  textTopPos1 = Alignment(sliderVal1, sliderVal2);
                  setState(() {});
                },
              ),
              Container(
                height: 60,
                margin: EdgeInsets.all(10),
                color: Colors.black12,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        cIndex1 = index;
                        setState(() {});
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        color: colors[index],
                        margin: EdgeInsets.all(10),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

