import 'package:get/get.dart';
import 'package:reqres/resource/domain.dart';
import 'package:reqres/resource/repo.dart';

class ResourceDetailViewModel extends GetxController {
  late final int id;

  Rxn<Resource> _resourceObx = Rxn<Resource>(null);

  String? get name => _resourceObx.value?.name;

  @override
  void onInit() {
    super.onInit();
    id = (Get.arguments) as int;
    initData();
  }

  Future<void> initData() async {
    final result = await getResourceById(id);
    _resourceObx.value = result;
    update();
  }

  @override
  void onClose() {
    _resourceObx.value = null;
    super.onClose();
  }
}
