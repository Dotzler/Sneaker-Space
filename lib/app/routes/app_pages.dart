import 'package:flutter_application_1/app/modules/article_detail/bindings/article_detail_bindings.dart';
import 'package:flutter_application_1/app/modules/article_detail/views/article_detail_view.dart';
import 'package:flutter_application_1/app/modules/article_detail/views/article_detail_web_view.dart';
import 'package:flutter_application_1/app/modules/home/views/cart_view.dart';
import 'package:flutter_application_1/app/modules/home/views/chat_view.dart';
import 'package:flutter_application_1/app/modules/home/views/login_view.dart';
import 'package:flutter_application_1/app/modules/home/views/profile_view.dart';
import 'package:flutter_application_1/app/modules/home/views/signup_view.dart';
import 'package:flutter_application_1/app/modules/home/views/store_view.dart';
import 'package:flutter_application_1/app/modules/home/views/wishlist_view.dart';
import 'package:flutter_application_1/app/modules/http_screen/bindings/http_binding.dart';
import 'package:flutter_application_1/app/modules/http_screen/views/http_view.dart';
import 'package:get/get.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/microphone_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    // Add more routes here
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: _Paths.STORE,
      page: () => StorePage(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfilePage(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartPage(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatPage(),
    ),
    GetPage(
      name: _Paths.WISHLIST,
      page: () => WishlistPage(wishlist: [],),
    ),

    GetPage(
      name: _Paths.HTTP,
      page: () => const HttpView(),
      binding: HttpBinding(),
    ),
    
    GetPage(
      name: _Paths.ARTICLE_DETAILS,
      page: () => ArticleDetailPage(article: Get.arguments),
      binding: ArticleDetailBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE_DETAILS_WEBVIEW,
      page: () => ArticleDetailWebView(article: Get.arguments),
      binding: ArticleDetailBinding(),
    ),
    GetPage(
     name: _Paths.MICROPHONE,
      page: () => MicrophonePage(),
    ),

    // Add more routes as needed
  ];
}