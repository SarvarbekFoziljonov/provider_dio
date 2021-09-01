import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider_dio/models/post_model.dart';
import 'package:provider_dio/services/dio_service.dart';

class UpdateView extends ChangeNotifier {
  bool isLoading = false;
  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  Post oldPost;

  getOldPost(Post post) {
    oldPost = post;
    titleController.text = oldPost.title;
    bodyController.text = oldPost.body;
    notifyListeners();
  }

  apiCreatePost(BuildContext context) async{
    isLoading = true;
    notifyListeners();

    String title = titleController.text.trim().toString();
    String body = bodyController.text.trim().toString();
    Post post = Post(title: title, body: body, userId: oldPost.userId, id: oldPost.id);

    var response = await Network.PUT(Network.API_UPDATE + oldPost.id.toString(), Network.paramsUpdate(post));
    print(response);
    isLoading = false;
    if(response != null) {
      Navigator.pop(context, response);
    } else {
      print("Error");
    }
    notifyListeners();
  }
}