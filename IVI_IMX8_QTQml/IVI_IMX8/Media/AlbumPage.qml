import QtQuick 2.12
import QtQuick.Controls 2.15

Item {
    property int columnX: 159
    property int columnY: 185
    property bool separateModelVisible1: false
    property string clickedImage: ""
    property bool albumBackgroundVisible: true
    property bool favRemoveVisible: false
    property int undoIndex: -1

    Repeater {
        id: albumBackgroundRepeater
        model: 8
        delegate: Image {
            source: "/Images/Music/album_selected_bg.svg"
            width: 290
            height: 130
            x: 600 + (index % 2) * 345
            y: 210 + Math.floor(index / 2) * 135
            visible: !separateModelVisible1
        }
    }

    Image {
        id: mounaragamImage
        source: "/Images/Music/mounaragam.png"
        width: 100
        height: 100
        x: 623
        y: 223
        MouseArea {
            anchors.fill: parent
            onClicked: {
                clickedImage = "/Images/Music/mounaragam.png";
                hideAllImages();
                separateModelVisible1 = true;
                backarrow.visible = true;
                separateModel1.updateList();
            }
        }
    }
    Image {
        id: engeyumKadhalImage
        source: "/Images/Music/engeyum_kadhal.png"
        width: 100
        height: 100
        x: 969
        y: 223
        MouseArea {
            anchors.fill: parent
            onClicked: {
                clickedImage = "/Images/Music/engeyum_kadhal.png";
                hideAllImages();
                separateModelVisible1 = true;
                backarrow.visible = true;
                separateModel1.updateList();
            }
        }
    }
    Image {
        id: kandukondaenkandukondaenImage
        source: "/Images/Music/kandukondaen_kandukondaen.png"
        width: 100
        height: 100
        x: 623
        y: 358
        MouseArea {
            anchors.fill: parent
            onClicked: {
                clickedImage = "/Images/Music/kandukondaen_kandukondaen.png";
                hideAllImages();
                separateModelVisible1 = true;
                backarrow.visible = true;
                separateModel1.updateList();
            }
        }
    }
    Image {
        id: ayirathiloruvanImage
        source: "/Images/Music/ayirathil_oruvan.png"
        width: 100
        height: 100
        x: 969
        y: 358
        MouseArea {
            anchors.fill: parent
            onClicked: {
                clickedImage = "/Images/Music/ayirathil_oruvan.png";
                hideAllImages();
                separateModelVisible1 = true;
                backarrow.visible = true;
                separateModel1.updateList();
            }
        }
    }
    Image {
        id: jeansImage
        source: "/Images/Music/jeans.png"
        width: 100
        height: 100
        x: 623
        y: 493
        MouseArea {
            anchors.fill: parent
            onClicked: {
                clickedImage = "/Images/Music/jeans.png";
                hideAllImages();
                separateModelVisible1 = true;
                backarrow.visible = true;
                separateModel1.updateList();
            }
        }
    }
    Image {
        id: vinnaithaandivaruvaayaImage
        source: "/Images/Music/vinnaithaandi_varuvaaya.png"
        width: 100
        height: 100
        x: 969
        y: 493
        MouseArea {
            anchors.fill: parent
            onClicked: {
                clickedImage = "/Images/Music/vinnaithaandi_varuvaaya.png";
                hideAllImages();
                separateModelVisible1 = true;
                backarrow.visible = true;
                separateModel1.updateList();
            }
        }
    }
    Image {
        id: madrasapattinamImage
        source: "/Images/Music/madrasapattinam.png"
        width: 100
        height: 100
        x: 623
        y: 628
        MouseArea {
            anchors.fill: parent
            onClicked: {
                clickedImage = "/Images/Music/madrasapattinam.png";
                hideAllImages();
                separateModelVisible1 = true;
                backarrow.visible = true;
                separateModel1.updateList();
            }
        }
    }
    Image {
        id: gilliImage
        source: "/Images/Music/gilli.png"
        width: 100
        height: 100
        x: 969
        y: 628
        MouseArea {
            anchors.fill: parent
            onClicked: {
                clickedImage = "/Images/Music/gilli.png";
                hideAllImages();
                separateModelVisible1 = true;
                backarrow.visible = true;
                separateModel1.updateList();
            }
        }
    }

    ListModel {
        id: separateModel1
        function setVisibility(visibility) {
            separateModelVisible1 = visibility;
        }

        function updateList() {
            separateModel1.clear();
            for (var i = 0; i < 11; i++) {
                separateModel1.append({
                    "bgImage": clickedImage,
                    "text": "Song " + (i + 1),
                    "iconImage": "/Images/Music/s_icon_64X64_songs_list.svg",
                    "additionalImage": "/Images/Music/p_icon_48X48_fav_add_clicked.svg",
                    "bgVisible": false,
                    "clicked": false,
                    "selected": false
                });
            }
        }
    }

    function hideAllImages() {
        mounaragamImage.visible = false;
        engeyumKadhalImage.visible = false;
        kandukondaenkandukondaenImage.visible = false;
        ayirathiloruvanImage.visible = false;
        jeansImage.visible = false;
        vinnaithaandivaruvaayaImage.visible = false;
        madrasapattinamImage.visible = false;
        gilliImage.visible = false;
        albumBackgroundRepeater.visible = false; // Hide albumBackgroundRepeater
    }

    function showAllImages() {
        mounaragamImage.visible = true;
        engeyumKadhalImage.visible = true;
        kandukondaenkandukondaenImage.visible = true;
        ayirathiloruvanImage.visible = true;
        jeansImage.visible = true;
        vinnaithaandivaruvaayaImage.visible = true;
        madrasapattinamImage.visible = true;
        gilliImage.visible = true;
        albumBackgroundRepeater.visible = true; // Show albumBackgroundRepeater
    }

    Column {
        x: columnX + 450
        y: columnY + 60
        spacing: 10
        visible: separateModelVisible1

        ListView {
            id: tunerView
            width: 648
            height: 450
            model: separateModel1
            clip: true

            delegate: Item {
                width: 640
                height: 79

                Image {
                    id: songimage
                    source: "/Images/Music/song_selected_bg.svg"
                    width: parent.width
                    height: parent.height
                    visible: separateModel1.get(index).bgVisible || separateModel1.get(index).selected
                }
                Text {
                    text: separateModel1.get(index).text
                    font.bold: true
                    font.pixelSize: 30
                    color: "white"
                    anchors.centerIn: parent

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            for (var i = 0; i < separateModel1.count; i++) {
                                separateModel1.setProperty(i, "bgVisible", false);
                                separateModel1.setProperty(i, "selected", i === index);
                            }
                        }
                    }
                }
                Image {
                    source: separateModel1.get(index).bgImage
                    width: 64
                    height: 64
                    x: songimage.x + 55
                    y: songimage.y + 10
                }
                Image {
                    id: favaddimage
                    source: separateModel1.get(index).additionalImage
                    width: 48
                    height: 48
                    x: songimage.x + 550
                    y: songimage.y + 10
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (separateModel1.get(index).additionalImage === "/Images/Music/p_icon_48X48_fav_add.svg") {
                                separateModel1.setProperty(index, "additionalImage", "/Images/Music/p_icon_48X48_fav_add_clicked.svg");
                                favRemoveVisible = false;
                                undoIndex = -1;
                                hideRemovedFromFavTimer.stop();
                            } else if (separateModel1.get(index).additionalImage === "/Images/Music/p_icon_48X48_fav_add_clicked.svg") {
                                separateModel1.setProperty(index, "additionalImage", "/Images/Music/p_icon_48X48_fav_added_select.svg");
                                favRemoveVisible = false;
                                undoIndex = index;
                                hideRemovedFromFavTimer.stop();
                            } else if (separateModel1.get(index).additionalImage === "/Images/Music/p_icon_48X48_fav_added_select.svg") {
                                separateModel1.setProperty(index, "additionalImage", "/Images/Music/p_icon_48X48_fav_add_clicked.svg");
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
                separateModelVisible1 = false;
                backarrow.visible = false;
                showAllImages();
            }
        }
    }

    Image {
        id: scroller
        source: "/Images/Music/scroller_1.svg"
        width: 17
        height: 164
        x: 1263
        y: 358
        visible: tunerView.contentHeight > tunerView.height

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
                    separateModel1.setProperty(undoIndex, "additionalImage", "/Images/Music/p_icon_48X48_fav_added_select.svg");
                    undoIndex = -1;
                    favRemoveVisible = false;
                    hideRemovedFromFavTimer.restart();
                }
            }
        }
    }
}
