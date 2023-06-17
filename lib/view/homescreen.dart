import 'package:flutter/material.dart';
import 'package:rs_matrimonial/controller/controller.dart';
import 'package:rs_matrimonial/utils/cons.dart';
import 'package:get/get.dart';
import 'package:rs_matrimonial/view/profile_details.dart';
import 'package:rs_matrimonial/view/search.dart';
class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  datacontroller rscontroller = Get.put(datacontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.pink),
        backgroundColor: Colors.white,shadowColor: Colors.transparent,centerTitle: true,
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("RS ",style: TextStyle(color: Colors.black),),
                Text("Matrimonial",style: TextStyle(color: Colors.pink),),
              ],
            ),
            Icon(Icons.account_circle_rounded)
          ],
        ),
      ),
      // drawer: Drawer(backgroundColor: Colors.pink,shadowColor: Colors.pink),
      backgroundColor: Colors.white,
      body: Obx(()=>rscontroller.isLoading.value?Center(child: CircularProgressIndicator(color: Colors.pink,),):
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));},
                  child: Align(alignment: Alignment.centerRight,
                      child: Icon(Icons.search,color: Colors.pink,size:30,))

                  )

              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 5),
                child: Row(
                  children: [
                    Text("Success ",style: TextStyle(color: Colors.black,fontSize: 15)),
                    Text("Stories ",style: TextStyle(color: Colors.pink,fontSize: 18,fontWeight: FontWeight.bold),),

                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                      child: InkWell(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile_page(
                          idd:rscontroller.rsmodel!.items[index].storyId.toString(),
                          pic:Baseurl+rscontroller.rsmodel!.items[index].couplePhotoImageUrl,
                          name:rscontroller.rsmodel!.items[index].coupleName,
                          story:rscontroller.rsmodel!.items[index].story,

                        )));
                      },
                        child: Card(color: Colors.pink.shade50,
                          child:Column(
                            children: [
                              Card(

                                child: ClipRRect(
                                  child:rscontroller.rsmodel!.items[index].couplePhotoImageUrl!=null?
                                  Image.network('${Baseurl+rscontroller.rsmodel!.items[index].couplePhotoImageUrl}',width: double.infinity,
                                    loadingBuilder: (BuildContext context, Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: CircularProgressIndicator(color: Colors.pink,
                                            value: loadingProgress.expectedTotalBytes != null
                                                ? loadingProgress.cumulativeBytesLoaded /
                                                loadingProgress.expectedTotalBytes!
                                                : null,
                                          ),
                                        ),
                                      );
                                    },

                                  )
                                      :CircularProgressIndicator(color: Colors.pink,),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),elevation: 5,shadowColor: Colors.black,
                              ),
                              SizedBox(height: 10,),
                              rscontroller.rsmodel!.items[index].coupleName!=null?Text(rscontroller.rsmodel!.items[index].coupleName,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),):Text(""),
                              SizedBox(height: 10,),
                              rscontroller.rsmodel!.items[index].story!=null?Center(child: Text(rscontroller.rsmodel!.items[index].story,style: TextStyle(color: Colors.black),textAlign: TextAlign.center,)):Text(""),
                              SizedBox(height: 20,)
                            ],
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),elevation: 5,shadowColor: Colors.pink,
                        ),
                      ),
                    );
                  },
                itemCount: rscontroller.rsmodel!.items.length,

        ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(onPressed: ()async{
                    if(rscontroller.page<=1){
                      return showDialog(
                          context: context,
                          builder: (context)=>AlertDialog(
                            title: Text("Previous not found"),
                            content: MaterialButton(child: Text("ok"),onPressed: (){Navigator.pop(context);},),
                          ));

                    }else{
                      rscontroller.page--;

                      await rscontroller.fetchdata();
                      print(rscontroller.page);
                    }

                  },
                    child: Text("Previous",),
                    color: Colors.red,
                  ),

                  Text(rscontroller.rsmodel!.pageNumber.toString()),
                  MaterialButton(onPressed: ()async{

                     if(rscontroller.page>=rscontroller.rsmodel!.totalPages){
                       return showDialog(
                           context: context,
                           builder: (context)=>AlertDialog(
                             title: Text("finish all pages"),
                             content: MaterialButton(child: Text("ok"),onPressed: (){Navigator.pop(context);},),
                           ));

                     }else{
                       rscontroller.page++;

                       await rscontroller.fetchdata();
                     }
                    print(rscontroller.page);

                  },
                  child: Text("next",),
                    color: Colors.red,
                  ),
                ],
              )
            ],
          ),
      ),

    );
  }
}
