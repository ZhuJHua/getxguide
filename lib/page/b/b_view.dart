import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'b_logic.dart';

class BPage extends StatelessWidget {
  const BPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// 因为控制器不同，我们需要在find时携带tag参数
    /// 参数则通过Get.argument传来
    final logic = Bind.find<BLogic>(tag: Get.arguments);
    final state = Bind.find<BLogic>(tag: Get.arguments).state;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('我是页面B的 ${Get.arguments}实例'),
      ),
    );
  }
}
