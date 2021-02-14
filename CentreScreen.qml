import QtQuick 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: homescreen
    property int columnCount: 3
    property int maxRowOnSingleScreen: 2
    property real i_spacing: 100
    property int maxwidth: (width-(i_spacing*(columnCount-1)))/columnCount
    property int maxheight: (height-(i_spacing*(maxRowOnSingleScreen-1)))/maxRowOnSingleScreen
    property int item_width: (maxwidth > maxheight)?maxheight: maxwidth
    //Component.onCompleted: print("centre", "x:", x, "y:", y, "w:", width, "h:", height, "maxwidth:", maxwidth, "maxheight:", maxheight)

    GridLayout{
        anchors.fill: parent
        columns: columnCount
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        layoutDirection: Qt.LeftToRight
        flow: GridLayout.LeftToRight
        //        rowSpacing: i_spacing
        //        columnSpacing: i_spacing
        Repeater{
            model: ListModel {
                id: centre_screen_data
                ListElement { name: "Music"; appImagePath: "images/centre/Music.png"; appQmlPath: "Music.qml" }
                //                    ListElement { name: "Radio"; appImagePath: "images/centre/Radio.png"; appQmlPath: "Music.qml" }
                //                    ListElement { name: "Folder"; appImagePath: "images/centre/Folder.png"; appQmlPath: "Music.qml" }
                //                    ListElement { name: "Setting"; appImagePath: "images/centre/Setting.png"; appQmlPath: "Music.qml" }
                ListElement { name: "Video"; appImagePath: "images/centre/Video.png"; appQmlPath: "Video.qml" }
                //                    ListElement { name: "Bluetooth"; appImagePath: "images/centre/Bluetooth.png"; appQmlPath: "Music.qml" }
            }

            Cell{
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                imagePath: appImagePath
                qmlfilePath: appQmlPath
                Layout.maximumHeight: item_width
                Layout.maximumWidth: item_width
                //Component.onCompleted: print("cell in making:", item_width)
            }
        }
    }
}
