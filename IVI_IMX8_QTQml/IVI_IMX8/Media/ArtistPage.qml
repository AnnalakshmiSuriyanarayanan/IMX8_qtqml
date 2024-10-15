import QtQuick 2.12
import QtQuick.Controls 2.15

Item {
    property int columnX: 159
    property int columnY: 185
    property bool separateModelVisible: false
    property string clickedImage: ""
    property bool favRemoveVisible: false
    property int undoIndex: -1

    Repeater {
        id: artistBackgroundRepeater
        model: 8
        delegate: Image {
            source: "/Images/Music/album_selected_bg.svg"
            width: 290
            height: 130
            x: 600 + (index % 2) * 345
            y: 210 + Math.floor(index / 2) * 135
            z: -1
            visible: !separateModelVisible
        }
    }
    Image {
        id: shreyaImage
        source: "/Images/Music/shreyagoshal.png"
        width: 100
        height: 100
        x: 623
        y: 223
        MouseArea {
            anchors.fill: parent
            onClicked: {
                clickedImage = "/Images/Music/shreyagoshal.png";
                updateList();
                hideAllImages();
                separateModelVisible = true;
                backarrow.visible = true;
                artistBackgroundRepeater.visible = false;
            }
        }
    }
    Image {
        id: sujathaImage
        source: "/Images/Music/sujatha.png"
        width: 100
        height: 100
        x: 969
        y: 223
        MouseArea {
            anchors.fill: parent
            onClicked: {
                clickedImage = "/Images/Music/sujatha.png";
                updateList();
                hideAllImages();
                separateModelVisible = true;
                backarrow.visible = true;
                artistBackgroundRepeater.visible = false;
            }
        }
    }
    Image {
        id: haricharanImage
        source: "/Images/Music/haricharan.png"
        width: 100
        height: 100
        x: 623
        y: 358
        MouseArea {
            anchors.fill: parent
            onClicked: {
                clickedImage = "/Images/Music/haricharan.png";
                updateList();
                hideAllImages();
                separateModelVisible = true;
                backarrow.visible = true;
                artistBackgroundRepeater.visible = false;
            }
        }
    }
    Image {
        id: jonitaImage
        source: "/Images/Music/jonitagandhi.png"
        width: 100
        height: 100
        x: 969
        y: 358
        MouseArea {
            anchors.fill: parent
            onClicked: {
                clickedImage = "/Images/Music/jonitagandhi.png";
                updateList();
                hideAllImages();
                separateModelVisible = true;
                backarrow.visible = true;
                artistBackgroundRepeater.visible = false;
            }
        }
    }
    Image {
        id: arrahmanImage
        source: "/Images/Music/arrahman.png"
        width: 100
        height: 100
        x: 623
        y: 493
        MouseArea {
            anchors.fill: parent
            onClicked: {
                clickedImage = "/Images/Music/arrahman.png";
                updateList();
                hideAllImages();
                separateModelVisible = true;
                backarrow.visible = true;
                artistBackgroundRepeater.visible = false;
            }
        }
    }
    Image {
        id: vidyasagarImage
        source: "/Images/Music/vidyasagar.png"
        width: 100
        height: 100
        x: 969
        y: 493
        MouseArea {
            anchors.fill: parent
            onClicked: {
                clickedImage = "/Images/Music/vidyasagar.png";
                updateList();
                hideAllImages();
                separateModelVisible = true;
                backarrow.visible = true;
                artistBackgroundRepeater.visible = false;
            }
        }
    }
    Image {
        id: spbImage
        source: "/Images/Music/spb.png"
        width: 100
        height: 100
        x: 623
        y: 628
        MouseArea {
            anchors.fill: parent
            onClicked: {
                clickedImage = "/Images/Music/spb.png";
                updateList();
                hideAllImages();
                separateModelVisible = true;
                backarrow.visible = true;
                artistBackgroundRepeater.visible = false;
            }
        }
    }
    Image {
        id: gvprakashImage
        source: "/Images/Music/gvprakash.png"
        width: 100
        height: 100
        x: 969
        y: 628
        MouseArea {
            anchors.fill: parent
            onClicked: {
                clickedImage = "/Images/Music/gvprakash.png";
                updateList();
                hideAllImages();
                separateModelVisible = true;
                backarrow.visible = true;
            }
        }
    }

    ListModel {
        id: separateModel
        function setVisibility(visibility) {
            separateModelVisible = visibility;
        }

        Component.onCompleted: {
            for (var i = 0; i < 11; i++) {
                append({
                    "bgImage": clickedImage,
                    "text": "Song " + (i + 1),
                    "iconImage": "/Images/Music/s_icon_64X64_songs_list.svg",
                    "additionalImage": "/Images/Music/p_icon_48X48_fav_add_clicked.svg",
                    "bgVisible": false,
                    "clicked": false,
                    "selected": false
                })
            }
        }
    }

    function updateList() {
        separateModel.clear();
        for (var i = 0; i < 11; i++) {
            separateModel.append({
                "bgImage": clickedImage,
                "text": "Song " + (i + 1),
                "iconImage": "/Images/Music/s_icon_64X64_songs_list.svg",
                "additionalImage": "/Images/Music/p_icon_48X48_fav_add_clicked.svg",
                "bgVisible": false,
                "clicked": false,
                "selected": false
            })
        }
        artistBackgroundRepeater.visible = false;
        separateModelVisible = true;
    }

    function hideAllImages() {
        shreyaImage.visible = false;
        sujathaImage.visible = false;
        haricharanImage.visible = false;
        jonitaImage.visible = false;
        arrahmanImage.visible = false;
        vidyasagarImage.visible = false;
        spbImage.visible = false;
        gvprakashImage.visible = false;
    }

    function hideAllImages1() {
        shreyaImage.visible = true;
        sujathaImage.visible = true;
        haricharanImage.visible = true;
        jonitaImage.visible = true;
        arrahmanImage.visible = true;
        vidyasagarImage.visible = true;
        spbImage.visible = true;
        gvprakashImage.visible = true;
    }

    Column {
        x: columnX + 450
        y: columnY + 60
        spacing: 10
        visible: separateModelVisible

        ListView {
            id: tunerView
            width: 648
            height: 450
            model: separateModel
            clip: true

            delegate: Item {
                width: 640
                height: 79

                Image {
                    id: songimage
                    source: "/Images/Music/song_selected_bg.svg"
                    width: parent.width
                    height: parent.height
                    visible: model.bgVisible || model.selected
                }
                Text {
                    text: model.text
                    font.bold: true
                    font.pixelSize: 30
                    color: "white"
                    anchors.centerIn: parent

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            for (var i = 0; i < separateModel.count; i++) {
                                separateModel.setProperty(i, "bgVisible", false);
                                separateModel.setProperty(i, "selected", i === index);
                            }
                        }
                    }
                }
                Image {
                    source: model.bgImage
                    width: 64
                    height: 64
                    x: songimage.x + 55
                    y: songimage.y + 10
                }
                Image {
                    id: favaddimage
                    source: model.additionalImage
                    width: 48
                    height: 48
                    x: songimage.x + 550
                    y: songimage.y + 10
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (model.additionalImage === "/Images/Music/p_icon_48X48_fav_add.svg") {
                                separateModel.setProperty(index, "additionalImage", "/Images/Music/p_icon_48X48_fav_add_clicked.svg");
                                favRemoveVisible = false;
                                undoIndex = -1;
                                hideRemovedFromFavTimer.stop();
                            } else if (model.additionalImage === "/Images/Music/p_icon_48X48_fav_add_clicked.svg") {
                                separateModel.setProperty(index, "additionalImage", "/Images/Music/p_icon_48X48_fav_added_select.svg");
                                favRemoveVisible = false;
                                undoIndex = index;
                                hideRemovedFromFavTimer.stop();
                            } else if (model.additionalImage === "/Images/Music/p_icon_48X48_fav_added_select.svg") {
                                separateModel.setProperty(index, "additionalImage", "/Images/Music/p_icon_48X48_fav_add_clicked.svg");
                                favRemoveVisible = true;
                                undoIndex = -1;
                                hideRemovedFromFavTimer.restart();
                            }
                        }
                    }
                }
            }
        }
    }
    Image {
        id: backarrow
        source: "/Images/Music/p_icon_48X48_back_arrow.svg"
        width: 48
        height: 48
        x: 641
        y: 163
        visible: false
        MouseArea {
            anchors.fill: parent
            onClicked: {
                hideAllImages1();
                separateModelVisible = false;
                backarrow.visible = false;
            }
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
                    separateModel.setProperty(undoIndex, "additionalImage", "/Images/Music/p_icon_48X48_fav_add_clicked.svg");
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
