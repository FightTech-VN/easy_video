## Easy Video


## Demo


https://user-images.githubusercontent.com/13028582/192937506-27d71ac8-4560-4b2e-9cd6-62e55ab6102e.mp4

## Usage

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
