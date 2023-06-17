
import 'dart:convert';

import 'package:get/get.dart';
import 'package:rs_matrimonial/model/model.dart';
import 'package:http/http.dart' as http;

class datacontroller extends GetxController{
  var isLoading= false.obs;

  List<dynamic>? listress=[].obs;
  RxInt page=1.obs;
  List <dynamic>? foundr=[].obs;
  @override
  Future<void> onInit() async{
    // TODO: implement onInit
    super.onInit();
    await fetchdata();
    // runFilter('Chhavi');
    print('\n\nhello${foundr.toString()}');
  }

  Rs? rsmodel;

  fetchdata()async{
    try{
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse('https://www.maheshwari.org/api/successstory/list?PageNumber=$page')!);
      if(response.statusCode==200){
        Map mapres;
        var result = jsonDecode(response.body);
        rsmodel =Rs.fromJson(result);
        mapres=json.decode(response.body);
        listress=mapres['Items'];
        print(listress);

      }else{

      }
    }catch (e){
      print("error");
    }
    finally{
      isLoading(false);
    }
  }

 runFilter(String enteredKeyword) async{
    List<Map<String, dynamic>>? results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = listress!.cast<Map<String, dynamic>>();
    } else {
      results = await listress!
          .where((user) =>
          user["CoupleName"].toLowerCase().contains(enteredKeyword.toLowerCase())).cast<Map<String, dynamic>>()
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    foundr = results;
      print(foundr);
  }


}