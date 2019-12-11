import 'package:example/example/AlertDemo.dart';
import 'package:example/example/FutureCom.dart';
import 'package:example/example/HttpGet.dart';
import 'package:example/example/PointerEventDemo.dart';
import 'package:example/example/Provider/ProviderRoute.dart';
import 'package:example/example/ShowDialog.dart';
import 'package:example/example/StateLessWid.dart';
import 'package:example/example/StepWid.dart';
import 'package:example/example/TabView.dart';
import 'package:example/example/TextEdit.dart';
import 'package:example/example/ToDoList/ToDoList.dart';
import 'package:example/example/UseTheme.dart';
import 'package:example/example/ChangeText.dart';
import 'package:example/example/LoadJson.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter',
      routes: {
        'toDolist': (context) => new ToDoList(),
        'providerRoute': (context) => new ProviderRoute(),
        'pointerEvent': (context) => new PointerEventDemo(),
        'alertDemo': (context) => new AlertDemo(),
        'futureCom': (context) => new FutureCom(),
        'changeText': (context) => new ChangeText(),
        'useTheme': (context) => new UseTheme(),
        'lessWid': (context) => new StateLessWid(),
        'textEdit': (context) => new TextEdit(),
        'loadJson': (context) => new LoadJson(),
        'httpRout': (context) => new HttpGet(),
        'showDialog': (context) => new ShowDialog(),
        'stepWid': (context) => new StepWid(),
        'tabView': (context) => new TabView()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.lightBlue
      ),
      home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var listText = [
      {
        'title': '待办事项',
        'route': 'toDolist'
      },
      {
        'title': '数据共享',
        'route': 'providerRoute'
      },
      {
        'title': '异步UI组件',
        'route': 'futureCom'
      },
      {
        'title': '手势',
        'route': 'pointerEvent'
      },
      {
        'title': '弹窗',
        'route': 'alertDemo'
      },
      {
        'title': '数据响应',
        'route': 'changeText'
      },
      {
        'title': '主题',
        'route': 'useTheme'
      },
      {
        'title': '无状态Widget',
        'route': 'lessWid'
      },
      {
        'title': '文本编辑',
        'route': 'textEdit'
      },
      {
        'title': '加载本地JSON文件',
        'route': 'loadJson'
      },
      {
        'title': 'Http请求',
        'route': 'httpRout'
      },
      {
        'title': '弹窗',
        'route': 'showDialog'
      },
      {
        'title': '步骤',
        'route': 'stepWid'
      },
      {
        'title': 'Tab页',
        'route': 'tabView'
      }
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("example"),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Card(
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(listText[index]['title']),
                )
              ),
              onTap: () => Navigator.pushNamed(context, listText[index]['route'])
            );
          },
          itemCount: listText.length,
        ));
  }
}
