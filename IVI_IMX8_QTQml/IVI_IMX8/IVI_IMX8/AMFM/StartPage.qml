import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.VirtualKeyboard 2.15
import QtQuick.Window 2.15
import com.ivi.radio 1.0

Item {
    id:window
    // visible: true
    width: 1280
    height: 800
    property bool tuneSelected: false
    property bool tuneclicked: false
    property bool isPressed: false
    property bool plusSelected: false
    property bool minusSelected: false
    property bool skipPreviousSelected: false
    property bool skipNextSelected: false
    property bool favAddSelected: radio.favFrequency
    property bool stopSelected: false
    property bool stopDisabled: false
    property bool favSelected: false
    property bool favclicked: false

    property double frequency: radio.frequency
    property string freqValue: radio.frequencyValConversion
    property real minFreq: 87.5
    property real maxFreq: 108
    property real freqVal
    property real valTofreqConversion
    property int minSLiderValue : 414

    property string stnName: ""

    property int currentScreen: 1

    // Tune button
    Image {
        id: tunebutton
        source: tuneSelected ? "/Images/Radio/p_auto_text_tune_selected.svg" : (tuneclicked ? "/Images/Radio/p_auto_text_tune_clicked.svg" : "/Images/Radio/p_auto_text_tune.svg")
        width: 216
        height: 78
        x: 672
        y: 210

        MouseArea {
            id: tuneMouseArea
            anchors.fill: parent
            onPressed: {
                if (!tuneSelected) {
                    tuneclicked = true;
                }
            }
            onReleased: {
                if(!tuneSelected){
                    currentScreen = 2
                    tuneSelected = true;
                    tuneclicked=false;
                favSelected = false;
                }else if(tuneSelected){
                     favSelected=false;
                    favclicked=false;
                }
            }
        }
    }
    Image {
        id: favoriteButton
        source: favSelected ? "/Images/Radio/p_auto_text_favorite.svg" : (favclicked ? "/Images/Radio/p_auto_text_favorite_clicked.svg" : "/Images/Radio/p_auto_text_favorite_default.svg")
        width: 272
        height: 78
        x: 918
        y: 210
        visible: true

        MouseArea {
            id: favMouseArea
            anchors.fill: parent
            onPressed: {
                if (!favSelected) {
                    favclicked = true;
                }
            }
            onReleased: {
                if ( !favSelected) {
                    favSelected = true;
                    favclicked = false;
                    tuneSelected = false
                    currentScreen = 3
                } else if (favSelected) {
                    tuneSelected = false
                }
            }
        }
    }
    Image {
            id:tunedisabled
            source: "/Images/Radio/p_auto_text_single_tunedisable.svg"
            width: 216
            height: 78
            x: 672
            y: 210
            visible: stopDisabled
        }
        Image {
            id:favdisabled
            source: "/Images/Radio/p_auto_text_single_favdisable.svg"
            width: 272
            height: 78
            x: 918
            y: 210
            visible: stopDisabled
        }
    Image {
        id:textwarning
        source: "/Images/Radio/itm_WarningwithText.svg"
        width: 306
        height: 169
        x: 552
        y: 350
        visible: stopDisabled
    }
    Item {
        id: mainItem

        MainPage{
            visible: (currentScreen === 1)?true:false
        }
        Tunelist {
            visible: (currentScreen === 2)?true:false
        }
        Favlist {
            visible: (currentScreen === 3)?true:false
        }
    }

    Radio {
        id: radio
    }
    function getFrequencyVal() {
        frequency = radio.frequency.toFixed(1)
        freqVal = (frequency-minFreq)*27.85
        return freqVal
    }

    Connections{
        target: radio
        function onFrequencyChanged() {
            frequency = radio.frequency
            frequency = frequency.toFixed(1)
            freqValue = (frequency<100)?radio.frequencyValConversion+"0":radio.frequencyValConversion
        }
        function onFavFrequencyChanged() {
            favAddSelected = radio.favFrequency
        }
        function onStnNameChanged() {
            stnName = radio.stnName
        }
    }
}
