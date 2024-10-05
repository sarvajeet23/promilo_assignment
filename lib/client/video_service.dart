import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:promilo_task_3_10/model/video_model.dart';

class VideoService {
  final String apiKey = 'AIzaSyCb1kKXD14dsV5_jbF0olEUC2fk92FcxcA';

  Future<List<Video>> fetchVideos() async {
    final String url = 'https://www.googleapis.com/youtube/v3/search?'
        'part=snippet&type=video&maxResults=10&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Video> videos = (data['items'] as List)
          .map((videoJson) => Video.fromJson(videoJson))
          .toList();
      return videos;
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
