import 'package:flutter/material.dart';


class TabView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TabViewState();
  }
}
class TabViewState extends State<TabView> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2,vsync: this);
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('tab页'),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(child: Icon(Icons.favorite)),
            Tab(child: Icon(Icons.collections))
          ],
          controller: controller
        ),
      ),
      body: Container(
        child: TabBarView(
          children: <Widget>[
            Row(children: <Widget>[Text('lll')],),
            Column(children: <Widget>[Text('ffff')],)
          ],
          controller: controller,
        ),
      ),
    );
  }
}