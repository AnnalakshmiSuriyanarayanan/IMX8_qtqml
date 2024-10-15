import QtQuick 2.12
import QtQuick.Controls 2.15

Item {
    property int columnX: 159
    property int columnY: 185
    property bool showSeparateModel: false

    ListModel {
        id: listModel

        ListElement { name: "album"; clicked: false; bgVisible: false; imagePath: "qrc:/Images/Music/s_icon_64X64_album.svg"; text: "Album"; image: "/Images/Music/list_divider.svg"; dividerVisible: true }
        ListElement { name: "playlist"; clicked: false; bgVisible: false; imagePath: "qrc:/Images/Music/s_icon_64X64_playlist.svg"; text: "Playlist"; image: "/Images/Music/list_divider.svg"; dividerVisible: true }
        ListElement { name: "artist_list"; clicked: false; bgVisible: false; imagePath: "qrc:/Images/Music/s_icon_64X64_artist.svg"; text: "Artist"; image: "/Images/Music/list_divider.svg"; dividerVisible: true }
        ListElement { name: "songsList"; clicked: false; bgVisible: false; imagePath: "qrc:/Images/Music/s_icon_64X64_songs_list.svg"; text: "Songs"; image: "/Images/Music/list_divider.svg"; dividerVisible: true }
        ListElement { name: "folder"; clicked: false; bgVisible: false; imagePath: "qrc:/Images/Music/s_icon_64X64_folder.svg"; text: "Folder"; image: "/Images/Music/list_divider.svg"; dividerVisible: true }
        ListElement { name: "favorite_list"; clicked: false; bgVisible: false; imagePath: "qrc:/Images/Music/s_icon_64X64_favourite_list.svg"; text: "Favorite"; image: "/Images/Music/list_divider.svg"; dividerVisible: true }
    }

    ListModel {
        id: freqModel
    }
    Component.onCompleted: {
        // Assuming these functions exist in your backend to populate the station names
        count = radio.frequencyListCount()
        for(var i=0;i<count;i++){
            freqModel.append({ "stationName": radio.getStationList()[i]})
        }
    }

    Column {
        spacing: 18
        x: columnX
        y: columnY

        Repeater {
            model: listModel.count
            delegate: Item {
                width: 200
                height: 64

                Row {
                    spacing: 10
                    Image {
                        id: itemImage
                        width: 64
                        height: 64
                        source: listModel.get(index).bgVisible ? listModel.get(index).imagePath.replace(".svg", "_selected.svg") : listModel.get(index).imagePath
                        smooth: true

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                currentScreen = 3
                                for (var i = 0; i < listModel.count; i++) {
                                    listModel.setProperty(i, "bgVisible", false);
                                }
                                listModel.setProperty(index, "clicked", true);
                                listModel.setProperty(index, "bgVisible", true);
                            }
                        }
                    }

                    Text {
                        text: freqModel.get(index).stationName // Display station names instead of song names
                        font.pixelSize: 30
                        color: "white"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                currentScreen = 3
                                for (var i = 0; i < freqModel.count; i++) {
                                    freqModel.setProperty(i, "bgVisible", false);
                                }
                                freqModel.setProperty(index, "clicked", true);
                                freqModel.setProperty(index, "bgVisible", true);
                            }
                        }
                    }
                }

                Image {
                    source: listModel.get(index).image
                    width: 419
                    height: 1
                    visible: listModel.get(index).dividerVisible
                    x: itemImage.x-20
                    y: itemImage.y + itemImage.height + 10
                }
                Image {
                    source: "/Images/Music/selected_playlist_bg.svg"
                    width: 419
                    height: 79
                    visible: listModel.get(index).bgVisible
                    x: itemImage.x - 20
                    y: itemImage.y - 6
                }
            }
        }
    }
}
