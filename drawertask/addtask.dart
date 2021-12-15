import 'package:day_19/widget/drawerwidget.dart';
import 'package:flutter/material.dart';

class UploadTask extends StatefulWidget {
  const UploadTask({Key? key}) : super(key: key);

  @override
  _UploadTaskState createState() => _UploadTaskState();
}

class _UploadTaskState extends State<UploadTask> {

  List<String>taskcategory=[
    'First Task',
    'Second Task',
    'Third Task',
    'Four Task',
    'Five Task',

  ];
  TextEditingController _taskController = TextEditingController(text: 'TaskCategory');
  TextEditingController _titleController = TextEditingController(text: 'TaskTitle');
  TextEditingController _descController = TextEditingController(text: 'TaskDescription');
  TextEditingController _dateController = TextEditingController(text: 'DeadLine Date');
  DateTime?picked;
  @override
  void dispose() {
    super.dispose();
    _taskController.dispose();
    _titleController.dispose();
    _descController.dispose();
    _dateController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    return Scaffold(
      drawer:  DrawerWidget(),
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: Colors.pink,
      body: Padding(
        padding: const EdgeInsets.only(top: 50,left: 10,right: 10,bottom: 50),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'All Fields Are Required',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ),
              ),
              Divider(thickness: 2),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _listTitle(label: 'Task Category*'),
                      SizedBox(height: 10),
                      _textFormField(
                          valueKey: 'TaskCategory',enabled: false,
                          fct: (){
                            _ShowTaskcartegory(size:size);
                          },maxLength: 100,controller: _taskController
                      ),
                      _listTitle(label: 'Task Category*'),
                      SizedBox(height: 10),
                      _textFormField(
                          valueKey: 'Task Title',enabled: false,
                          fct: (){},maxLength: 100,controller: _titleController
                      ),
                      _listTitle(label: 'Task Description*'),
                      SizedBox(height: 10),
                      _textFormField(
                          valueKey: 'TaskDescription',enabled: true,
                          fct: (){},maxLength: 100,controller: _descController
                      ),
                      _listTitle(label: 'Deadline Date'),
                      SizedBox(height: 10),
                      _textFormField(
                          valueKey: 'Deadline Date',enabled: false,
                          fct: (){
                            _pickerDilong();
                          },maxLength: 100,controller: _dateController
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: MaterialButton(
                          color: Colors.pink.shade700,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onPressed: () {  },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Upload',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,fontSize: 20
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _pickerDilong() async{
    picked=await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(
        Duration(days: 0)
        
      ),
      lastDate: DateTime(2100)
      
    );
    setState(() {
      _dateController.text="${picked!.year}--${picked!.month}--${picked!.day}";

    });
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
                      setState(() {
                        _taskController.text=taskcategory[index];
                      });
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
  Widget _textFormField({
    required String valueKey,
    required TextEditingController controller,
    required bool enabled,
    required Function fct,
    required int maxLength,
  }){
    return InkWell(
      onTap: (){
        fct();
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          controller: controller,
          maxLines: valueKey=='TaskDescription'? 3:1,
          maxLength: maxLength,
          enabled: enabled,
          key: ValueKey(valueKey),
          style: TextStyle(color: Colors.blue),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.yellow,
            enabledBorder:UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
  Widget _listTitle({required String label}){
    return Text(
      label,
      style: TextStyle(color: Colors.pink,fontSize: 16,fontWeight: FontWeight.bold),
    );
  }
}
