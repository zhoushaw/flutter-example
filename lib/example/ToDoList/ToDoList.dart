import 'package:flutter/material.dart';
import 'dart:math' as math;

class ToDoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ToDoListState();
  }
}

enum SelectMode { All, Active, Completed }

class ListItem {
  bool isSelect;
  String value;
  ListItem({this.isSelect, this.value});
}

class ToDoListState extends State<ToDoList> {
  List<ListItem> todoLists = [];

  TextEditingController textController = TextEditingController();
  FocusNode focusNode = new FocusNode();
  bool selectAl = false;
  var mode = SelectMode.All;

  List getToDoList() {
    int index = -1;
    List<Widget> list = [];
    todoLists.forEach((item) {
      index++;
      if (mode == SelectMode.All) {
        list.add(todoItem(item, index));
      }

      if (mode == SelectMode.Active && item.isSelect != true) {
        list.add(todoItem(item, index));
      }

      if (mode == SelectMode.Completed && item.isSelect == true) {
        list.add(todoItem(item, index));
      }
    });
    return list;
  }

  Widget todoItem(item, int index) {
    return Container(
      constraints: BoxConstraints(minHeight: 60),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xFFededed), width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              value: todoLists[index].isSelect,
              onChanged: (value) {
                setState(() {
                  todoLists[index].isSelect = value;
                });
              }),
          Expanded(
            child: Text(item.value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 20,
                    height: 1,
                    color: Color(0xaa4d4d4d),
                    decoration:
                        item.isSelect ? TextDecoration.lineThrough : null)),
          ),
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
      ),
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
          child: SingleChildScrollView(
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('todos',
                    textAlign: TextAlign.center,
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
                                todoLists.add(
                                    new ListItem(isSelect: false, value: text));
                                textController.text = '';
                                focusNode.unfocus();
                              });
                            },
                            style: TextStyle(
                                fontSize: 20, color: Color(0xFF4d4d4d)),
                            decoration: InputDecoration(
                                prefixIcon: GestureDetector(
                                  child: Transform.rotate(
                                      angle: math.pi / 2,
                                      child: Icon(Icons.arrow_forward_ios,
                                          size: 20,
                                          color: Color(selectAl
                                              ? 0xFF737373
                                              : 0xFFe6e6e6))),
                                  onTap: () {
                                    setState(() {
                                      selectAl = !selectAl;
                                    });
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
                                hintText: "What needs to be done?",
                                hintStyle: TextStyle(
                                    color: Color(0xFFededed), fontSize: 20))),
                      ),
                      Container(
                        child: Column(
                          children: getToDoList(),
                        ),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                  ),
                ),
                Container(
                  color: Colors.white,
                  constraints: BoxConstraints(minHeight: 50),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('${todoLists.length} items'),
                        ButtonTheme(
                          minWidth: 50,
                          height: 10,
                          child: OutlineButton(
                            padding: EdgeInsets.all(5),
                            borderSide: mode == SelectMode.All
                                ? BorderSide(
                                    color: Color.fromRGBO(175, 47, 47, 0.15))
                                : BorderSide.none,
                            child: Text('All'),
                            onPressed: () {
                              setState(() {
                                mode = SelectMode.All;
                              });
                            },
                          ),
                        ),
                        ButtonTheme(
                          minWidth: 50,
                          height: 10,
                          child: OutlineButton(
                            padding: EdgeInsets.all(5),
                            borderSide: mode == SelectMode.Active
                                ? BorderSide(
                                    color: Color.fromRGBO(175, 47, 47, 0.15))
                                : BorderSide.none,
                            child: Text('Active'),
                            onPressed: () {
                              setState(() {
                                mode = SelectMode.Active;
                              });
                            },
                          ),
                        ),
                        ButtonTheme(
                          minWidth: 50,
                          height: 10,
                          child: OutlineButton(
                            padding: EdgeInsets.all(5),
                            borderSide: mode == SelectMode.Completed
                                ? BorderSide(
                                    color: Color.fromRGBO(175, 47, 47, 0.15))
                                : BorderSide.none,
                            child: Text('Completed'),
                            onPressed: () {
                              setState(() {
                                mode = SelectMode.Completed;
                              });
                            },
                          ),
                        ),
                        GestureDetector(
                          child: Text('clear'),
                          onTap: () {
                            print('dianjil');
                            setState(() {
                              todoLists = todoLists.where((item)=>!item.isSelect);
                            });
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
          ),
          constraints: BoxConstraints(
              minWidth: double.infinity, minHeight: double.infinity),
        ));
  }
}
