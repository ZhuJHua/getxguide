import 'package:get/get.dart';

class AState {
  // 这是一个普通的变量
  int count = 0;

  // 这是一个响应式的变量，类型为Rx<T>，需要在变量末尾添加.obs
  RxInt rxCount = 0.obs;

  AState();
}
