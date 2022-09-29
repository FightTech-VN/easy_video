## Easy Video



![Detail-Video](https://user-images.githubusercontent.com/19247680/192939275-5502ecc6-4d03-4e2f-be6f-4db4fa10ff9e.png)
![List-Video](https://user-images.githubusercontent.com/19247680/192939294-5c0acf0c-8e8f-4582-a08a-2c84c3e81523.png)

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
