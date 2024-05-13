
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jayga_app/utils/constants/api_constants.dart';


class ApiServices {



  static Future<String> fetchData() async {

    String url = APIConstants.baseURL + APIConstants.endpoint;
    try {
      http.Response response = await http.get(Uri.parse(url));
    
      if (response.statusCode == 200) {
      
        return response.body;
      } 
    } on Exception catch (ex) {
      throw Exception(ex.toString());
     
    }
    return "";
  }

  static Future postBookedDates (String? id, List<String> dates) async {
    String url = "${APIConstants.baseURL}${APIConstants.endpoint}/$id";
    http.Response response = await http.put(Uri.parse(url),
    body: {
      "booked_dates" : dates
    }
    );
    if(response.body == 200){
      Get.snackbar("Booked", "Your Booked Confirm");
    } else {
      Get.snackbar("Error", "Your Booked not Confirm");
    }
  }
 }


