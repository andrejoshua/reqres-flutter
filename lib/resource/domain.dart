import 'package:flutter/cupertino.dart';

@immutable
class Resource {
  Resource(this.id, this.name);

  final int id;
  final String name;
}
