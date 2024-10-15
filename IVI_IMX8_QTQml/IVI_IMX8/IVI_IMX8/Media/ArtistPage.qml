import QtQuick 2.12
import QtQuick.Controls 2.15

Item {
    property int columnX: 159
    property int columnY: 185
    property bool separateModelVisible: false

    Image {
        id: shreyaImage
        source: "/Images/Shreyagoshal_hits.png"
        width: 230
        height: 230
        x: 962
        y: 185
        MouseArea {
            anchors.fill: parent
            onClicked: {
                shreyaImage.visible = false;
                rahmanImage.visible = false;
                spbImage.visible = false;
                jonitaImage.visible = false;
                separateModelVisible = true;
                backarrow.visible=true;
            }
        }
    }
    Image {
        id: rahmanImage
        source: "/Images/ARRahman_hits.png"
        width: 230
        height: 230
        x: 664
        y: 185
        MouseArea {
            anchors.fill: parent
            onClicked: {
                shreyaImage.visible = false;
                rahmanImage.visible = false;
                spbImage.visible = false;
                jonitaImage.visible = false;
                separateModelVisible = true;
                backarrow.visible=true;
            }
        }
    }
    Image {
        id: spbImage
        source: "/Images/SPB_hits.png"
        width: 230
        height: 230
        x: 664
        y: 499
        MouseArea {
            anchors.fill: parent
            onClicked: {
                shreyaImage.visible = false;
                rahmanImage.visible = false;
                spbImage.visible = false;
                jonitaImage.visible = false;
                separateModelVisible = true;
                backarrow.visible=true;
            }
        }
    }
    Image {
        id: jonitaImage
        source: "/Images/Jonitagandhi_hits.png"
        width: 230
        height: 230
        x: 962
        y: 499
        MouseArea {
            anchors.fill: parent
            onClicked: {
                shreyaImage.visible = false;
                rahmanImage.visible = false;
                spbImage.visible = false;
                jonitaImage.visible = false;
                separateModelVisible = true;
                backarrow.visible=true;
            }
        }
    }

    ListModel {
        id: separateModel
        function setVisibility(visibility) {
            separateModelVisible = visibility;
        }

        ListElement { bgImage: "/Images/Shreyagoshal_hits.png"; text: "Song 1"; iconImage: "/Images/s_icon_64X64_songs_list.svg";additionalImage: "/Images/options_icon.svg"; bgVisible: false; clicked: false; selected: false }
        ListElement { bgImage: "/Images/Shreyagoshal_hits.png"; text: "Song 2"; iconImage: "/Images/s_icon_64X64_songs_list.svg";additionalImage: "/Images/options_icon.svg"; bgVisible: false; clicked: false; selected: false }
        ListElement { bgImage: "/Images/Shreyagoshal_hits.png"; text: "Song 3"; iconImage: "/Images/s_icon_64X64_songs_list.svg";additionalImage: "/Images/options_icon.svg"; bgVisible: false; clicked: false; selected: false }
        ListElement { bgImage: "/Images/Shreyagoshal_hits.png"; text: "Song 4"; iconImage: "/Images/s_icon_64X64_songs_list.svg";additionalImage: "/Images/options_icon.svg"; bgVisible: false; clicked: false; selected: false }
        ListElement { bgImage: "/Images/Shreyagoshal_hits.png"; text: "Song 5"; iconImage: "/Images/s_icon_64X64_songs_list.svg";additionalImage: "/Images/options_icon.svg"; bgVisible: false; clicked: false; selected: false }
        ListElement { bgImage: "/Images/Shreyagoshal_hits.png"; text: "Song 6"; iconImage: "/Images/s_icon_64X64_songs_list.svg";additionalImage: "/Images/options_icon.svg"; bgVisible: false; clicked: false; selected: false }
        ListElement { bgImage: "/Images/Shreyagoshal_hits.png"; text: "Song 7"; iconImage: "/Images/s_icon_64X64_songs_list.svg";additionalImage: "/Images/options_icon.svg"; bgVisible: false; clicked: false; selected: false }
        ListElement { bgImage: "/Images/Shreyagoshal_hits.png"; text: "Song 8"; iconImage: "/Images/s_icon_64X64_songs_list.svg";additionalImage: "/Images/options_icon.svg"; bgVisible: false; clicked: false; selected: false }
        ListElement { bgImage: "/Images/Shreyagoshal_hits.png"; text: "Song 9"; iconImage: "/Images/s_icon_64X64_songs_list.svg"; additionalImage: "/Images/options_icon.svg";bgVisible: false; clicked: false; selected: false }
        ListElement { bgImage: "/Images/Shreyagoshal_hits.png"; text: "Song 10"; iconImage: "/Images/s_icon_64X64_songs_list.svg";additionalImage: "/Images/options_icon.svg"; bgVisible: false; clicked: false; selected: false }
        ListElement { bgImage: "/Images/Shreyagoshal_hits.png"; text: "Song 11"; iconImage: "/Images/s_icon_64X64_songs_list.svg";additionalImage: "/Images/options_icon.svg"; bgVisible: false; clicked: false; selected: false }
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
                width: 648
                height: 79

                Image {
                    id: songimage
                    source: separateModel.get(index).bgImage
                    width: parent.width
                    height: parent.height
                    visible: separateModel.get(index).bgVisible || separateModel.get(index).selected
                }

                Text {
                    text: separateModel.get(index).text
                    font.bold: true
                    font.pixelSize: 30
                    color: separateModel.get(index).selected ? "black" : "white"
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
                    source: bgImage
                    width: 64
                    height: 64
                    x: songimage.x + 55
                    y: songimage.y + 10
                }
                Image {
                    source: separateModel.get(index).selected ? "/Images/options_icon_selected.svg" : separateModel.get(index).additionalImage
                    width: 48
                    height: 48
                    x: songimage.x + 550
                    y: songimage.y + 10
                }

            }
        }
    }
    Image {
        id: backarrow
        source: "/Images/p_icon_48X48_back_arrow.svg"
        width: 48
        height: 48
        x: 641
        y: 163
        visible: false
        MouseArea {
            anchors.fill: parent
            onClicked: {
                shreyaImage.visible = true;
                rahmanImage.visible = true;
                spbImage.visible = true;
                jonitaImage.visible = true;
                separateModelVisible = false;
                backarrow.visible=false;
            }
        }
    }

    Image {
        id: scrollbarbg
        source: "/Images/scrollbar_bg.svg"
        width: 2
        height: 572
        x: 1252
        y: 179
        visible: true
    }
    Image {
        id: scroller
        source: "/Images/scroller_26X127.svg"
        width: 8
        height: 83
        x: 1249
        y: 179
        visible: tunerView.contentHeight > tunerView.height

        MouseArea {
            anchors.fill: parent
            drag.target: parent
            drag.axis: Drag.YAxis
            drag.minimumY: scrollbarbg.y
            drag.maximumY: scrollbarbg.y + scrollbarbg.height - scroller.height

            onPositionChanged: {
                var normalizedPosition = (parent.y - scrollbarbg.y) / (scrollbarbg.height - scroller.height);
                var minY = 0;
                var maxY = tunerView.contentHeight - tunerView.height;
                var newY = normalizedPosition * (maxY - minY);
                tunerView.contentY = newY;
            }
        }
    }
}
