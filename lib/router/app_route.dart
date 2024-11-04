import 'package:get/get.dart';
import 'package:getxguide/page/a/a_logic.dart';
import 'package:getxguide/page/a/a_view.dart';
import 'package:getxguide/page/b/b_logic.dart';
import 'package:getxguide/page/b/b_view.dart';
import 'package:getxguide/page/home/home_logic.dart';
import 'package:getxguide/page/home/home_view.dart';

/// 这里是页面和路由进行绑定
/// LazyPut 意味着延迟注入，只有在访问对应页面时才注入
class AppPages {
  static final List<GetPage> pages = [
    /// 首页
    GetPage(
      /// 路由名称
      name: AppRoutes.homePage,

      /// 页面
      page: () => const HomePage(),

      /// 路由和 logic 绑定，使用 LazyPut 延迟注入
      /// 这里的 binds 是一个列表，也就是你可以同时注入多个 Logic ，比如首页中的 PageView
      binds: [Bind.lazyPut(() => HomeLogic())],
    ),

    /// 页面 A
    GetPage(
      name: AppRoutes.aPage,
      page: () => const APage(),
      binds: [Bind.lazyPut(() => ALogic())],
    ),

    /// 页面 B
    GetPage(
      name: AppRoutes.bPage,
      page: () => const BPage(),
      binds: [Bind.lazyPut(() => BLogic())],
    ),
  ];
}

/// 这里存放页面的名称，用于 named route（命名路由）
class AppRoutes {
  static const homePage = '/homePage';
  static const aPage = '/aPage';
  static const bPage = '/bPage';
}
