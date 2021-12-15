
import 'package:day_19/screenwidget/taskwidget.dart';
import 'package:day_19/widget/drawerwidget.dart';
import 'package:flutter/material.dart';

class  Taskscreen extends StatefulWidget {
  const  Taskscreen({Key? key}) : super(key: key);

  @override
  State<Taskscreen> createState() => _TaskscreenState();
}

class _TaskscreenState extends State<Taskscreen> {
  List<String>taskcategory=[
    'First Task',
    'Second Task',
    'Third Task',
    'Four Task',
    'Five Task',

  ];
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(),

      appBar: AppBar(
        leading: Builder(
          builder: (ctx){
            return IconButton(
              onPressed: (){
                Scaffold.of(ctx).openDrawer();
              },
              icon: Icon(Icons.menu,size: 30,color: Colors.teal),

            );
          },
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Task',
          style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: (){
              _ShowTaskcartegory(size:size);
            },
            icon: Icon(Icons.filter_list_outlined,size: 30,color: Colors.teal),
          )
        ],

      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),

        itemBuilder: (BuildContext context, int index){
          return taskwidget();
        },
        itemCount: 10,
      ),
    );
  }
  _ShowTaskcartegory({required Size size}){
    showDialog(
      context: context,
      builder: (ctx){
        return AlertDialog(
          title: Text(
            'Task Category',
            style: TextStyle(color: Colors.red,fontSize: 20)
          ),
          content: Container(
            width: size.width* 0.9,
            child: ListView.builder(
              shrinkWrap:true,
              itemCount: taskcategory.length,
              itemBuilder: (ctxx,index){
                return InkWell(
                  onTap: (){

                  },
                  child: Row(
                    children: [
                      Icon(Icons.check_circle_rounded,color: Colors.red),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          taskcategory[index],
                          style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic,color: Colors.pink),
                        ),

                      )
                    ],
                  ),
                );
              }




            ),
          ),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.canPop(context)? Navigator.pop(context):null;
              },
              child: Text(
                'Close',
              ),

            ),
            TextButton(
              onPressed: (){},
              child: Text(
                'Cancel Filter',
                style: TextStyle(color: Colors.teal),
              ),
            )
          ],

        );
      },
    );

  }
}


