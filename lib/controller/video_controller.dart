import 'package:get/get.dart';
import 'package:promilo_task_3_10/model/video_model.dart';
import '../client/video_service.dart';

class VideoController extends GetxController {
  final VideoService _videoService = VideoService();
  List<Video> videoList = [];
  Video? selectedVideo;

  @override
  void onInit() {
    super.onInit();
    fetchVideoList();
  }

  Future<void> fetchVideoList() async {
    try {
      final videos = await _videoService.fetchVideos();
      videoList = videos;
      update();
    } catch (e) {
      print('Failed to fetch videos: $e');
    }
  }

  void selectVideo(Video video) {
    selectedVideo = video;
    update();
  }

  void playNextVideo() {
    final currentIndex = videoList.indexOf(selectedVideo!);
    if (currentIndex < videoList.length - 1) {
      selectedVideo = videoList[currentIndex + 1];
      update();
    }
  }
}
