import 'package:flutter/material.dart';

import 'constant.dart';
import 'util.dart';

class Textpage extends StatefulWidget {
  const Textpage({super.key});

  @override
  State<Textpage> createState() => _TextState();
}
class _TextState extends State<Textpage> {

  String text = "";
  String text1 = "";
  double sliderVal = 0;
  double sliderVal0 = 0;
  double rotate = 0;
  int cIndex = 0;
  int fIndex = 0;
  double textSize = 12;
  bool isBold = false;
  Alignment textTopPos = Alignment(0.5, 0.5);


  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Edit Text"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                cIndex = 0;
                fIndex = 0;
                text = "";
                textSize = 12;
                isBold = false;
                controller.clear();
                setState(() {});
              },
              icon: Icon(Icons.refresh)),
          IconButton(onPressed: () {
            fest!.text = controller.text;
            fest!.fIndex = fIndex;
            fest!.cIndex = cIndex;
            fest!.textSize = textSize;
            fest!.isBold = isBold;
            fest!.sliderVal = sliderVal;
            fest!.sliderVal0 = sliderVal0;
            fest!.textTopPos = textTopPos;


            Navigator.pushNamed(context, disc);
          }, icon: Icon(Icons.navigate_next_outlined))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
                      child: Align(
                        alignment: textTopPos,
                        child: Transform.rotate(
                          angle: rotate,
                          child: SelectableText(
                            text,
                            style: fonts[fIndex].copyWith(
                                color: colors[cIndex],
                                fontSize: textSize,
                                fontWeight:
                                isBold ? FontWeight.bold : FontWeight.normal),
                            // style: TextStyle(fontFamily: "Schyler",fontSize: textSize,fontWeight: isBold ? FontWeight.bold:FontWeight.normal),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextField(
                controller: controller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Enter Text",
                  fillColor: Colors.grey,
                  filled: true,
                  // border: OutlineInputBorder.none
                ),
                onChanged: (value) {
                  text = value;
                  setState(() {});
                },
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        textSize++;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.format_size,
                        size: 28,
                      )),
                  IconButton(
                      onPressed: () {
                        textSize--;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.format_size,
                        size: 20,
                      )),
                  IconButton(
                      onPressed: () {
                        isBold = !isBold;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.format_bold,
                        size: 20,
                      )),
                  IconButton(
                      onPressed: () {
                        rotate = 0;
                        setState(() {});
                      },
                      icon: Icon(Icons.restart_alt_sharp)),
                  IconButton(
                      onPressed: () {
                        rotate = rotate + 35;
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
                        fIndex = index;
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
                value: sliderVal,
                min: -1,
                max: 1,
                onChanged: (value) {
                  sliderVal = value;
                  textTopPos = Alignment(value, 0.5);
                  setState(() {});
                },
              ),
              Slider(
                value: sliderVal0,
                min: -1,
                max: 1,
                onChanged: (value) {
                  sliderVal0 = value;
                  textTopPos = Alignment(sliderVal, sliderVal0);
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
                        cIndex = index;
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

