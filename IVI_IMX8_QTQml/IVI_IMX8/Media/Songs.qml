import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    id: songs_page
    property string hello: "Song"
    property int selectedSongIndex: -1
    property string selectedSongName: ""
    property bool favRemoveVisible: false
    property int undoIndex: -1

    ListModel {
        id: separateModel
    }
    Component.onCompleted: {
        for (var i = 1; i < 10; i++) {
            separateModel.append({
                                     "stnName" : hello + i,
                                     "song_icon": "/Images/Music/s_icon_64X64_songs_list.svg",
                                     "favaddimage": "/Images/Music/p_icon_48X48_fav_add_clicked.svg",
                                     "song_selected_bg": "/Images/Music/song_selected_bg.svg",
                                     "imageVisible": false
                                 })
        }
    }

    ListView {
        id: favoriteView
        width: 658
        height: 496
        model: separateModel
        clip: true
        spacing: 5
        x: 603
        y: 228

        delegate: Item {
            width: ListView.view.width
            height: 80

            Image {
                id: songBg
                source: model.song_selected_bg
                width: 646
                height: 80
                visible: model.imageVisible
            }
            Text {
                text: model.stnName
                font.pixelSize: 32
                color: "white"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: songIcon.right
                anchors.leftMargin: 150
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        currentScreen = 2
                        if (selectedSongIndex !== -1) {
                            separateModel.setProperty(selectedSongIndex, "imageVisible", false)
                        }
                        selectedSongIndex = index
                        separateModel.setProperty(index, "imageVisible", true)
                    }
                }
            }
            Image {
                id: songIcon
                source: model.song_icon
                width: 48
                height: 48
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        currentScreen = 2
                        if (selectedSongIndex !== -1) {
                            separateModel.setProperty(selectedSongIndex, "imageVisible", false)
                        }
                        selectedSongIndex = index
                        separateModel.setProperty(index, "imageVisible", true)
                    }
                }
            }
            Image {
                id: favAddImage
                source: model.favaddimage
                width: 48
                height: 48
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 550
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (model.favaddimage === "/Images/Music/p_icon_48X48_fav_add.svg") {
                            separateModel.setProperty(index, "favaddimage", "/Images/Music/p_icon_48X48_fav_add_clicked.svg");
                            favRemoveVisible = false;
                            undoIndex = -1;
                            hideRemovedFromFavTimer.stop();
                        } else if (model.favaddimage === "/Images/Music/p_icon_48X48_fav_add_clicked.svg") {
                            separateModel.setProperty(index, "favaddimage", "/Images/Music/p_icon_48X48_fav_added_select.svg");
                            favRemoveVisible = false;
                            undoIndex = index;
                            hideRemovedFromFavTimer.stop();
                        } else if (model.favaddimage === "/Images/Music/p_icon_48X48_fav_added_select.svg") {
                            separateModel.setProperty(index, "favaddimage", "/Images/Music/p_icon_48X48_fav_add_clicked.svg");
                            favRemoveVisible = true;
                            undoIndex = -1;
                            hideRemovedFromFavTimer.restart();
                        }
                    }
                }
            }
        }
        function syncScrollerToView() {
            var contentRatio = (contentHeight - height) / 164;
            var scrollerY = (contentY / contentRatio) + 228;
            scroller.y = scrollerY;
        }
        onContentYChanged: {
            syncScrollerToView();
        }
    }
    Timer {
        id: hideRemovedFromFavTimer
        interval: 3000
        running: false
        onTriggered: {
            favRemoveVisible = false;
        }
    }

    Image {
        id: favRemove
        source: "/Images/Music/removed_from_fav.svg"
        width: 629
        height: 48
        x: 396
        y: 15
        visible: favRemoveVisible
    }

    Text {
        id: undo
        text: "Undo"
        font.pixelSize: 25
        color: Qt.rgba(34 / 255, 114 / 255, 167 / 255, 1)
        x: 946
        y: 22
        visible: favRemoveVisible
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (undoIndex !== -1) {
                    separateModel.setProperty(undoIndex, "favaddimage", "/Images/Music/p_icon_48X48_fav_added_select.svg");
                    undoIndex = -1;
                    favRemoveVisible = false;
                    hideRemovedFromFavTimer.restart();
                }
            }
        }
    }
    Image {
        id: scroller
        source: "/Images/Music/scroller_1.svg"
        width: 17
        height: 164
        x: 1263
        y: 228

        MouseArea {
            id: trackerMouseArea
            anchors.fill: parent
            onClicked: {
                var clickPositionY = (mouseY - (scroller.height / 2)) - 228;
                var normalizedPosition = clickPositionY / (164 - parent.height);
                favoriteView.contentY = normalizedPosition * (favoriteView.contentHeight - favoriteView.height);
            }
        }
    }
}
