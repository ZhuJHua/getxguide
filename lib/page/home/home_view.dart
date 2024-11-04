import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxguide/page/b/b_logic.dart';
import 'package:getxguide/router/app_route.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    /// 当你将页面与路由绑定时，可以直接通过find方法来找到你的控制器
    final logic = Bind.find<HomeLogic>();
    final state = Bind.find<HomeLogic>().state;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: OverflowBar(
          children: [
            FilledButton(
                onPressed: () {
                  /// 当你想跳转页面时，无需使用context，参数是可选的
                  Get.toNamed(AppRoutes.aPage, arguments: '1');
                },
                child: Text('去页面A')),
            FilledButton(
                onPressed: () {
                  /// 当你想跳转页面，同时需要不同的实例
                  /// 可以选择手动 LazyPut 对应的控制器，tag，就是区分不同控制器的参数
                  String tag = Random().nextInt(999).toString();
                  Bind.lazyPut(() => BLogic(), tag: tag);

                  /// 这个时候，需要吧对应的tag传递给页面
                  Get.toNamed(AppRoutes.bPage, arguments: tag);
                },
                child: Text('去页面B')),
          ],
        ),
      ),
    );
  }
}
