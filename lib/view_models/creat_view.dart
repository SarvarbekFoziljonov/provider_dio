import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider_dio/models/post_model.dart';
import 'package:provider_dio/services/dio_service.dart';

class CreateView extends ChangeNotifier {
  bool isLoading = false;
  var titleController = TextEditingController();
  var postController = TextEditingController();
  apiCreatePost (BuildContext context) async{
    isLoading = true;
    notifyListeners();
    String title = titleController.text.trim().toString();
    String body = postController.text.trim().toString();
    Post post = Post(title: title, body: body, userId: 1);
    var response =  await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    print (response);
    isLoading = false;
    notifyListeners();
    if (response != null) {
      Navigator.pop(context, response);

    } else {
      Navigator.pop(context, null);
    }
    notifyListeners();
  }
}