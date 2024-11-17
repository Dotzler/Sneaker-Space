import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/data/services/notification_service.dart';
import 'package:flutter_application_1/app/modules/home/controllers/cart_controller.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/app/data/services/http_controller.dart';
import 'package:flutter_application_1/app/modules/article_detail/bindings/article_detail_bindings.dart';
import 'package:flutter_application_1/app/modules/article_detail/views/article_detail_view.dart';
import 'package:flutter_application_1/app/modules/article_detail/views/article_detail_web_view.dart';
import 'package:flutter_application_1/app/modules/home/views/home_view.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();
  await NotificationService().initNotifications();
  Get.lazyPut<CartController>(() => CartController());

  Get.put(HttpController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sneaker Space',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      getPages: [
        GetPage(
          name: Routes.HOME,
          page: () => HomePage(),
        ),
        GetPage(
          name: Routes.ARTICLE_DETAILS,
          page: () => ArticleDetailPage(article: Get.arguments),
          binding: ArticleDetailBinding(),
        ),
        GetPage(
          name: Routes.ARTICLE_DETAILS_WEBVIEW,
          page: () => ArticleDetailWebView(article: Get.arguments),
          binding: ArticleDetailBinding(),
        ),
      ],
    );
  }
}
