import 'package:reqres/data/api_client.dart';

import 'response.dart';

typedef GetResourceById = Future<ResourceResponse> Function(int id);
typedef GetResources = Future<List<ResourceResponse>> Function();

GetResourceById get apiGetResourceById => (id) => _getById(id);

GetResources get apiGetResources => _get;

Future<ResourceResponse> _getById(int id) {
  return apiGet('/api/unknown/${id.toString()}')
      .then((Map<String, dynamic> value) {
    if (value.isNotEmpty &&
        value.containsKey('data') &&
        value['data'] is Map<String, dynamic>) {
      return ResourceResponse.fromJson(value['data']);
    } else {
      throw FormatException('Unrecognized format');
    }
  });
}

Future<List<ResourceResponse>> _get() {
  return apiGet('/api/unknown').then((Map<String, dynamic> value) {
    if (value.isNotEmpty &&
        value.containsKey('data') &&
        value['data'] is List) {
      return (value['data'] as List<dynamic>)
          .map((e) => ResourceResponse.fromJson(e as Map<String, dynamic>))
          .toList(growable: false);
    } else {
      throw FormatException('Unrecognized format');
    }
  });
}
