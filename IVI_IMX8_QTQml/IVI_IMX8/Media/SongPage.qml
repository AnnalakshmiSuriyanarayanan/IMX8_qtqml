import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Controls 2.15
import QtMultimedia 5.15
import QtQuick.Layouts 1.15

Item {
    property bool playClicked: false
    property bool pauseState: false
    property bool skipPreviousSelected: false
    property bool skipNextSelected: false
    property bool stopdisabledState: false
    property bool stopClicked: false
    property bool repeatState: false
    property bool repeatClicked: false
    property bool skipNextSongSelected: false
    property bool skipPreviousSongSelected: false
    property bool favAdded: false
    property bool favClicked: false
    property real colorFillProgress: 0
    property int currentScreen: 2
    property bool isShuffleActive: false
    property string songName:""


    function formatTime(milliseconds) {
        var totalSeconds = milliseconds / 1000;
        var minutes = Math.floor(totalSeconds / 60);
        var seconds = Math.floor(totalSeconds % 60);
        return minutes + ":" + (seconds < 10 ? "0" : "") + seconds;
    }
    Item {
        id: screenswap
        SongList {
            visible: (currentScreen === 1)? true: false
        }
        MediaFrontPage {
            visible: (currentScreen === 2)? true: false
        }
    }
}
