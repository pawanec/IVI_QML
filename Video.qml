import QtQuick 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtMultimedia 5.15

Item {
    id: musicPage
    height: centreView.height
    width: centreView.width

    MediaPlayer {
        id: playMusic
        source: "files/Wildlife.wmv"

        onError: {
            print("error: ",  errorString)
        }
        onPlaying: {
            print("play started")
            playback.source = "images/Music/Pause.png"
            musicList.visible = false
            playback.visible = true
        }
        onPaused: {
            print("paused")
            playback.source = "images/Music/Play.png"
        }
        onStopped: {
            print("stopped")
            playback.source = "images/Music/Play.png"
            musicList.visible = true
            playback.visible = false
            source = ""
        }
        onSourceChanged: {
            playMusic.play()
        }
    }

    MediaList{
        id: musicList
        height: musicPage.height
        width: musicPage.width
        fileFilter: ["*.wmv", "*.mp4"]
        //Component.onCompleted: print("Media List", "x:", x, "y:", y, "w:", width, "h:", height)
        Layout.preferredHeight: parent.height
        Layout.preferredWidth: parent.width/2

        onListSelected: {
            playMusic.source = newPath
        }
    }


    VideoOutput {
        anchors.fill: parent
        Image {
            id: playback
            visible: false
            height: 100
            width: 100
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            //Component.onCompleted: print("Play music", "x:", x, "y:", y, "w:", width, "h:", height)
            fillMode: Image.PreserveAspectFit
            source: "images/Music/Play.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(playMusic.playbackState == MediaPlayer.PlayingState){
                        playMusic.pause()
                    }
                    else{
                        playMusic.play()
                    }

                    print("pause icon pressed")}
            }
        }
        source: playMusic
    }
}

