import 'package:flutter/material.dart';
import 'package:promilo_task_3_10/model/video_model.dart';

class VideoCard extends StatelessWidget {
  final Video video;
  final Function onTap;

  const VideoCard({super.key, required this.video, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Card(
        child: Row(
          children: [
            Image.network(
                video.snippet?.thumbnails?.thumbnailsDefault?.url ?? "",
                width: 120,
                height: 90,
                fit: BoxFit.cover),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(video.snippet?.title ?? "",
                      maxLines: 2, overflow: TextOverflow.ellipsis),
                  Text(video.snippet?.channelTitle ?? '',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
