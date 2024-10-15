import QtQuick 2.15

Item {
    Image {
        id:appbar_bg
        source: "/Images/Common/appbar_bg.svg"
        width: 128
        height: 552
        y:87
    }
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
    Image {
        id:appdrawerIcon
        source: "/Images/Common/p_icon_48X48_app_drawer.svg"
        width: 48
        height: 48
        x:40
        y:233
    }
    Image {
        id:androiAutoIcon
        source: "/Images/Common/p_icon_48X48_androidauto.svg"
        width: 48
        height: 48
        x:40
        y:339
    }
    Image {
        id:bluetoothIcon
        source: "/Images/Common/p_icon_48X48_bluetooth.svg"
        width: 48
        height: 48
        x:40
        y:445
    }
    Image {
        id:vehicleIcon
        source: "/Images/Common/p_icon_48X48_vehicle.svg"
        width: 48
        height: 48
        x:40
        y:551
    }
    Image {
        id:micBG
        source: "/Images/Common/background_128X128.svg"
        width: 128
        height: 128
        y:672
    }
    Image {
        id:micIcon
        source: "/Images/Common/p_icon_48X48_mic.svg"
        width: 48
        height: 48
        x:40
        y:712
    }
    Text {
        id: timeText
        text: "12:59 AM"
        font.pixelSize: 36
        color: "white"
        x: 14
        y: 14
    }
    Image {
        id: usbIcon
        source: "/Images/Music/p_icon_48X48_usb.svg"
        width: 48
        height: 48
        x: 182
        y: 16
        visible: true
    }
}
