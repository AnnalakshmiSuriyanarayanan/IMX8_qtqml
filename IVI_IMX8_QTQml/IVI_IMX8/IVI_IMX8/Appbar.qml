import QtQuick 2.15

Item {
    // opacity: (isvkey)?0.2:1
    Image {
        id:appbar_bg
        source: "/Images/Common/appbar_bg.svg"
        width: 128
        height: 552
        y:87
    }
    // Image 2
    Image {
        id:homeIcon
        source: "/Images/Common/p_icon_48X48_home.svg"
        width: 48
        height: 48
        x:40
        y:127
        MouseArea{
            anchors.fill: parent
            onClicked: currentApp = "Home"
        }
    }
    // Image 3
    Image {
        id:appdrawerIcon
        source: "/Images/Common/p_icon_48X48_app_drawer.svg"
        width: 48
        height: 48
        x:40
        y:233
    }
    // Image 4
    Image {
        id:androiAutoIcon
        source: "/Images/Common/p_icon_48X48_androidauto.svg"
        width: 48
        height: 48
        x:40
        y:339
    }
    // Image 5
    Image {
        id:bluetoothIcon
        source: "/Images/Common/p_icon_48X48_bluetooth.svg"
        width: 48
        height: 48
        x:40
        y:445
    }
    // Image 6
    Image {
        id:vehicleIcon
        source: "/Images/Common/p_icon_48X48_vehicle.svg"
        width: 48
        height: 48
        x:40
        y:551
    }
    // Image 7
    Image {
        id:micBG
        source: "/Images/Common/background_128X128.svg"
        width: 128
        height: 128
        y:672
    }
    // Image 8
    Image {
        id:micIcon
        source: "/Images/Common/p_icon_48X48_mic.svg"
        width: 48
        height: 48
        x:40
        y:712
    }
}
