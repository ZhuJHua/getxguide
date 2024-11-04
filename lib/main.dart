import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxguide/router/app_route.dart';

void main() {
  // 如果你不需要 路由管理 ，全局 context 等功能，可以不使用 GetMaterialApp

  runApp(GetMaterialApp(
    // 获取初始化路由，这里就指定为首页
    initialRoute: AppRoutes.homePage,
    // 页面列表，也就是 List<GetPage>
    getPages: AppPages.pages,
    // 路由跳转的动画，我一般使用 cupertino，也就是 ios 风格的动画
    defaultTransition: Transition.cupertino,
    // 其他的参数和普通的 MaterialApp 一致
  ));
}
