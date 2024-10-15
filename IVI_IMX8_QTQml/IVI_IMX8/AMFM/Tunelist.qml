import QtQuick 2.15
import QtQuick.Controls 2.15
import com.ivi.radio 1.0

Item {
    property int count

    id: tunelist
    visible:true

    ListView {
        id: tunerView
        width: 1032
        height: 72 * 6
        x:182
        y:331
        clip: true
        model: freqModel
        delegate: Item {
            id: tuneDelegate
            width: 1032
            height: 72

            Image {
                source: "/Images/Radio/channel_info_1032X72_3t_txt.svg"
                width: 1032
                height:72
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
                anchors.verticalCenter: parent.verticalCenter
                rightPadding: 177
            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                }

                onReleased: {
                    console.log("Selected index",index,model.stationName)
                    radio.setIndexFromTuneTable(index,0)
                    currentScreen = 1
                    tuneSelected = false

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
        y: 135
         MouseArea {
             anchors.fill: parent
             onReleased: {
                 currentScreen = 1
                 tuneSelected = false
             }
         }
     }
     Text {
         text: "Available Station List"
         color: "white"
         font.pixelSize: 30
         font.family: "Urbanist"
         x: 225
         y: 140
    }
    Image {
        id:scrollbarbg
        source: "/Images/Radio/scrollbar_bg.svg"
        width: 12
        height: 457
        x: 1237
        y: 331
    }
    Image {
        id:scroller
        source: "/Images/Radio/scroller_26X127.svg"
        width: 26
        height: 127
        x: 1230
        y: 328

        MouseArea {
            id: trackerMouseArea
            anchors.fill: parent
            drag.target: parent
            drag.axis: Drag.YAxis
            drag.minimumY: 328
            drag.maximumY: 662

            onPositionChanged: {
                var normalizedPosition = (scroller.y - scrollbarbg.y) / (scrollbarbg.height - scroller.height);
                var minY = 0; 
                var maxY = tunerView.contentHeight - tunerView.height; 
                var newY = normalizedPosition * (maxY - minY);
                tunerView.contentY = newY;
            }
        }
    }
    ListModel {
        id: freqModel
    }
    Component.onCompleted: {
        count = radio.frequencyListCount()
        // console.log("Count", count)
        for(var i=0;i<count;i++){
            freqModel.append({"frequency": radio.getFrequencyList()[i], "stationName":radio.getStationList()[i]})
        }
    }
    Connections {
        target: radio
        function onFrequencyChanged() {
            frequency = radio.frequency
            frequency = frequency.toFixed(1)
            // console.log("The changed freq ",frequency)
            freqValue = (frequency<100)?radio.frequencyValConversion+"0":radio.frequencyValConversion
            // console.log("The changed freq ",frequency)
        }
    }
}

