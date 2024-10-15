import QtQuick 2.12
import com.ivi.radio 1.0

Item {
    width: 1280
    height: 800
    property string stnName
    property bool playClicked: false
    property bool pauseState: false
    property bool favAdded: false
    property bool favClicked: false
    property bool repeatState: false
    property bool repeatClicked: false
    property bool shuffleClicked: false
    property bool skipPreviousSongSelected: false
    property bool skipNextSongSelected: false
    property bool stopClicked: false
    property bool stopdisabledState: false
    property int elapsedTime: 0
    property int totalTime: 10000
    property int maxEndPosition: 968
    property bool showRemovedFromFavImage: false
    property string selectedSongName: ""

    Timer {
        id: hideRemovedFromFavTimer
        interval: 3000
        running: false
        onTriggered: {
            showRemovedFromFavImage = false;
        }
    }

    Radio {
        id: radio
    }
    Image {
        id: bg
        source: "/Images/Music/BG.png"
        anchors.fill: parent
    }
    Image {
        id: songDetailBG
        source: "/Images/Music/song_details_background.svg"
        width: 554
        height: 405
        x: 438
        y: 143
    }
    Image {
        id: songDetail
        source: "/Images/Music/album_img.png"
        width: 554
        height: 276
        x: 438
        y: 143
    }
    Image {
        id: favIcon
        source: favAdded ? "/Images/Music/p_icon_48X48_fav_added.svg" : (favClicked ? "/Images/Music/p_icon_48X48_fav_add_clicked.svg" : "/Images/Music/p_icon_48X48_fav_add.svg")
        width: 48
        height: 48
        x: 445
        y: 588

        MouseArea {
            id: favclicked
            anchors.fill: parent
            onPressed: {
                if (!favAdded) {
                    favClicked = true;
                }
            }
            onReleased: {
                if (favClicked && !favAdded) {
                    favClicked = false;
                    favAdded = true;
                    showRemovedFromFavImage = false;
                } else if (favAdded) {
                    favClicked = false;
                    favAdded = false;
                    showRemovedFromFavImage = true;
                    hideRemovedFromFavTimer.restart();
                }
            }
        }
    }
    Image {
        source: "/Images/Music/removed_from_fav.svg"
        width: 629
        height: 50
        x: 396
        y: 15
        visible: showRemovedFromFavImage
    }
    Text {
        id: undo
        text: "Undo"
        font.pixelSize: 25
        color: Qt.rgba(34 / 255, 114 / 255, 167 / 255, 1)
        x: 946
        y: 22
        visible: showRemovedFromFavImage

        MouseArea {
            anchors.fill: parent
            onClicked: {
                favAdded = true;
                showRemovedFromFavImage = false;
                hideRemovedFromFavTimer.stop();
            }
        }
    }

    Image {
        id: repeatIcon
        source: repeatState ? "/Images/Music/p_icon_48X48_repeat_one.svg" : (repeatClicked ? "/Images/Music/p_icon_48X48_repeat_clicked.svg" : "/Images/Music/p_icon_48X48_repeat.svg")
        width: 48
        height: 48
        x: 568
        y: 588

        MouseArea {
            id: repeatclicked
            anchors.fill: parent
            onPressed: {
                if (!repeatState) {
                    repeatClicked = true;
                }
            }
            onReleased: {
                if (repeatClicked && !repeatState) {
                    repeatClicked = false;
                    repeatState = true;
                } else if (repeatState) {
                    repeatClicked = false;
                    repeatState = false;
                }
            }
        }
    }
    Image {
        id: playbutton
        source: pauseState ? "/Images/Music/p_icon_48X48_pause.svg" : (playClicked ? "/Images/Music/p_icon_48X48_play_clicked.svg" : "/Images/Music/p_icon_48X48_play.svg")
        width: 48
        height: 48
        x: 691
        y: 588

        MouseArea {
            id: playclicked
            anchors.fill: parent
            onPressed: {
                playClicked = !playClicked;
                if (playClicked) {
                    startProgressBarAnimation(20);
                } else {
                    progressBarTimer.stop();
                }
            }
            onReleased: {
                if (playClicked && !pauseState) {
                    pauseState = true;
                } else if (pauseState) {
                    pauseState = false;
                }
            }
        }
    }
    Image {
        id: shuffleIcon
        source: shuffleClicked ? "/Images/Music/p_icon_48X48_shuffle_active.svg" : "/Images/Music/p_icon_48X48_shuffle.svg"
        width: 48
        height: 48
        x: 814
        y: 588

        MouseArea {
            anchors.fill: parent
            onClicked: {
                shuffleClicked = !shuffleClicked;
            }
        }
        onSourceChanged: {
            isShuffleActive = source === "/Images/Music/p_icon_48X48_shuffle_active.svg";
        }
    }
    Image {
        id: stopIcon
        source: stopdisabledState ? "/Images/Music/p_icon_48X48_stop_disabled.svg" : (stopClicked ? "/Images/Music/p_icon_48X48_stop_clicked.svg" : "/Images/Music/p_icon_48X48_stop.svg")
        width: 48
        height: 48
        x: 937
        y: 588

        MouseArea {
            id: stopclicked
            anchors.fill: parent
            onPressed: {
                stopClicked = !stopClicked;
                if (stopClicked) {
                    stopdisabledState = true;
                } else {
                    stopdisabledState = false;
                }
            }
        }
    }
    Image {
        id: previousesong
        source: "/Images/Music/item_image2_150X150_previous_song.png"
        width: 150
        height: 150
        x: 228
        y: 385
    }
    Image {
        id: skipPreviousSong
        source: skipPreviousSongSelected ? "/Images/Music/p_icon_48X48_skip_previous_song_selected.svg" : "/Images/Music/p_icon_48X48_skip_previous_song.svg"
        width: 48
        height: 48
        x: 279
        y: 436
        MouseArea {
            anchors.fill: parent
            onPressed: {
                skipPreviousSongSelected = true;
            }
            onReleased: {
                skipPreviousSongSelected = false;
            }
        }
    }
    Image {
        id: skipNextsong
        source: skipNextSongSelected ? "/Images/Music/p_icon_48X48_skip_next_song_clicked.svg" : "/Images/Music/p_icon_48X48_skip_next_song.svg"
        width: 48
        height: 48
        x: 1103
        y: 436

        MouseArea {
            anchors.fill: parent
            onPressed: {
                skipNextSongSelected = true;

            }
            onReleased: {
                skipNextSongSelected = false;
            }
        }
    }
    Image {
        id: browseicon
        source: "/Images/Music/browse_icon.svg"
        width: 170
        height: 48
        x: 1096
        y: 103
        visible: true

        MouseArea {
            anchors.fill: parent
            onClicked: {
                  console.log(selectedSongName);
                 currentScreen = 1
            }
        }
    }
    Text {
        id: currentTimeText
        text: "0:00"
        font.bold: true
        font.pixelSize: 20
        color: "white"
        x: 267.77
        y: 756.72
    }
    Text {
        id: durationText
        text: "0:00"
        font.bold: true
        font.pixelSize: 20
        color: "white"
        x: 1122.79
        y: 756.72
    }
    Rectangle {
        width: 968
        height: 43
        x: 230
        y: 695
        radius: 20

        Rectangle {
            id: progressBar
            width: parent.width
            height: parent.height
            color: "white"
            radius: 20
        }
        Rectangle {
            id: progressIndicator
            width: progressWidth
            height: parent.height
            color: Qt.rgba(13/255, 71/255, 110/255, 1)
            radius: 20

            Behavior on width {
                NumberAnimation {
                    duration: progressBarTimer.running ? (totalTime - elapsedTime) * 0.2 : 0
                }
            }
        }
    }
    Text {
                id: displayedSongName
                text: selectedSongName
                font.bold: true
                font.pixelSize: 32
                color: "white"
                x:455
                y:444
            }
    Timer {
        id: progressBarTimer
        interval: 50
        repeat: true
        running: false

        onTriggered: {

            if (!pauseState) {
                elapsedTime += interval;
                progressWidth = calculateWidth();
                if (elapsedTime >= totalTime) {
                    elapsedTime = 0;
                    progressWidth = 0;
                }
            }
        }
    }
    property int progressWidth: 0

    function calculateWidth() {
        var startPosition = progressBar.x;
        var endPosition = progressBar.x + progressBar.width;
        var progress = (elapsedTime / totalTime);

        var calculatedWidth = startPosition + (endPosition - startPosition) * progress;
        calculatedWidth = Math.min(calculatedWidth, progressBar.width);
        calculatedWidth = Math.max(startPosition, calculatedWidth);
        return calculatedWidth;
    }
    function startProgressBarAnimation(interval) {
        progressBarTimer.interval = interval;
        progressBarTimer.running = true;
    }
}
