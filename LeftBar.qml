import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
Rectangle{
    id: leftBar
    Component.onCompleted: print("leftbar", "x:", x, "y:", y, "w:", width, "h:", height)

    gradient: Gradient {
        orientation: Gradient.Horizontal
        GradientStop { position: 0.0; color: "Red" }
        GradientStop { position: 1.0; color: "Green" }
    }

    ColumnLayout{
        anchors.fill: leftBar
        anchors.bottom: leftBar.bottom

        Image {
            id: home
            Layout.alignment: Qt.AlignCenter
            Layout.maximumHeight: leftBar.width
            Layout.maximumWidth: leftBar.width
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
