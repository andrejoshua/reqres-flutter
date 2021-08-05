import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'page.g.dart';

@hwidget
Widget counterPage(BuildContext context) {
  final ValueNotifier<int> counter = useState<int>(0);
  return Scaffold(
    appBar: AppBar(
      title: Text('Resources'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have pushed the button this many times:',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            '${counter.value}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      tooltip: 'Increment',
      child: Icon(Icons.add),
      onPressed: () {
        counter.value += 1;
      },
    ),
  );
}


