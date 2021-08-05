import 'package:get/get.dart';
import 'package:reqres/resource/repo.dart';

class ResourcesViewModel extends GetxController {
  RxList _resourcesObx = List.empty(growable: true).obs;

  List get resources => [..._resourcesObx];

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  Future<void> initData() async {
    final result = await getResources();
    _resourcesObx.clear();
    _resourcesObx.addAll(result);

    update();
  }

  @override
  void onClose() {
    _resourcesObx.clear();
    super.onClose();
  }
}
