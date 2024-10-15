import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Controls 2.15
import "./Media/"
import "./AMFM/"

Window {
    id: window
    width: 1280
    height: 800
    visible: true
    title: qsTr("Media Player")

    property string currentApp: "Home"
    property int currentScreen: 0

    Image {
        id: bg
        source: "/Images/Music/BG.png"
    }

    Item {
        id: homepage
        visible: currentApp === "Home"

        Image {
            id: homescreenAppBG1
            visible: homepage.visible
            source: "/Images/Music/homescreen_app_background_default.svg"
            width: 224
            height: 158
            x: 207
            y: 147
        }
        Image {
            id: homescreenAppBG1Selected
            source: "/Images/Music/homescreen_app_background_selected.svg"
            width: 224
            height: 158
            x: 207
            y: 147
            visible: false
        }
        Image {
            id: radioHomeIcon
            visible: homepage.visible
            source: "/Images/Music/radio_homepage.svg"
            width: 96
            height: 137
            x: 271
            y: 157
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    currentApp = "Radio"
                    homescreenAppBG1Selected.visible = true;
                    homescreenAppBGSelected.visible = false;
                }
            }
        }

        Image {
            id: homescreenAppBG
            visible: homepage.visible
            source: "/Images/Music/homescreen_app_background_default.svg"
            width: 224
            height: 158
            x: 452
            y: 146
        }
        Image {
            id: homescreenAppBGSelected
            source: "/Images/Music/homescreen_app_background_selected.svg"
            width: 224
            height: 158
            x: 452
            y: 146
            visible: false
        }
        Image {
            id: mediaHomeIcon
            visible: homepage.visible
            source: "/Images/Music/media_homepage.svg"
            width: 96
            height: 137
            x: 516
            y: 156
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    currentApp = "Media"
                    homescreenAppBGSelected.visible = true;
                    homescreenAppBG1Selected.visible = false;
                }
            }
        }
    }

    Item {
        id: mainItem

        StartPage {
            visible: currentApp === "Radio"
        }

        SongPage {
            id: songPage
            visible: currentApp === "Media" && currentScreen !== 1
        }

        SongList {
            id: songList
            visible: currentScreen === 1
        }
    }

    Appbar { }
}
