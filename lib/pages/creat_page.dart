import 'package:flutter/material.dart';
import 'package:provider_dio/view_models/creat_view.dart';

class CreatPage extends StatefulWidget {

  static final String id = "creat_page";

  @override
  _CreatPageState createState() => _CreatPageState();
}

class _CreatPageState extends State<CreatPage> {

  CreateView createView = CreateView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Creat Post"),
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(

                children: [
                  Container(
                    height: 40,
                    width: double.infinity,
                    child: TextField(
                      controller: createView.titleController,
                      decoration: InputDecoration(
                        labelText: "Title",
                        border: OutlineInputBorder (),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  Container(
                    height: 100,
                    width: double.infinity,
                    child: TextField(
                      controller: createView.postController,
                      decoration: InputDecoration(
                        labelText: "Post",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: (){
                      createView.apiCreatePost (context);
                    },
                    child: Text("Creat post"),
                    color: Colors.blue,
                  )
                ],
              ),
            ),
            createView.isLoading ? Center (
              child: CircularProgressIndicator(),
            ) : SizedBox.shrink(),

          ],
        )
    );
  }
}