import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:muzic/features/resources/repositories/song_list_info.dart';

class PlayerRepository {
  static const String _baseUrl = 'http://192.168.8.224:8000';

  Future<StreamInfo> getStreamUrl(String publicId) async {
    final response = await http.get(Uri.parse('$_baseUrl/stream/$publicId'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return StreamInfo.fromJson(json);
    } else {
      throw Exception('Failed to load stream URL: ${response.statusCode}');
    }
  }
}
