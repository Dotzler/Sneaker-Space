part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const String HOME = _Paths.HOME;
  static const String LOGIN = _Paths.LOGIN;
  static const String SIGNUP = _Paths.SIGNUP;
  static const String STORE = _Paths.STORE;
  static const String PROFILE = _Paths.PROFILE;
  static const String CART = _Paths.CART;
  static const String CHAT = _Paths.CHAT;
  static const String WISHLIST = _Paths.WISHLIST;
  static const HTTP = _Paths.HTTP;
  static const ARTICLE_DETAILS = _Paths.ARTICLE_DETAILS;
  static const ARTICLE_DETAILS_WEBVIEW = _Paths.ARTICLE_DETAILS_WEBVIEW;
}

abstract class _Paths {
  _Paths._();

   static const String MICROPHONE = '/microphone';
  static const String HOME = '/home';
  static const String LOGIN = '/login';
  static const String SIGNUP = '/signup';
  static const String STORE = '/store';
  static const String PROFILE = '/profile';
  static const String CART = '/cart';
  static const String CHAT = '/chat';
  static const String WISHLIST = '/wishlist';
  static const HTTP = '/http_view';
  static const ARTICLE_DETAILS = '/article_details';
  static const ARTICLE_DETAILS_WEBVIEW = '/article_details_webview';
}