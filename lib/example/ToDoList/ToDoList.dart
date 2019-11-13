import 'package:flutter/material.dart';
import 'dart:math' as math;

class ToDoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ToDoListState();
  }
}

class ToDoListState extends State<ToDoList> {
  List todoLists = ['1'];
  TextEditingController textController = TextEditingController();
  FocusNode focusNode = new FocusNode();
  bool selectAl = false;
  List getToDoList() {
    int index = -1;
    return todoLists.map((item) {
      index++;
      return todoItem(item, index);
    }).toList();
  }

  Widget todoItem(String item, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(item),
        GestureDetector(
          child: Icon(
            Icons.close,
            color: Color(0xFFcc9a9a),
            size: 30,
          ),
          onTap: () {
            setState(() {
              todoLists.removeAt(index);
            });
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('todolist'),
        backgroundColor: Color(0xFF41b883),
      ),
      body: Container(
        color: Color(0xFFf3f5f6),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('todos',
                  style: TextStyle(
                      color: Color.fromRGBO(175, 47, 47, 0.15),
                      fontSize: 80,
                      fontWeight: FontWeight.normal)),
              Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints(
                          // minHeight: 100,
                          // maxHeight: 100
                          ),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(
                                0, 0, 0, 0.05), //阴影默认颜色,不能与父容器同时设置color
                            offset: Offset(0, -2), //延伸的阴影，向右下偏移的距离
                            blurRadius: 5, //延伸距离,会有模糊效果
                            spreadRadius: 0 //延伸距离,不会有模糊效果
                            )
                      ]),
                      child: TextField(
                          focusNode: focusNode,
                          controller: textController,
                          onSubmitted: (text) {
                            setState(() {
                              todoLists.add(text);
                              textController.text = '';
                              focusNode.unfocus();
                            });
                          },
                          decoration: InputDecoration(
                              prefixIcon: GestureDetector(
                                child: Transform.rotate(
                                    angle: math.pi / 2,
                                    child: Icon(Icons.arrow_forward_ios,
                                        color: Color(selectAl
                                            ? 0xFF737373
                                            : 0xFFe6e6e6))),
                                onTap: () {
                                  
                                },
                              ),
                              fillColor: Colors.white,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFededed))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFededed))),
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 20),
                              hintText: "What needs to be done?")),
                    ),
                    Container(
                      child: Column(
                        children: getToDoList(),
                      ),
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                ),
              )
            ],
          ),
        ),
        constraints: BoxConstraints(
            minWidth: double.infinity, minHeight: double.infinity),
      ),
    );
  }
}
