import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getx_rest_api/constant/route_constant.dart';
import 'package:getx_rest_api/modules/details/binding/details_screen_binding.dart';
import 'package:getx_rest_api/modules/details/view/details_screen.dart';
import 'package:getx_rest_api/modules/home/binding/home_screen_binding.dart';
import 'package:getx_rest_api/modules/home/view/home_screen.dart';

List<GetPage> getPages = [
  GetPage(
    name: RouteConstant.homeScreen,
    page: () => HomeScreen(),
    binding: HomeScreenBinding(),
  ),
  GetPage(
    name: RouteConstant.detailsScreen,
    page: () => DetailsScreen(),
    transition: Transition.fadeIn,
    binding: DetailsScreenBinding(),
  ),
];
