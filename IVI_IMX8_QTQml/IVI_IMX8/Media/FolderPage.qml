import QtQuick 2.12

Item {
    Image {
        id: folderimage
        source: "/Images/Music/s_icon_64X64_folder.svg"
        width: 64
        height: 64
        x: 621
        y: 244
        MouseArea {
            anchors.fill: parent
            onClicked: {
                folder_selected_bg.visible = true;
                songs_selected_bg.visible = false;
            }
        }
    }
    Text {
        id: folderfile
        text: "Folder"
        font.bold: true
        font.pixelSize: 30
        color: "white"
        x: 704
        y: 258
        MouseArea {
            anchors.fill: parent
            onClicked: {
                folder_selected_bg.visible = true;
                songs_selected_bg.visible = false;
            }
        }
    }
    Image {
        id: songs_folder
        source: "/Images/Music/s_icon_64X64_folder.svg"
        width: 64
        height: 64
        x: 621
        y: 321
        MouseArea {
            anchors.fill: parent
            onClicked: {
                songs_selected_bg.visible = true;
                folder_selected_bg.visible = false;
            }
        }
    }
    Text {
        id: songsfile
        text: "Songs"
        font.bold: true
        font.pixelSize: 30
        color: "white"
        x: 704
        y: 335
        MouseArea {
            anchors.fill: parent
            onClicked: {
                songs_selected_bg.visible = true;
                folder_selected_bg.visible = false;
            }
        }
    }
    Image {
        id: folder_selected_bg
        source: "/Images/Music/song_selected_bg.svg"
        width: 646
        height: 80
        x:615
        y:244
        visible: false
    }
    Image {
        id: songs_selected_bg
        source: "/Images/Music/song_selected_bg.svg"
        width: 646
        height: 80
        x:615
        y:313
        visible: false
    }
}
