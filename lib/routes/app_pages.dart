import 'package:get/get.dart';
import 'package:hume_admin/routes/app_routes.dart';
import 'package:hume_admin/views/addbaner/addbaner_binding.dart';
import 'package:hume_admin/views/addbaner/addbanner_view.dart';
import 'package:hume_admin/views/clientInfo/clientinfo_view.dart';
import 'package:hume_admin/views/clientInfo/clientinfp_binding.dart';
import 'package:hume_admin/views/home/home_binding.dart';
import 'package:hume_admin/views/notification.dart/notification_binding.dart';
import 'package:hume_admin/views/notification.dart/notification_view.dart';
import 'package:hume_admin/views/order/manageorder.dart';
import 'package:hume_admin/views/order/order_binding.dart';
import 'package:hume_admin/views/order/order_view.dart';
import 'package:hume_admin/views/product/addproduct_view.dart';
import 'package:hume_admin/views/home/home_view.dart';
import 'package:hume_admin/views/product/allproducts_view.dart';
import 'package:hume_admin/views/product/product_binding.dart';
import 'package:hume_admin/views/sale/sale_binding.dart';
import 'package:hume_admin/views/sale/sale_view.dart';
import 'package:hume_admin/views/shops/add_shop_view.dart';
import 'package:hume_admin/views/shops/shops_binding.dart';
import 'package:hume_admin/views/shops/shops_view.dart';
import 'package:hume_admin/views/splash/splash_binding.dart';
import 'package:hume_admin/views/splash/splash_view.dart';
import 'package:hume_admin/views/welcome/welcome_view.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.addbanner,
      page: () => const AddBanner(),
      binding: AddBannerBinding(),
    ),
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomeView(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.sale,
      page: () => const SaleScreen(),
      binding: SaleBinding(),
    ),
    GetPage(
      name: AppRoutes.shop,
      page: () => const ShopScreen(),
      binding: ShopBinding(),
    ),
    GetPage(
      name: AppRoutes.addshop,
      page: () => const AddShop(),
      binding: ShopBinding(),
    ),
    GetPage(
      name: AppRoutes.addproduct,
      page: () => const AddProductScreen(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: AppRoutes.allproduct,
      page: () => const AllProductScreen(),
       binding: ProductBinding(),
    ),
    GetPage(
      name: AppRoutes.order,
      page: () => const OrderHistory(),
       binding: OrderBinding(),
    ),
    GetPage(
      name: AppRoutes.notification,
      page: () => const NotificationScreen(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: AppRoutes.clientinfo,
      page: () => const ClientInfoScreen(),
      binding: ClientBinding(),
    ),
      GetPage(
      name: AppRoutes.manageorder,
      page: () => const ManageOrder(),
      binding: OrderBinding(),
    ),
  ];
}
