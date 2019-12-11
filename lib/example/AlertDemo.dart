import 'package:flutter/material.dart';

class AlertDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AlertDemoState();
  }
}

Future<T> showCustomDialog<T>({
  @required BuildContext context,
  bool barrierDismissible = true,
  WidgetBuilder builder,
}) {
  final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder);
      return SafeArea(
        child: Builder(builder: (BuildContext context) {
          return theme != null
              ? Theme(data: theme, child: pageChild)
              : pageChild;
        }),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black87, // 自定义遮罩颜色
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions,
  );
}

Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  // 使用缩放动画
  return ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}


class AlertDemoState extends State<AlertDemo>{

  @override
  Widget build(BuildContext context) {
    Future<bool> showDeleteConfirmDialog1() {
      return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Text("您确定要删除当前文件吗?"),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () => Navigator.of(context).pop(false), // 关闭对话框
              ),
              FlatButton(
                child: Text("删除"),
                onPressed: () {
                  //关闭对话框并返回true
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );
    }

    Future<int> showSimpleDialog() {
      return showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        }
      );
    }

    Future<int> showListDialog() async {
      return await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          var child = Column(
            children: <Widget>[
              ListTile(title: Text("请选择")),
              Expanded(
                  child: ListView.builder(
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("$index"),
                    onTap: () => Navigator.of(context).pop(index),
                  );
                },
              )),
            ],
          );
          //使用AlertDialog会报错
          //return AlertDialog(content: child);
          return Dialog(child: child);
        }
      );
    }

    Future<bool> showCutomDialog1() {
      return showCustomDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Text("您确定要删除当前文件吗?"),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text("删除"),
                onPressed: () {
                  // 执行删除操作
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('弹窗实例')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('显示弹窗'),
              onPressed:  () async {
                bool delete = await showDeleteConfirmDialog1();
                print(delete);
              },
            ),
            RaisedButton(
              child: Text('选择语言'),
              onPressed:  () async {
                int type = await showSimpleDialog();
                print(type);
              },
            ),
            RaisedButton(
              child: Text('显示列表弹窗'),
              onPressed:  () async {
                int type = await showListDialog();
                print(type);
              },
            ),
            RaisedButton(
              child: Text('自定义弹窗'),
              onPressed:  () async {
                bool type = await showCutomDialog1();
                print(type);
              },
            )
          ],
        ),
      ),
    );
  }
}