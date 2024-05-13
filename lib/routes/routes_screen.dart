import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:jayga_app/routes/routes_name.dart';
import 'package:jayga_app/screens/RentalDetails_screen/details_screen.dart';
import 'package:jayga_app/screens/home%20screen/home_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: RoutesName.homeScreen, page: () =>    HomeScreen()),
  GetPage(name: RoutesName.detailsScreen, page: () => const  DetailsScreen()),
 // GetPage(name: RoutesName.calenderScreen, page: () =>   CalenderScreen()),

]; 