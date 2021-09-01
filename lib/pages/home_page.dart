import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_dio/view_models/home_view.dart';
import 'package:provider_dio/views/item_list.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Patterns"),
      ),
      body: ChangeNotifierProvider (
        create: (context) => viewModel,
        child: Consumer <HomeViewModel> (
          builder: (context, model, widget) => Stack(
            children: [
              ListView.builder(
                itemCount: viewModel.items.length,
                itemBuilder: (context, index){
                  return itemList ( context, viewModel, viewModel.items[index]);
                },
              ),
              viewModel.isLoading ? Center (
                child: CircularProgressIndicator(),
              ) : SizedBox.shrink(),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            viewModel.apiCreatePost(context);
          }
      ),

    );
  }



}