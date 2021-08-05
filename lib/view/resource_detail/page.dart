import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres/view/resource_detail/vm.dart';

class ResourceDetailPage extends GetView<ResourceDetailViewModel> {
  @override
  Widget build(BuildContext context) {
    Get.put(ResourceDetailViewModel());

    final int id = (Get.arguments) as int;
    return Scaffold(
      appBar: AppBar(
        title: Text('Resource detail #${id.toString()}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name:',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Obx(() {
              return Text(
                '${controller.name}',
                style: Theme.of(context).textTheme.bodyText1,
              );
            }),
          ],
        ),
      ),
    );
  }
}
