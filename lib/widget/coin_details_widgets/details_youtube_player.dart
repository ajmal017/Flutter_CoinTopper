import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailsYoutubePlayer extends StatefulWidget {
  final youtube;
  DetailsYoutubePlayer(this.youtube);
  @override
  _DetailsYoutubePlayerState createState() => _DetailsYoutubePlayerState();
}

class _DetailsYoutubePlayerState extends State<DetailsYoutubePlayer> {
  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: widget.youtube,
      flags: YoutubePlayerFlags(
        enableCaption: true,
        autoPlay: false,
      ),
    ); 

    return widget.youtube.length != 0
        ? YoutubePlayer(
            controller: _controller,
            onReady: () {
              _controller.play();
            },
            showVideoProgressIndicator: true,
            topActions: <Widget>[
              SizedBox(width: 0.0),
              Expanded(
                child: Text(
                  _controller.metadata.title,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 25.0,
                ),
                onPressed: () {},
              ),
            ],
          )
        : Container();
  }
}
