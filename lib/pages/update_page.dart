import 'package:flutter/material.dart';
import 'package:provider_dio/models/post_model.dart';
import 'package:provider_dio/view_models/update_view.dart';

class UpdatePage extends StatefulWidget {

  static final String id = "update_page";
  final Post post;
  UpdatePage({this.post});

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  UpdateView updateView = UpdateView();

  @override
  void initState() {
    super.initState();
    updateView.getOldPost(widget.post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update post'),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: updateView.titleController,
                  decoration: InputDecoration(
                    labelText: "Post Title",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.only(right: 15, left: 15),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: updateView.bodyController,
                  decoration: InputDecoration(
                    labelText: "Post Body",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.only(
                        right: 15, top: 15, bottom: 50, left: 15),
                  ),
                  maxLines: 7,
                ),
                SizedBox(height: 30,),
                RaisedButton(
                  onPressed: () {
                    updateView.apiCreatePost(context);
                  },
                  child: Text ("Update"),
                  color: Colors.blue,
                ),
              ],
            ),
          ),

          updateView.isLoading ? Center(child: CircularProgressIndicator()) : SizedBox.shrink(),
        ],
      ),
    );
  }
}