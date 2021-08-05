import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:reqres/resource/domain.dart';
import 'package:reqres/resource/repo.dart';

part 'page.g.dart';

@hwidget
Widget resourcesPage(BuildContext context) {
  final AsyncSnapshot<Resource?> resourceSnapshot =
      useFuture(_getResource(2), initialData: null, preserveState: true);
  return Scaffold(
    appBar: AppBar(
      title: Text('User'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Name:',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            '${_getResourceString(resourceSnapshot)}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    ),
  );
}

String _getResourceString(AsyncSnapshot<Resource?> snapshot) {
  if (snapshot.hasData) {
    if (snapshot.data != null) {
      return snapshot.data!.name;
    } else {
      return 'No resource loaded';
    }
  } else {
    return 'Loading';
  }
}

Future<Resource> _getResource(int id) async {
  final resource = await getResourceById(id);
  return resource;
}
