import 'package:get/get.dart';


class CategoryController extends GetxController {

  int selectedCatagoryIndex = 0; 

  changeCatagoryIndex (int index){
    selectedCatagoryIndex = index;
    update();
  }

  
}