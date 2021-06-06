import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hr_relocation/screens/layout_template/layout_template.dart';
import 'package:hr_relocation/screens/sign_in_screen.dart';
import 'package:hr_relocation/utils/authentication.dart';
import 'package:image_picker/image_picker.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

CollectionReference postdb = FirebaseFirestore.instance.collection('posts');

class _AddScreenState extends State<AddScreen> {
  late File? imageFile = null;
  final picker = ImagePicker();

  chooseImage(ImageSource source) async{
    final pickedFile = await picker.getImage(source:source);

    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }

  TextEditingController branchController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController divisionController = TextEditingController();
  TextEditingController dutystationController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  TextEditingController postController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(child: Text('Add', style: TextStyle(color: Colors.blue),)),
        leading: TextButton(
          child: Text('Cancel'),
          style: TextButton.styleFrom(
              primary: Colors.black, textStyle: TextStyle(fontSize: 12)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Save'),
            style: TextButton.styleFrom(
                primary: Colors.blueAccent, textStyle: TextStyle(fontSize: 12)),
            onPressed: () {
              addPost(
                  currentUser.uid,
                  branchController.text,
                  descriptionController.text,
                  divisionController.text,
                  dutystationController.text,
                  levelController.text,
                  postController.text,
                  titleController.text);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LayoutTemplate(user: currentUser),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
//             Container(
//               child: imageFile != null?
//               GestureDetector(
//                 onTap:(){
// chooseImage(ImageSource.gallery);
//                 },
//                               child: Container(
//                 height:200,
//                 width: 200,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image:FileImage(imageFile!),
//                   ),
//                 ),
//             ),
//               )
//             : Container(
//               height:200,
//               width:200,
//               decoration:BoxDecoration(
//                 color:Colors.grey
//               )
//             ),
//             ),
            TextField(
              decoration: InputDecoration(
                  focusedBorder: new UnderlineInputBorder(
                      borderSide: new BorderSide(
                          color: Colors.blue,
                          width: 2,
                          style: BorderStyle.solid)),
                  labelText: "Branch",
                  fillColor: Colors.blue,
                  labelStyle: TextStyle(
                    color: Colors.blue,
                  )),
              controller: branchController,
            ),
            TextField(
              decoration: InputDecoration(
                  focusedBorder: new UnderlineInputBorder(
                      borderSide: new BorderSide(
                          color: Colors.blue,
                          width: 2,
                          style: BorderStyle.solid)),
                  labelText: "Description",
                  fillColor: Colors.blue,
                  labelStyle: TextStyle(
                    color: Colors.blue,
                  )),
              controller: descriptionController,
            ),
            TextField(
              decoration: InputDecoration(
                  focusedBorder: new UnderlineInputBorder(
                      borderSide: new BorderSide(
                          color: Colors.blue,
                          width: 2,
                          style: BorderStyle.solid)),
                  labelText: "Division",
                  fillColor: Colors.blue,
                  labelStyle: TextStyle(
                    color: Colors.blue,
                  )),
              controller: divisionController,
            ),
            TextField(
              decoration: InputDecoration(
                  focusedBorder: new UnderlineInputBorder(
                      borderSide: new BorderSide(
                          color: Colors.blue,
                          width: 2,
                          style: BorderStyle.solid)),
                  labelText: "DutyStation",
                  fillColor: Colors.blue,
                  labelStyle: TextStyle(
                    color: Colors.blue,
                  )),
              controller: dutystationController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  focusedBorder: new UnderlineInputBorder(
                      borderSide: new BorderSide(
                          color: Colors.blue,
                          width: 2,
                          style: BorderStyle.solid)),
                  labelText: "Position Level",
                  fillColor: Colors.white,
                  labelStyle: TextStyle(
                    color: Colors.blue,
                  )),
              controller: levelController,
            ),
            TextField(
              decoration: InputDecoration(
                  focusedBorder: new UnderlineInputBorder(
                      borderSide: new BorderSide(
                          color: Colors.blue,
                          width: 2,
                          style: BorderStyle.solid)),
                  labelText: "Post",
                  fillColor: Colors.white,
                  labelStyle: TextStyle(
                    color: Colors.blue,
                  )),
              controller: postController,
            ),
            TextField(
              decoration: InputDecoration(
                  focusedBorder: new UnderlineInputBorder(
                      borderSide: new BorderSide(
                          color: Colors.blue,
                          width: 2,
                          style: BorderStyle.solid)),
                  labelText: "Title",
                  fillColor: Colors.white,
                  labelStyle: TextStyle(
                    color: Colors.blue,
                  )),
              controller: titleController,
            ),
          ],
        ),
      ),
    );
  }
  Future<void> addPost(String uid, String branch, String description, String division,
      String dutystation, String level, String post, String title) {
    return postdb.add({
      'uid': uid,
      'branch': branch,
      'description': description,
      'division': division,
      'dutystation': dutystation,
      'level': level,
      'post': post,
      'title': title,
    })
        .then((value) => print("Post Added"))
        .catchError((error) => print("Failed to add Post: $error"));
  }
}
