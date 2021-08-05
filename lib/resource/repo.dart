import 'api.dart';
import 'domain.dart';
import 'response.dart';

Future<Resource> getResourceById(int id) => apiGetResourceById(id)
    .then((ResourceResponse value) => Resource(value.id, value.name));

Future<List<Resource>> getResources() =>
    apiGetResources().then((List<ResourceResponse> value) => value
        .map(
            (ResourceResponse response) => Resource(response.id, response.name))
        .toList(growable: false));
