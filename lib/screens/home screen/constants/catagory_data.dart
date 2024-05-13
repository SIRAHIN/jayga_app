import 'package:jayga_app/utils/constants/assets_paths.dart';

class Category {
  final String icon;
  final String title;
  

  Category({
    required this.icon,
    required this.title,
  });

}

List<Category> catagoryData = [
  Category(icon: allIcon, title: "All"),
  Category(icon: roomIcon, title: "Rooms"),
  Category(icon: aprtIcon, title: "Apartments"),
  Category(icon: hotelsIcon, title: "Hotels"),
];