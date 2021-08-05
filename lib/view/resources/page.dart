import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres/resource/domain.dart';
import 'package:reqres/view/resource_detail/page.dart';
import 'package:reqres/view/resources/vm.dart';

class ResourcesPage extends GetView<ResourcesViewModel> {
  @override
  Widget build(BuildContext context) {
    Get.put(ResourcesViewModel());
    return Scaffold(
      appBar: AppBar(
        title: Text('List Resource'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemBuilder: (context, index) {
            final resource = controller.resources[index];
            return _itemView(resource);
          },
          itemCount: controller.resources.length,
        );
      }),
    );
  }

  Widget _itemView(Resource resource) {
    return InkWell(
      child: Text(
        '${resource.name}',
      ),
      onTap: () {
        Get.to(() => ResourceDetailPage(), arguments: resource.id);
      },
    );
  }
}
