// songs_list_repository.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:muzic/features/resources/repositories/song_list_info.dart';

class SongsListRepository {
  // Change this to your machine's IP if running on a physical device
  // localhost won't work on a real phone — use your local IP e.g. 192.168.x.x
  static const String _baseUrl = 'http://192.168.8.224:8000';

  Future<SongsListInfo> fetchLibrary() async {
    final response = await http.get(Uri.parse('$_baseUrl/library'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return SongsListInfo.fromJson(json);
    } else {
      throw Exception('Failed to load library: ${response.statusCode}');
    }
  }
}