import 'package:easy_video/easy_video.dart';
import 'package:flutter/material.dart';

import 'detail_video_custom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Video',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Easy Video Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int totalVideo = 20;

  Future<void> _onTapOpenCustomDetail(
    Widget player,
    String heroTag,
    Function()? onPlayWhenInit,
  ) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DetailVideoCustom(
        player: player,
        heroTag: heroTag,
        onInit: onPlayWhenInit,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final lengthListVideo = dummyListVideo.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final indexVideo =
              index - (index ~/ lengthListVideo * lengthListVideo);

          return EasyVideoWidget(
            url: dummyListVideo[indexVideo],
            autoPlay: false,
            callbackTapShowDetail: index == 1 ? _onTapOpenCustomDetail : null,
          );
        },
        separatorBuilder: (context, index) => Container(
          height: 15,
          color: Theme.of(context).primaryColor,
        ),
        itemCount: totalVideo,
      ),
    );
  }
}

const dummyListVideo = [
  'https://fighttech.vn/video/plist.m3u8',
  'https://fighttech.vn/video/tiktok.MP4',
  'https://sample-videos.com/video123/mp4/480/big_buck_bunny_480p_20mb.mp4',
  'https://fighttech.vn/video/tiktok_02.mp4',
  'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
];
