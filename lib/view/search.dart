import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rs_matrimonial/controller/controller.dart';
import 'package:get/get.dart';
import 'package:rs_matrimonial/utils/cons.dart';
import 'package:rs_matrimonial/view/profile_details.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final datacontroller searchController = Get.put(datacontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,shadowColor: Colors.transparent,centerTitle: true,
        title: Text('Search',style: TextStyle(color: Colors.black,fontSize: 20),),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              cursorColor: Colors.pink,
              onChanged: (value) => setState(() {
                searchController.runFilter(value);
              }),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink)
                ),
                suffixIcon: const Icon(Icons.search,color: Colors.pink,),
                // prefix: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(),
                ),

                labelText: 'Search',labelStyle: TextStyle(color: Colors.pink)
                // prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child:searchController.foundr!.isEmpty?Text("Please try with another choice"): ListView.builder(
                itemCount: searchController.foundr!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(color: Colors.white,
                      shadowColor: Colors.pink,elevation: 5,
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile_page(
                            idd:searchController.foundr![index]['StoryId'].toString(),
                            pic:Baseurl+searchController.foundr![index]['CouplePhotoImageUrl'],
                            name:searchController.foundr![index]['CoupleName'],
                            story:searchController.foundr![index]['Story']

                          )));
                        },
                        child: ListTile(
                          title: Text('Id: ${
                                  searchController.foundr![index]['StoryId']
                                      .toString()
                                }'),
                          subtitle: Text(searchController.foundr![index]['Story']),
                          trailing: Text(searchController.foundr![index]['CoupleName']),
                        ),
                      ),
                    ),
                  );
                },
              )
            ),
        ],
      ),
    );
  }
}
