import QtQuick 2.12

Item {
    property int columnX: 159
    property int columnY: 185
    ListModel {
        id: separateModel

        ListElement { bgImage: "/Images/Music/song_name_bg.svg"; text: "Song 1"; iconImage: "/Images/Music/s_icon_64X64_songs_list.svg";additionalImage: "/Images/Music/options_icon.svg"; bgVisible: false; clicked: false; selected: false }
        ListElement { bgImage: "/Images/Music/song_name_bg.svg"; text: "Song 2"; iconImage: "/Images/Music/s_icon_64X64_songs_list.svg";additionalImage: "/Images/Music/options_icon.svg"; bgVisible: false; clicked: false; selected: false }
        ListElement { bgImage: "/Images/Music/song_name_bg.svg"; text: "Song 3"; iconImage: "/Images/Music/s_icon_64X64_songs_list.svg";additionalImage: "/Images/Music/options_icon.svg"; bgVisible: false; clicked: false; selected: false }
        ListElement { bgImage: "/Images/Music/song_name_bg.svg"; text: "Song 4"; iconImage: "/Images/Music/s_icon_64X64_songs_list.svg";additionalImage: "/Images/Music/options_icon.svg"; bgVisible: false; clicked: false; selected: false }
        ListElement { bgImage: "/Images/Music/song_name_bg.svg"; text: "Song 5"; iconImage: "/Images/Music/s_icon_64X64_songs_list.svg";additionalImage: "/Images/Music/options_icon.svg"; bgVisible: false; clicked: false; selected: false }
        ListElement { bgImage: "/Images/Music/song_name_bg.svg"; text: "Song 6"; iconImage: "/Images/Music/s_icon_64X64_songs_list.svg";additionalImage: "/Images/Music/options_icon.svg"; bgVisible: false; clicked: false; selected: false }
        ListElement { bgImage: "/Images/Music/song_name_bg.svg"; text: "Song 7"; iconImage: "/Images/Music/s_icon_64X64_songs_list.svg";additionalImage: "/Images/Music/options_icon.svg"; bgVisible: false; clicked: false; selected: false }
        ListElement { bgImage: "/Images/Music/song_name_bg.svg"; text: "Song 8"; iconImage: "/Images/Music/s_icon_64X64_songs_list.svg";additionalImage: "/Images/Music/options_icon.svg"; bgVisible: false; clicked: false; selected: false }
        ListElement { bgImage: "/Images/Music/song_name_bg.svg"; text: "Song 9"; iconImage: "/Images/Music/s_icon_64X64_songs_list.svg"; additionalImage: "/Images/Music/options_icon.svg";bgVisible: false; clicked: false; selected: false }
        ListElement { bgImage: "/Images/Music/song_name_bg.svg"; text: "Song 10"; iconImage: "/Images/Music/s_icon_64X64_songs_list.svg";additionalImage: "/Images/Music/options_icon.svg"; bgVisible: false; clicked: false; selected: false }
        ListElement { bgImage: "/Images/Music/song_name_bg.svg"; text: "Song 11"; iconImage: "/Images/Music/s_icon_64X64_songs_list.svg";additionalImage: "/Images/Music/options_icon.svg"; bgVisible: false; clicked: false; selected: false }
    }

    Column {
        x: columnX + 450
        y: columnY - 20
        spacing: 10

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
                    //font.bold: true
                    font.pixelSize: 30
                    color: separateModel.get(index).selected ? "black" : "white"
                    anchors.centerIn: parent

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log(index)
                            for (var i = 0; i < separateModel.count; i++) {
                                separateModel.setProperty(i, "bgVisible", false);
                                separateModel.setProperty(i, "selected", i === index);
                            }
                        }
                    }
                }

                Image {
                    source: separateModel.get(index).selected ? "/Images/Music/s_icon_64X64_songs_list_selected.svg" : "/Images/Music/s_icon_64X64_songs_list.svg"
                    width: 64
                    height: 64
                    x: songimage.x + 55
                    y: songimage.y + 10
                }
                Image {
                    source: separateModel.get(index).selected ? "/Images/Music/options_icon_selected.svg" : separateModel.get(index).additionalImage
                        width: 48
                        height: 48
                        x: songimage.x + 550
                        y: songimage.y + 10
                    }
            }
        }
    }

    Image {
        id: scrollbarbg
        source: "/Images/Music/scrollbar_bg.svg"
        width: 2
        height: 572
        x: 1252
        y: 179
        visible: true
    }

    Image {
        id: scroller
        source: "/Images/Music/scroller_26X127.svg"
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
