import 'package:flutter/material.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      elevation: 10,
      child: ListTile(
        onTap: (){},
        onLongPress: (){},
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        leading: Container(
          padding: EdgeInsets.only(right: 25),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                  width: 2
              ),
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.yellow,
            radius: 20,
            child: Image.asset('images/icons/ashrafi2.png'),
          ),
        ),
        title: Text(
          'User',
          style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold),
          maxLines: 1,overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.linear_scale_outlined,size: 30,color: Colors.teal),
            Text(
              'Create beautiful apps faster with Flutter’s collection of visual, structural, platform, and interactive widgets. In addition to browsing widgets by category, you can also see all the widgets in the widget index.',
              style: TextStyle(fontSize: 16,color: Colors.teal),
              maxLines: 2,overflow: TextOverflow.ellipsis,
            )

          ],
        ),
        trailing: Icon(Icons.email),






      ),

    );
  }
}
