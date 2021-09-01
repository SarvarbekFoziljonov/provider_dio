
import 'package:flutter/material.dart';
import 'package:provider_dio/models/post_model.dart';
import 'package:provider_dio/pages/creat_page.dart';
import 'package:provider_dio/pages/update_page.dart';
import 'package:provider_dio/services/dio_service.dart';

class HomeViewModel extends ChangeNotifier {
  List <Post> items = [];
  bool isLoading = false;

  Future apiPostList() async {
    isLoading = true;
    notifyListeners();
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) items = Network.parsePostList(response);
    isLoading = false;
    notifyListeners();
  }

  Future<void> apiPostDelete(Post post) async {
    isLoading = true;
    notifyListeners();
    var response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if (response != null) {
      items.remove(post);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> apiCreatePost(BuildContext context) async {
    String result;
    result = await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => CreatPage()));
    if (result != null) items.add(Network.parsePost(result));
    notifyListeners();
  }

  Future<void> apiUpdatePost(BuildContext context, Post post) async {
    String result;
    result = await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => UpdatePage(post: post,)));
    if (result != null) {
      Post newPost = Network.parsePost(result);
      items[items.indexWhere((element) => element.id == newPost.id)] = newPost;
    }
    notifyListeners();
  }

}
