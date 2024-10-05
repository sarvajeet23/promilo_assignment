import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'components/video_card.dart';
import '../../controller/video_controller.dart';

class HomePage extends StatelessWidget {
  final VideoController _controller = Get.put(VideoController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube fetchVideos'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: GetBuilder<VideoController>(
        init: _controller,
        builder: (_) {
          if (_controller.videoList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              if (_controller.selectedVideo != null)
                Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: YoutubePlayer(
                        key: UniqueKey(),
                        controller: YoutubePlayerController(
                          initialVideoId:
                              _controller.selectedVideo!.id?.videoId ?? "",
                          flags: const YoutubePlayerFlags(
                            autoPlay: true,
                            controlsVisibleAtStart: true,
                            useHybridComposition: false,
                            loop: true,
                          ),
                        ),
                        onEnded: (metaData) => _controller.playNextVideo(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('Suggestions',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: _controller.videoList.length,
                  itemBuilder: (context, index) {
                    final video = _controller.videoList[index];
                    return VideoCard(
                      video: video,
                      onTap: () => _controller.selectVideo(video),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
