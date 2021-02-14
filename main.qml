import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.12
/*
* 0. 1920*1080
* 1. Home Screen (7 app Icons, Volume control SLider, Mute Button)
* 2. Video Player SCreen (Play/Pause/Exit from USB Pend drive)
* 3. Audio Player Screen (Play/Pause/Exit from USB pen drive)
* 4. Camera Viewer Screen (USB camera with V4L2 support)
* 5. Setting Screen (for brightness)
* 6. File Browser Screen (for USB pendrive)
* 7. BT Screen (Scan/Connect/A2DP/HSP)
* 8. Radio
* 9. Footer -> Mute/Unmute, V+ and V-
* 10. GOTO Home screen ICON/ Current Screen Icon
*/
ApplicationWindow {
    id: window
    Material.theme: Material.Dark
    width: 1920/2
    height: 1080/2
    visible: true
    title: qsTr("Stack")
//    flags: Qt.FramelessWindowHint

    Rectangle {
        id: base
        //Component.onCompleted: print("main window", "x:", x, "y:", y, "w:", width, "h:", height)
        width: window.width
        height: window.height
        //        source: "images/base.png"

        gradient: Gradient {
            GradientStop { position: 0.0; color: "grey" }
            GradientStop { position: 0.5; color: "black" }
            GradientStop { position: 1.0; color: "grey" }
        }

        RowLayout{

            id: mainLayout
            width: window.width
            height: window.height

            StackView{
                id: centreView
                property Item lastItem: null
                Component.onCompleted: {
                    print("stackview", "x:", centreView.x, "y:", centreView.y, "w:", width, "h:", height)
                }
                height: mainLayout.height
                width: (9*mainLayout.width)/10
                initialItem: CentreScreen{
                    height: centreView.height
                    width: centreView.width
                }
                onCurrentItemChanged: {
                    if(lastItem){
                        print("onInitialItemChanged last item:", lastItem);
                        print("onInitialItemChanged: ", currentItem.toString())
                    }
                    else{
                        lastItem = currentItem;
                        print("onInitialItemChanged: ", currentItem.toString())
                    }
                }
            }
            RightBar{
                height: mainLayout.height
                width: mainLayout.width/10
            }
        }
    }
}
