import QtQuick 2.0

Image {
    id: appCell
    property string imagePath
    property string qmlfilePath
    //    Component.onCompleted: print("image_cell", "x:", x, "y:", y, "w:", width, "h:", height)
    source: imagePath
    fillMode: Image.PreserveAspectFit

    MouseArea {
        anchors.fill: parent
        onClicked: {
            centreView.push(qmlfilePath)
            print("app icon pressed")
        }

    }
}
