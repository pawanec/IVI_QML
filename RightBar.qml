import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
Rectangle {
    id: rightBar
    gradient: Gradient {
        orientation: Gradient.Horizontal
        GradientStop { position: 0.0; color: "black" }
        GradientStop { position: 1.0; color: "grey" }
    }

    property int itemwidth: rightBar.width-25

    //Component.onCompleted: print("rightbar" ,"x:", x, "y:", y, "w:", width, "h:", height)
    ColumnLayout{
        anchors.fill: parent
        Image {
            id: volup
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumHeight: itemwidth
            Layout.maximumWidth: itemwidth
            fillMode: Image.PreserveAspectFit
            source: "images/right/vol_up.png"
        }
        Image {
            id: mute
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumHeight: itemwidth
            Layout.maximumWidth: itemwidth
            fillMode: Image.PreserveAspectFit
            source: "images/right/mute.png"
        }

        Image {
            id: voldown
            Layout.alignment: Qt.AlignHCenter
            Layout.maximumHeight: itemwidth
            Layout.maximumWidth: itemwidth
            fillMode: Image.PreserveAspectFit
            source: "images/right/vol_down.png"
        }

        Image {
            id: home
            Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
            Layout.maximumHeight: itemwidth
            Layout.maximumWidth: itemwidth
            fillMode: Image.PreserveAspectFit
            source: "images/left/home.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    centreView.pop()
                    print("home icon pressed")
                }
            }
        }

    }
}
