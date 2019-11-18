import 'package:flutter/material.dart';


class Provider implements Listenable {

  @override
  void addListener(VoidCallback listener) {
     //添加监听器
  }
  @override
  void removeListener(VoidCallback listener) {
    //移除监听器
  }

  void notifyListeners() {
    //通知所有监听器，触发监听器回调   
  }

}
