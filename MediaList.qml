import QtQuick 2.0
import Qt.labs.folderlistmodel 2.15
import QtQuick.Layouts 1.15

ListView {
    id: listviewMedia

    property var fileFilter;
    signal listSelected(string newPath, string newFileName)

    focus: true
    highlight: Rectangle { width:listviewMedia.width
        height: listviewMedia/10
        color: "lightsteelblue"; radius: 5 }

    Component.onCompleted: {
        listSelected(folderScannerModel.get(0, "filePath"), folderScannerModel.get(0, "fileBaseName"))
    }

    FolderListModel {
        id: folderScannerModel
        folder: "file:/D:/Qt/workspace/iMax_IVI/files"
        nameFilters: fileFilter
    }

    Component{
        id: folderDelegate
        Rectangle{
            id: listItem
            border.color: "white"
            width: listviewMedia.width;
            height: listviewMedia.height/10
            RowLayout{
                anchors.fill: parent
                spacing: 5
                Image {
                    id: thumb
                    source: "images/Music/List.png"
                    Layout.preferredHeight: listItem.height
                    Layout.preferredWidth: listItem.height
                }
                Text{
                    horizontalAlignment: Text.AlignHCenter
                    Layout.preferredWidth: listviewMedia.width-listItem.height-5
                    Layout.preferredHeight: (listItem.height*8)/10
                    text: model.fileBaseName
//                    fontSizeMode: Text.Fit
                    font.pointSize: (listItem.height*8)/30
                    color: "white"
                    clip: true
                }
            }
            gradient: Gradient {
                GradientStop { position: 0.0; color: "black" }
                GradientStop { position: 0.5; color: "grey" }
                GradientStop { position: 1.0; color: "black" }
            }
            MouseArea{
                id: mediaListArea
                anchors.fill: parent
                onClicked:
                {
                    listviewMedia.currentIndex = index
                    listSelected(model.filePath, model.fileBaseName)
                }
            }
        }
    }

    model: folderScannerModel

    delegate: folderDelegate
}
