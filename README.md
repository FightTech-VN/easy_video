## Easy Video


### Create new video
```
EasyVideoWidget(
    url: 'https://fighttech.vn/video/plist.m3u8',
    autoPlay: false
)
```


### Custom Detail Video Screen
- visit file: example/lib/detail_video_custom.dart

```
EasyVideoWidget(
    url: 'https://fighttech.vn/video/plist.m3u8',
    autoPlay: false,
    callbackTapShowDetail: (
        Widget player,
        String heroTag,
        Function()? onPlayWhenInit,
    ) async {
        await Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => DetailVideoCustom(
                    player: player,
                    heroTag: heroTag,
                    onInit: onPlayWhenInit,
                ),
            )
        );
    },
);
```