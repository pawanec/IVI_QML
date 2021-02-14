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
        Component.onCompleted: play()

        source: "files/sample1.mp3"
        onDurationChanged: {
            progressbar.to = duration/1000
            var min = ((Math.floor(duration/60000)) + ((duration%60000)/100000)).toFixed(2)
            totalTime.text = min
        }
        onPositionChanged: {
            progressbar.value = position/1000
            var min = ((Math.floor(position/60000)) + ((position%60000)/100000)).toFixed(2)
            elapsedTime.text = min
        }
        onError: {
            print("error: ",  errorString)
        }
        onPlaying: {
            print("play started")
            playback.source = "images/Music/Pause.png"
        }
        onPaused: {
            print("paused")
            playback.source = "images/Music/Play.png"
        }
        onStopped: {
            print("stopped")
            playback.source = "images/Music/Play.png"
        }
        onSourceChanged: {
            playMusic.play()
        }
    }

    RowLayout{
        height: musicPage.height
        width: musicPage.width
        Component.onCompleted: print("Music Row Layout", "x:", x, "y:", y, "w:", width, "h:", height)
        MediaList{
            id: musicList
            fileFilter: ["*.mp3"]
            Component.onCompleted: print("Media List", "x:", x, "y:", y, "w:", width, "h:", height)
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: parent.width/2

            onListSelected: {

                playMusic.source = newPath
                mediaTitle.text = newFileName
            }
        }

        ColumnLayout{
            id: controlView
            Component.onCompleted: print("Column Music", "x:", x, "y:", y, "w:", width, "h:", height)
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: parent.width/2
            //            Layout.margins: 100
            Layout.alignment: Qt.AlignHCenter
            Text{
                id: mediaTitle
                Layout.alignment: Qt.AlignHCenter
                text: "unknown"
                Layout.maximumWidth: controlView.width
                fontSizeMode: Text.Fit
                font.pointSize: 20
                color: "white"
            }


            Image {
                id: playback
                 Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter //| Qt.AlignBottom
                Component.onCompleted: print("Play music", "x:", x, "y:", y, "w:", width, "h:", height)
                fillMode: Image.PreserveAspectFit
                source: "images/Music/Play.png"
                Layout.maximumWidth: controlView.width/2
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

            RowLayout{
                Layout.preferredWidth: parent.width
                Component.onCompleted: print("Music status bar", "x:", x, "y:", y, "w:", width, "h:", height)
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter //| Qt.AlignBottom

                Text {
                    Component.onCompleted: print("Music elapsed", "x:", x, "y:", y, "w:", width, "h:", height)
                    id: elapsedTime
                    Layout.alignment: Qt.AlignHCenter
                    text: qsTr("00.00")
                    color: "white"
                }
                ProgressBar {
                    Component.onCompleted: print("Music progress bar", "x:", x, "y:", y, "w:", width, "h:", height)
                    id:progressbar
                    Layout.alignment: Qt.AlignHCenter
                    Layout.maximumWidth: parent.width/2
                    to: 0.0
                    from: 0.0
                    value: 0.0
                }

                Text {
                    Component.onCompleted: print("Music total time", "x:", x, "y:", y, "w:", width, "h:", height)
                    id: totalTime
                    Layout.alignment: Qt.AlignHCenter
                    text: qsTr("00.00")
                    color: "white"
                }
            }
        }
    }
}
