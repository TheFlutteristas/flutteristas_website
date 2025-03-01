import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web/web.dart';

typedef FromJson<T> = T Function(dynamic json);

class DataFetcher {
  DataFetcher({required this.projectId});

  final String projectId;

  // see: https://firebase.google.com/docs/reference/rest/database
  Future<T> fetchData<T>(
    String dataPath, {
    required FromJson<T> fromJson,
    bool shallow = false,
  }) async {
    final url = Uri.https(
      '$projectId.firebaseio.com',
      '$dataPath.json',
      shallow ? {'shallow': 'true'} : null,
    );
    print('fetching data for $url');
    final resp = await http.get(url);
    final data = (resp.statusCode == HttpStatus.ok) //
        ? json.decode(resp.body)
        : null;
    return fromJson(data);
  }
}
