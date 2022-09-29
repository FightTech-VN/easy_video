import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'detail_video.dart';

typedef CallbackTapShowDetail = Future<void> Function(
    Widget player, String tag, Function() onPlayWhenInit);

class EasyVideoWidget extends StatefulWidget {
  final bool autoPlay;
  final bool looping;
  final String url;
  final bool isTapOpenDetailScreen;

  final CallbackTapShowDetail? callbackTapShowDetail;

  const EasyVideoWidget({
    super.key,
    required this.url,
    this.autoPlay = true,
    this.looping = true,
    this.callbackTapShowDetail,
    this.isTapOpenDetailScreen = true,
  });

  @override
  State<EasyVideoWidget> createState() => _EasyVideoWidgetState();
}

class _EasyVideoWidgetState extends State<EasyVideoWidget> {
  late FlickManager _flickManager;
  late FlickVideoPlayer _player;
  late String _heroTag;
  bool _isOpenDetail = false;

  /// Detect Visibility to pause/play video
  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction < 0.2 && _isOpenDetail == false) {
      if (_flickManager.flickVideoManager?.isPlaying ?? false) {
        _flickManager.flickControlManager?.pause();
      }
    } else if (info.visibleFraction == 1) {
      /// Play when [visibleFraction] is 1 and video init done and [autoPlay] is true
      if (_flickManager.flickVideoManager?.isBuffering == false &&
          widget.autoPlay) {
        _flickManager.flickControlManager?.play();
      }
    }
  }

  /// Active when back from Detail screen
  void _onActiveWhenBackFromDetail() {
    _isOpenDetail = false;

    /// Pause video when back from detail screen
    if (_flickManager.flickVideoManager?.isPlaying ?? false) {
      _flickManager.flickControlManager?.pause();
    }
  }

  /// Play video when detail screen init done
  void _onActiveWhenInitDetailVideoIsDone() {
    _flickManager.flickControlManager?.play();
  }

  /// Action on tap to player avaliable when [isTapOpenDetailScreen] is true
  void _onTapVideo() {
    _isOpenDetail = true;

    /// Custom Detail screen
    if (widget.callbackTapShowDetail != null) {
      widget.callbackTapShowDetail!(
        _player,
        _heroTag,
        _onActiveWhenInitDetailVideoIsDone,
      )
          .then(
        (value) => _onActiveWhenBackFromDetail(),
      );
    } else {
      /// Use Detail Screen default
      Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (context) => DetailVideo(
              heroTag: _heroTag,
              player: _player,
              onInit: _onActiveWhenInitDetailVideoIsDone,
            ),
          ))
          .then(
            (_) => _onActiveWhenBackFromDetail(),
          );
    }
  }

  @override
  void initState() {
    super.initState();
    _heroTag = '${UniqueKey()}playerHerro${widget.url}';
    _flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(widget.url),
      autoPlay: widget.autoPlay,
    );
    _player = FlickVideoPlayer(flickManager: _flickManager);
  }

  @override
  void dispose() {
    _flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey('VisibilityDetector$_heroTag'),
      onVisibilityChanged: _onVisibilityChanged,
      child: InkWell(
        onTap: widget.isTapOpenDetailScreen ? _onTapVideo : null,
        child: IgnorePointer(
          ignoring: widget.isTapOpenDetailScreen,
          child: Hero(
            tag: _heroTag,
            child: _player,
          ),
        ),
      ),
    );
  }
}
