import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'a_state.dart';

class ALogic extends GetxController {
  final AState state = AState();

  late final TextEditingController textEditingController =
      TextEditingController();

  @override
  void onInit() {
    // 初始化生命周期函数，控制器最开始的一帧，这里可以进行一些初始化操作
    super.onInit();
  }

  @override
  void onReady() {
    // 这里会在 onInit 的一帧之后调用，可以进行一些网络请求，可以将方法改为 async 异步
    super.onReady();
  }

  @override
  void onClose() {
    // 这里是关闭的操作，你可以在这里关闭一些控制器
    // 你不需要在这里关闭getx的控制器，因为它不是一个'Controller'
    textEditingController.dispose();
    super.onClose();
  }

  void updateCount() {
    state.count += 1;

    /// update可以携带id参数，指定要刷新的区域
    /// update方法来自于Controller，所以id只会影响对应Logic范围内的GetBuilder
    update(['Count']);
  }

  void updateRxCount() {
    state.rxCount.value += 1;

    /// rx响应式变量无需手动调用update，只需要给其赋值即可
    /// 需要注意的是，需要通过.value方法拿到真正的值
    /// 不过对于某些类型，比如RxList，可以不使用.value方法来获取值，当然用也是可以的
  }
}
