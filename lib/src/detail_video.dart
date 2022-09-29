import 'package:flutter/material.dart';

class DetailVideo extends StatefulWidget {
  final Widget player;
  final String heroTag;
  final Function()? onInit;

  const DetailVideo({
    super.key,
    required this.player,
    required this.heroTag,
    this.onInit,
  });

  @override
  State<DetailVideo> createState() => DetailVideoState();
}

class DetailVideoState extends State<DetailVideo> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.onInit?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Hero(
                  tag: widget.heroTag,
                  child: widget.player,
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 16,
            child: SafeArea(
              child: IconButton(
                onPressed: Navigator.of(context).pop,
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
