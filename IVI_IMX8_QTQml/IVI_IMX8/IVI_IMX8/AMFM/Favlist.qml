import QtQuick 2.15
import QtQuick.Controls 2.15
import com.ivi.radio 1.0
import QtQuick.VirtualKeyboard 1.0

Item {
    property int count

    id: favlist
    visible:true

    ListView {
        id: favoriteView
        width: 1032
        height: 72 * 6
        x:182
        y:331
        clip: true
        model: freqModel
        delegate: Item {
            id: favDelegate
            width: 1032
            height: 72

            Image {
                source: "/Images/Radio/channel_info_1032X72_3t_txt.svg"
                width: 1032
                height:72
                MouseArea{
                    anchors.fill: parent
                    onReleased: {
                        console.log("Selected index",index,model.stationName)
                        radio.setIndexFromTuneTable(index,1)
                        currentScreen = 1
                        favSelected = false

                    }
                }
            }

            Text {
                text: model.stationName
                font.pixelSize: 30
                color: "white"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                leftPadding: 25
            }

            Text {
                text: model.frequency+"MHZ"
                font.pixelSize: 30
                color: "white"
                anchors.right: parent.right
                // anchors.left: parent.left

                anchors.verticalCenter: parent.verticalCenter
                rightPadding: 215
            }
            Image {
                source: "/Images/Radio/p_icon_48X48_edit.svg"
                width: 48
                height: 48
                // anchors.right: parent.right
                x:861
                anchors.verticalCenter: parent.verticalCenter
                visible: favSelected?true:false
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        // load.source = "VKeyBoard.qml"
                        isvkey = true
                        // password_box.visible = true
                        // password_box.focus=true
                        // password_box.text=""
                        // inputPanel.visible=true
                        // fav_list.popupVisible = !fav_list.popupVisible; // Toggle the visibility of the popup when the remove icon is clicked
                    }
                }
            }
            Image {
                source: "/Images/Radio/p_icon_48X48_fav_remove.svg"
                width: 48
                height: 48
                // anchors.right: parent.right
                x:954
                anchors.verticalCenter: parent.verticalCenter
                visible: favSelected?true:false
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        radio.removeFavFromList(index)
                        // password_box.visible = true
                        // password_box.focus=true
                        // password_box.text=""
                        // inputPanel.visible=true
                        // fav_list.popupVisible = !fav_list.popupVisible; // Toggle the visibility of the popup when the remove icon is clicked
                    }
                }
            }
        }
        onContentYChanged: {
            var normalizedPosition = contentY / (contentItem.height - height);
            var maxYPosition = scrollbarbg.y + scrollbarbg.height - scroller.height;
            var minYPosition = scrollbarbg.y;
            var newPosition = normalizedPosition * (maxYPosition - minYPosition) + minYPosition;
            scroller.y = Math.min(Math.max(newPosition, minYPosition), maxYPosition);
        }
    }
    Image {
        id:backarrow
        source: "/Images/Radio/p_icon_48X48_back_arrow.svg"
        width: 48
        height: 48
        x: 148
        y: 138
        MouseArea{
            anchors.fill: parent
            onReleased: {
                currentScreen = 1
                favSelected = false
            }
        }
    }
    Text {
        text: "Favorites"
        color: "white"
        font.pixelSize: 30
        font.family: "Urbanist"
        x: 225
        y: 145
    }
    Image {
        id:scrollbarbg
        source: "/Images/Radio/scrollbar_bg.svg"
        width: 12
        height: 457
        x: 1237
        y: 331
        visible: count > 6 // Only show scroller if count is greater than or equal to 6
    }
    Image {
        id:scroller
        source: "/Images/Radio/scroller_26X127.svg"
        width: 26
        height: 127
        x: 1230
        y: 328
        visible: count > 6 // Only show scroller if count is greater than or equal to 6

        MouseArea {
            id: trackerMouseArea
            anchors.fill: parent
            drag.target: parent
            drag.axis: Drag.YAxis
            drag.minimumY: 328
            drag.maximumY: 662

            onPositionChanged: {
                var normalizedPosition = (scroller.y - scrollbarbg.y) / (scrollbarbg.height - scroller.height);
                var minY = 0; // Minimum contentY
                var maxY = favoriteView.contentHeight - favoriteView.height; // Maximum contentY
                var newY = normalizedPosition * (maxY - minY);
                favoriteView.contentY = newY;
            }
        }
    }
    Image {
        id: nofavlist
        source: "/Images/Radio/itm_WarningwithText_nofavlist.svg"
        width: 257
        height: 169
        x: 574
        y: 459
        visible: count === 0
    }
    ListModel {
        id: freqModel
    }
    Loader {
        id:load
    }
    VKeyBoard{
        id:vkeyboard
        visible: false
    }

    Component.onCompleted: {
        count = radio.favFrequencyListCount()
        console.log("Fav Count", count)
        if(count>=0){
            for(var i=0;i<count;i++){
                console.log("List Details: ",radio.getFavFrequencyList()[i],radio.getFavStationList()[i])
                freqModel.append({"frequency": radio.getFavFrequencyList()[i], "stationName":radio.getFavStationList()[i]})
            }
        }
    }
    Connections {
        target: radio
        function onFrequencyChanged() {
            frequency = radio.frequency
            frequency = frequency.toFixed(1)
            freqValue = (frequency<100)?radio.frequencyValConversion+"0":radio.frequencyValConversion
        }
        function onFavoriteListChanged() {
            count = radio.favFrequencyListCount()
            console.log("Fav Count", count)
            freqModel.clear()
            if(count>=0){
                for(var i=0;i<count;i++){
                    console.log("List Details: ",radio.getFavFrequencyList()[i],radio.getFavStationList()[i])
                    freqModel.append({"frequency": radio.getFavFrequencyList()[i], "stationName":radio.getFavStationList()[i]})
                }
            }
        }
    }
}

