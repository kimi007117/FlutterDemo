import 'package:flutter_app/entity/demo_info.dart';

class DemoViewModel {
  Future<List<InfoItem>> getData() async {
    List<InfoItem> list;

    try {
      list = await _loadData();
    } catch (e) {}

    return list;
  }

  Future<dynamic> _loadData() async {
    List<InfoItem> list = List<InfoItem>();
    InfoItem infoItem;

    infoItem = InfoItem();
    infoItem.id = 1;
    infoItem.name = '测试';
    list.add(infoItem);

    infoItem = InfoItem();
    infoItem.id = 1;
    infoItem.name = '测试';
    list.add(infoItem);

    infoItem = InfoItem();
    infoItem.id = 1;
    infoItem.name = '测试';
    list.add(infoItem);

    infoItem = InfoItem();
    infoItem.id = 1;
    infoItem.name = '测试';
    list.add(infoItem);

    infoItem = InfoItem();
    infoItem.id = 1;
    infoItem.name = '测试';
    list.add(infoItem);

    infoItem = InfoItem();
    infoItem.id = 1;
    infoItem.name = '测试';
    list.add(infoItem);

    infoItem = InfoItem();
    infoItem.id = 1;
    infoItem.name = '测试';
    list.add(infoItem);
    return list;
  }
}
