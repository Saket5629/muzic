import 'album_info.dart';

class SongsListInfo {
  const SongsListInfo({required this.albums});

  // Empty state — used as initial value before API responds
  const SongsListInfo.empty() : albums = const [];

  final List<AlbumModel> albums;

  factory SongsListInfo.fromJson(Map<String, dynamic> json) {
    return SongsListInfo(albums: (json['library'] as List).map((a) => AlbumModel.fromJson(a as Map<String, dynamic>)).toList());
  }
}

class StreamInfo {
  const StreamInfo({required this.streamUrl});

  final String streamUrl;

  factory StreamInfo.fromJson(Map<String, dynamic> json) {
    return StreamInfo(streamUrl: json['stream_url'] as String);
  }
}
