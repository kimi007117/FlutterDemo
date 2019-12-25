import 'package:flutter/material.dart';
import 'package:flutter_app/entity/demo_info.dart';
import 'package:flutter_app/model/demo_view_model.dart';

class DemoProvider with ChangeNotifier {
  List<InfoItem> list;

  DemoViewModel viewModel;

  DemoProvider({this.viewModel});

  Future<dynamic> loadData() async {
    list = await viewModel.getData();
    notifyListeners();
  }
}
