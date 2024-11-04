import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'a_logic.dart';

class APage extends StatelessWidget {
  const APage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Bind.find<ALogic>();
    final state = Bind.find<ALogic>().state;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GetBuilder<ALogic>(
                id: 'Count',
                builder: (_) {
                  return Text(state.count.toString());
                }),
            FilledButton(
                onPressed: () {
                  logic.updateCount();
                },
                child: Text('普通变量，使用GetBuilder包裹\n性能最好，但是要手动刷新')),
            Obx(() {
              return Text(state.rxCount.value.toString());
            }),
            FilledButton(
                onPressed: () {
                  logic.updateRxCount();
                },
                child: Text('响应式变量，使用Obx包裹\n可以自动刷新，但是性能一般')),
            FilledButton(
                onPressed: () {
                  // 当你想使用弹窗时，可以调用Get.dialog，可以看到他不需要context
                  Get.dialog(SimpleDialog(
                    children: [Text('dialog')],
                  ));

                  /// 如果你不喜欢这种方式，使用原生弹窗也是ok的，没有区别
                  /// 只是get帮你去掉了context
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          children: [Text('dialog')],
                        );
                      });
                },
                child: Text('使用getx弹窗')),
            FilledButton(
                onPressed: () {
                  // 当你使用getx时，可以在任何地方获取到你的context
                  // 只需要使用
                  Get.context!;
                },
                child: Text('获取全局context'))
          ],
        ),
      ),
    );
  }
}
