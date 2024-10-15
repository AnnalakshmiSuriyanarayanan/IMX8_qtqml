import QtQuick 2.15

Item {
    id: mainpage1
    visible: true
    Image {
        id:radioIcon
        source: stopDisabled ? "/Images/Radio/static_icon_100X100__radio_disabled.svg":"/Images/Radio/static_icon_100X100__radio.svg"
        width: 100;height: 100
        x: 177
        y: 138
    }

    Text {
        id: radioText
        text: "FM RADIO"
        color: "white"
        font.pixelSize: 60
        font.family: "Urbanist"
        x: 285
        y: 125
        visible: !stopDisabled
    }
    Text {
        text: stnName
        color: "white"
        font.pixelSize: 42
        font.family: "Urbanist"
        anchors.top: radioText.bottom
        anchors.left: parent.right
        anchors.leftMargin: 285
        visible: !stopDisabled
    }
    Text {
        text: "-- --"
        color: "grey"
        font.pixelSize: 70
        font.family: "Urbanist"
        x: 300
        y: 150
        visible: stopDisabled
    }
    Image {
        id: skipPreviousButton
        source: stopDisabled ? "/Images/Radio/p_icon_48X48_skip_previous_disabled.svg" : (skipPreviousSelected ? "/Images/Radio/p_icon_48X48_skip_previous_pressed.svg" : "/Images/Radio/p_icon_48X48_skip_previous.svg")
        width: 48 ; height: 48
        x:490
        y:688

        MouseArea {
            id: skipPreviousMouseArea
            anchors.fill: parent
            enabled: !stopSelected
            onPressed: {
                skipPreviousSelected = true;
                radio.seekPreviousStation()
                trackerCursor.x = minSLiderValue + getFrequencyVal()
            }
            onReleased: {
                skipPreviousSelected = false;
            }
        }
    }
    // Image 11 (Fav Add)
    Image {
        id: favAddButton
        source:stopDisabled ?"/Images/Radio/p_icon_48X48_fav_add_disabled.svg": favAddSelected ? "/Images/Radio/p_icon_48X48_fav_added.svg" : "/Images/Radio/p_icon_48X48_fav_add.svg"
        width: 48 ; height: 48
        x:613
        y:688

        MouseArea {
            anchors.fill: parent
            enabled: !stopSelected
            onClicked: {
                // togglefavAddVisibility();
                radio.setIsFavorite(!favAddSelected)
            }
        }
    }

    // Image 12 (Stop)
    Image {
        id: stopButton
        source: stopDisabled ? "/Images/Radio/p_icon_48X48_power_icon_disabled.svg" : (stopSelected ? "/Images/Radio/p_icon_48X48_power_icon_selected.svg" : "/Images/Radio/p_icon_48X48_power_icon.svg")
        width: 48 ; height: 48
        x:736
        y:688

        MouseArea {
            id: stopMouseArea
            anchors.fill: parent
            onPressed: {
                if (!stopDisabled) {
                    stopSelected = true;
                }
            }
            onReleased: {
                if (stopSelected && !stopDisabled) {
                    stopSelected = false;
                    stopDisabled = true;
                } else if (stopDisabled) {
                    stopSelected = false;
                    stopDisabled = false;
                }
                radio.mute()
            }
        }
    }

    // Image 13 (Skip Next)
    Image {
        id: skipNextButton
        source: stopDisabled ? "/Images/Radio/p_icon_48X48_skip_nxt_disabled.svg" : skipNextSelected ? "/Images/Radio/p_icon_48X48_skip_nxt_pressed.svg":"/Images/Radio/p_icon_48X48_skip_nxt.svg"
        width: 48 ; height: 48
        x:859
        y:688

        MouseArea {
            anchors.fill: parent
            enabled: !stopSelected
            onPressed: {
                skipNextSelected = true;
                radio.seekNextStation()
                trackerCursor.x = minSLiderValue + getFrequencyVal()
                console.log("The Seek Next station ", trackerCursor.x,getFrequencyVal())
            }
            onReleased: {
                skipNextSelected = false;
            }
        }
    }

    Image {
        id:skipNextDisabled
        source: "/Images/Radio/p_icon_48X48_skip_nxt_disabled.svg"
        width: 48 ; height: 48
        x:859
        y:688
    }
    Text {
        text: '87.5'
        color: "white"
        font.pixelSize: 30
        font.family: "Urbanist"
        x: 325
        y: 586
        visible: !stopDisabled
    }
    // Image 14
    Image {
        id:radioBG
        source: "/Images/Radio/tracker_567X18_radio_background.svg"
        width: 566
        height: 18
        x: 418
        y: 597
        visible: !stopDisabled
    }
    // Image 15
    Image {
        id: trackerCursor
        source: "/Images/Radio/tracker_cursor_9X64.svg"
        width: 8
        height: 64
        x: minSLiderValue
        y: 574
        visible: !stopDisabled

        MouseArea {
            id: trackerMouseArea
            anchors.fill: parent
            drag.target: parent
            drag.axis: Drag.XAxis
            drag.minimumX: 414
            drag.maximumX: 985
            // onDragChanged: console.log("The frequency to be changed ",valTofreqConversion,frequency)
            // onMouseXChanged: console.log("The frequency to be changed via bar",valTofreqConversion,frequency)
            onMouseXChanged: {
                valTofreqConversion = ((trackerCursor.x - minSLiderValue)/27.85).toFixed(1)
                valTofreqConversion+= minFreq
                // console.log("The frequency to be changed ",valTofreqConversion,frequency)
            }
            onReleased: {
                radio.setBarFrequency(valTofreqConversion)
                // valTofreqConversion = ((trackerCursor.x - minSLiderValue)/27.85).toFixed(1)
                // valTofreqConversion+= minFreq
                // console.log("The frequency to be changed ",valTofreqConversion,frequency)
                // radio.setBarFrequency(valTofreqConversion)
            }
        }
    }
    // Text 2
    Text {
        text: '108'
        color: "white"
        font.pixelSize: 30
        font.family: "Urbanist"
        x: 1010
        y: 586
        visible: !stopDisabled

    }
    // Image 16 (Minus)
    Image {
        id:minusIcon
        source:stopDisabled ? "/Images/Radio/p_icon_48X48_minus_disabled.svg": minusSelected ? "/Images/Radio/p_icon_48X48_minus_selected.svg" : "/Images/Radio/p_icon_48X48_minus.svg"
        width: 48 ; height: 48
        x: 337
        y: 429
        visible: !stopDisabled

        MouseArea {
            anchors.fill: parent
            onPressed: {
                minusSelected = true;
                // moveTrackerCursor();
                radio.seekBackward()
                trackerCursor.x = minSLiderValue + getFrequencyVal()
            }
            onReleased: {
                minusSelected = false;
                // moveTrackerCursor();
            }
        }
    }
    // Image 17
    Image {
        id:roundedRectangle
        source: "/Images/Radio/rounded_rectancle_572X120.svg"
        width: 572
        height: 120
        x: 415
        y: 393
        visible: !stopDisabled
        Text {
            text: freqValue
            color: "white"
            font.pixelSize: 100
            font.family: "Urbanist"
            width: 316
            height: 120
            x:128
        }
    }
    // Image 18 (Plus)
    Image {
        id:plusIcon
        source:stopDisabled ? "/Images/Radio/p_icon_48X48_plus_disabled.svg": plusSelected ? "/Images/Radio/p_icon_48X48_plus_selected.svg" : "/Images/Radio/p_icon_48X48_plus.svg"
        width: 48 ; height: 48
        x: 1017
        y: 429
        visible: !stopDisabled
        MouseArea {
            anchors.fill: parent
            onPressed: {
                plusSelected = true;
                // moveTrackerCursor();
                radio.seekForward()
                trackerCursor.x = minSLiderValue + getFrequencyVal()
            }
            onReleased: {
                plusSelected = false;
                // moveTrackerCursor();
            }
        }
    }
    Component.onCompleted: {
        trackerCursor.x = minSLiderValue + getFrequencyVal()
        stnName = radio.stnName
    }

    Connections {
        target: radio
        function onFrequencyChanged() {
            frequency = radio.frequency
            frequency = frequency.toFixed(1)
            // console.log("The changed freq ",frequency)
            freqValue = (frequency<100)?radio.frequencyValConversion+"0":radio.frequencyValConversion
            // console.log("The changed freq ",frequency)
            trackerCursor.x = minSLiderValue+getFrequencyVal()
        }
    }
}
