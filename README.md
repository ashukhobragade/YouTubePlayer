# YouTubePlayer

Embed and control YouTube videos in your iOS applications! Neato, right? Let's see how it works.

**1.0.0 **

## Installation

### Cocoapods

Ensure you are opting into using frameworks with `use_frameworks!`. Then add the following to your Podfile:

```
pod 'YouTubePlayer'
```

…and then run `pod install`.


## Example

```Swift
// Import Swift module
import YouTubePlayer
```

Build and lay out the view however you wish, whether in IB w/ an outlet or programmatically.
```Swift
@IBOutlet var videoPlayer: YouTubePlayerView!
```
```Swift
// init YouTubePlayerView w/ playerFrame rect (assume playerFrame declared)
var videoPlayer = YouTubePlayerView(frame: playerFrame)
```

Give the player a video to load, whether from ID or URL.
```Swift
// Load video from YouTube ID
videoPlayer.loadVideoID("nfWlot6h_JM")
```
```Swift
// Load video from YouTube URL
let myVideoURL = NSURL(string: "https://www.youtube.com/watch?v=wQg3bXrVLtg")
videoPlayer.loadVideoURL(myVideoURL!)
```

## Controlling YouTubePlayerView

Each `YouTubePlayerView` has methods for controlling the player (play, pause, seek, change video, etc.) They are:

* `func loadVideoURL(videoURL: NSURL)`
* `func loadVideoID(videoID: String)`
* `func loadPlaylistID(playlistID: String)`
* `func play()`
* `func pause()`
* `func stop()`
* `func clear()`
* `func seekTo(seconds: Float, seekAhead: Bool)`
* `func previousVideo()`
* `func nextVideo()`
* `func getCurrentTime(completion: ((Double?) -> Void)?)`
* `func getDuration(completion: ((Double?) -> Void)?))`

Please note that calls to all but the first two methods will result in a JavaScript runtime error if they are called before the player is ready. The player will not be ready until shortly after a call to either `loadVideoURL(videoURL: NSURL)` or `loadVideoID(videoID: String)`. You can check the readiness of the player at any time by checking its `ready: Bool` property. These functions run asynchronously, so it is not guaranteed that a call to a play function will be safe if it immediately follows a call to a load function. I plan to update the library soon to add completion handlers to be called when the player is ready.

In the meantime, you can also the `YouTubePlayerDelegate` method `playerReady(videoPlayer: YouTubePlayerView)` to ensure code is executed immediately when the player becomes ready.

## Responding to events

[YouTube's iFrame player](https://developers.google.com/youtube/iframe_api_reference) emits certain events based on the lifecycle of the player. The `YouTubePlayerDelegate` outlines these methods that get called during a player's lifecycle. They are:

* `func playerReady(videoPlayer: YouTubePlayerView)`
* `func playerStateChanged(videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState)`
* `func playerQualityChanged(videoPlayer: YouTubePlayerView, playbackQuality: YouTubePlaybackQuality)`

*Side note:* All these delegate methods are optional which means that you can implement none, all, or some of them in your delegate class.

