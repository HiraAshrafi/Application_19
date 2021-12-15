
import 'package:day_19/drawertask/My_account.dart';
import 'package:day_19/drawertask/Upload_resgister.dart';
import 'package:day_19/drawertask/addtask.dart';
import 'package:flutter/material.dart';

import '../taskscreen.dart';
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.cyan),
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Image.asset('images/icons/ashrafi2.png'),
                ),
                SizedBox(height: 20),
                Flexible(
                  flex: 1,
                  child: Text(
                    'Flutter using Android & Ios System',
                    style: TextStyle(color: Colors.yellowAccent,fontSize: 22,fontWeight: FontWeight.bold),
                  ),



                ),


              ],
            ),
          ),
          SizedBox(height: 30),
          _listtask(label: 'All Task',fct:(){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=>Taskscreen()
            ),
            );
          },icon: Icons.task_outlined),
          _listtask(label: 'My Account',fct:(){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=>Profile(),
            ));
          },icon: Icons.task_outlined),
          _listtask(label: 'Register User',fct:(){
            Navigator.push(context,MaterialPageRoute(
              builder: (context)=>Register()
            ));
          },icon: Icons.task_outlined),
          _listtask(label: 'Add a Task',fct:(){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=>UploadTask(),
            ));
          },icon: Icons.task_outlined),
          Divider(thickness: 5),
          _listtask(label: 'Logout', fct: (){
            _logout(context);
          }, icon: Icons.logout_outlined),




        ],
      ),
    );


  }
  void _logout(context){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          content: Text(
            'Do Your Want Logout?',
            style: TextStyle(fontSize: 20,color: Colors.red),
          ),
          actions: [
            TextButton(
              onPressed: (){

              },
              child: Text(
                'No',
                style: TextStyle(color: Colors.red),
              ),

            ),
            TextButton(
              onPressed: (){},
              child: Text(
                'Yes',
                style: TextStyle(color: Colors.teal),
              ),
            )
          ],
        );
      },
    );
  }
  Widget _listtask({required String label,required Function fct,required IconData icon}){
    return ListTile(
      onTap: (){
        fct();
      },
      leading: Icon(Icons.task,color: Colors.cyan),
      title: Text(
        label,
        style: TextStyle(fontSize: 20,color: Colors.pink,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
      ),
    );
  }
}
