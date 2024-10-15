import QtQuick 2.12
import QtQuick.Controls 2.15

Item {
    property int columnX: 159
    property int columnY: 233
    property bool showSongsModel: false
    property bool showArtistPage: false
    property bool showFavoritesPage: false
    property bool showAlbumPage: false
    property bool showFolderPage: false
    property string clickedText: "Browse"

    ListModel {
        id: listModel
        ListElement { name: "album"; clicked: false; bgVisible: false; imagePath: "/Images/Music/s_icon_64X64_album.svg"; text: "Album"; image: "/Images/Music/list_divider.svg"; dividerVisible: true }
        ListElement { name: "playlist"; clicked: false; bgVisible: false; imagePath: "/Images/Music/s_icon_64X64_playlist.svg"; text: "Playlist"; image: "/Images/Music/list_divider.svg"; dividerVisible: true }
        ListElement { name: "artist_list"; clicked: false; bgVisible: false; imagePath: "/Images/Music/s_icon_64X64_artist.svg"; text: "Artist"; image: "/Images/Music/list_divider.svg"; dividerVisible: true }
        ListElement { name: "songsList"; clicked: false; bgVisible: false; imagePath: "/Images/Music/s_icon_64X64_songs_list.svg"; text: "Songs"; image: "/Images/Music/list_divider.svg"; dividerVisible: true }
        ListElement { name: "folder"; clicked: false; bgVisible: false; imagePath: "/Images/Music/s_icon_64X64_folder.svg"; text: "Folder"; image: "/Images/Music/list_divider.svg"; dividerVisible: true }
        ListElement { name: "favorite_list"; clicked: false; bgVisible: false; imagePath: "/Images/Music/s_icon_64X64_favourite_list.svg"; text: "Favorite"; image: "/Images/Music/list_divider.svg"; dividerVisible: true }
    }

    Column {
        spacing: 18
        x: columnX
        y: columnY

        Repeater {
            model: listModel
            delegate: Item {
                width: 200
                height: 64

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        for (var i = 0; i < listModel.count; i++) {
                            listModel.setProperty(i, "bgVisible", false);
                        }
                        listModel.setProperty(index, "bgVisible", true);

                        showAlbumPage = model.name === "album";
                        showArtistPage = model.name === "artist_list";
                        showSongsModel = model.name === "songsList";
                        showFavoritesPage = model.name === "favorite_list";
                        showFolderPage = model.name === "folder";
                        clickedText = model.text;
                    }
                    Row {
                        spacing: 10
                        Image {
                            id: itemImage
                            width: 64
                            height: 64
                            source: model.bgVisible ? model.imagePath.replace(".svg", "_selected.svg") : model.imagePath
                            smooth: true
                        }
                        Text {
                            text: model.text
                            font.pixelSize: 30
                            color: "white"
                            y: model.yPosition +20
                        }
                    }
                }
                Image {
                    source: model.image
                    width: 419
                    height: 1
                    visible: model.dividerVisible
                    x: itemImage.x - 20
                    y: itemImage.y + itemImage.height + 10
                }
                Image {
                    source: "/Images/Music/selected_playlist_bg.svg"
                    width: 419
                    height: 79
                    visible: model.bgVisible
                    x: itemImage.x - 20
                    y: itemImage.y - 6
                }
            }
        }
    }
    Text {
        text: clickedText
        font.pixelSize: 30
        font.bold: true
        color: "white"
        x: 245
        y: 146
    }
    Image {
        id: backarrow
        source: "/Images/Music/p_icon_48X48_go_to_media_main_screen.svg"
        width: 64
        height: 64
        x: 161
        y: 131
        visible: true
        MouseArea {
            anchors.fill: parent
            onClicked: {
                currentScreen = 2
            }
        }
    }
    Image {
        id: line
        source: "/Images/Music/Line.svg"
        width: 1080
        height: 1
        x: 164
        y: 205.5
        visible: true
    }
    Songs {
        id: songsComponent
        visible: showSongsModel
        anchors.fill: parent
    }
    ArtistPage {
        id: artistPageComponent
        visible: showArtistPage
        anchors.fill: parent
    }
    Favorites {
        id: favoritesComponent
        visible: showFavoritesPage
        anchors.fill: parent
    }
    AlbumPage {
        id: albumPageComponent
        visible: showAlbumPage
        anchors.fill: parent
    }
    FolderPage {
        id: folderPageComponent
        visible: showFolderPage
        anchors.fill: parent
    }
}
