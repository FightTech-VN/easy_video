import 'package:flutter/material.dart';

class DetailVideoCustom extends StatefulWidget {
  final Widget player;
  final String heroTag;
  final Function()? onInit;

  const DetailVideoCustom({
    super.key,
    required this.player,
    required this.heroTag,
    this.onInit,
  });

  @override
  State<DetailVideoCustom> createState() => DetailVideoCustomState();
}

class DetailVideoCustomState extends State<DetailVideoCustom> {
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
      appBar: AppBar(
        title: const Text('Detail Video Custom'),
      ),
      body: Stack(
        children: [
          Hero(
            tag: widget.heroTag,
            child: widget.player,
          ),
        ],
      ),
    );
  }
}
