import 'package:flutter/material.dart';
class Profile_page extends StatefulWidget {
  String name;
  String idd;
  String story;
  String pic;

   Profile_page({Key? key, required this.story, required this.name, required this.pic,required this.idd}) : super(key: key);

  @override
  State<Profile_page> createState() => _Profile_pageState();
}

class _Profile_pageState extends State<Profile_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SafeArea(
            child: Stack(
              children: [
                ClipRRect(
                    child: Image.network(widget.pic,width: double.infinity,),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Profile",style: TextStyle(color: Colors.black,fontSize: 20),),
                    Text(" Details",style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 25),),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.story,textAlign: TextAlign.center),
          ),

        ],
      ),
    );
  }
}
