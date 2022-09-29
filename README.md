## Easy Video


## Demo

https://user-images.githubusercontent.com/13028582/192937364-88527bbe-9f22-4e23-ac2b-179129382c99.mp4

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
