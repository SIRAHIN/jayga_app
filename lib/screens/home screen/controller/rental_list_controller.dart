import 'dart:convert';
import 'package:get/get.dart';
import 'package:jayga_app/models/rentalModel.dart';
import 'package:jayga_app/services/api_services.dart';

class RentalListController extends GetxController {
  RxList<RentalsModel> rentalList = RxList([]);
  RxList<RentalsModel> fitlerListData =   RxList([]);

  RxBool isLoading = false.obs;


  @override
  void onInit(){
    super.onInit();
    //initial dataload function
    getAllRentals();
    fitlerListData.value = rentalList;
  }



    // Rental list search function //
    void filterPlayer(String rentalInfo){
      List<RentalsModel> results = [];
      if(rentalInfo.isEmpty){
        results = rentalList;
      }else {
        results = 
        rentalList.where((element) => 
        element.title.
        toString().
        toLowerCase().
        contains(rentalInfo.
        toLowerCase())).
        toList();
      }
      fitlerListData.value = results;
    }
  
  
  // json Decode function to store inital data into list //
  Future<List<RentalsModel>> getAllRentals() async {
    isLoading.value = true;
    try {
      rentalList.clear();
      var responseData = await ApiServices.fetchData();
      List decodeResponse = jsonDecode(responseData);
      for (var element in decodeResponse) {
      rentalList.add(RentalsModel.fromJson(element));
      }
      isLoading.value = false;
      update();
      return rentalList;
    } on Exception catch (ex) {
      throw Exception(ex.toString());
    }
  }
}

