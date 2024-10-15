import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Controls 2.15
import QtMultimedia
import QtQuick.Layouts 1.15

Item {
    id: songpage
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

    function formatTime(milliseconds) {
        var totalSeconds = milliseconds / 1000;
        var minutes = Math.floor(totalSeconds / 60);
        var seconds = Math.floor(totalSeconds % 60);
        return minutes + ":" + (seconds < 10 ? "0" : "") + seconds;
    }

    AudioOutput {
        id: audioOutput
    }

    MediaPlayer {
        id: mediaPlayer
        property int currentSongIndex: 0
        property var songList: [
            "/MusicAssets/HarryStyles_AsItWas.mp3",
            "/MusicAssets/moveLikeJagger.mp3",
            "/MusicAssets/OneRepublic_IAintWorried.mp3",
            "/MusicAssets/TheKidLAROI_JustinBieber_Stay.mp3",
            "/MusicAssets/TheChainsmokers_Closer.mp3"
        ]
        source: songList[currentSongIndex]
        audioOutput: audioOutput

        onPositionChanged: {
            currentTimeText.text = formatTime(position);
        }

        onDurationChanged: {
            durationText.text = formatTime(duration);
        }
    }

    Item {
        width: 1280
        height: 800

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
            x: 394
            y: 143
        }
        Image {
            id: songDetail
            source: "/Images/Music/album_img.png"
            width: 554
            height: 276
            x: 394
            y: 143
        }
        Image {
            id: skipprevious
            source: skipPreviousSelected ? "/Images/Music/p_icon_48X48_skip_previous_clicked.svg" : "/Images/Music/p_icon_48X48_skip_previous.svg"
            width: 48
            height: 48
            x: 278
            y: 607

            Timer {
                id: rewindTimer
                interval: 1000
                repeat: true
                running: false
                onTriggered: {
                    mediaPlayer.position -= 5000;
                }
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    skipPreviousSelected = true;
                    rewindTimer.running = true;
                }
                onReleased: {
                    if (rewindTimer.running) {
                        mediaPlayer.position -= 5000;
                    }
                    rewindTimer.stop();
                    skipPreviousSelected = false;
                }
            }
        }
        Image {
            id: favIcon
            source: favAdded ? "/Images/Music/p_icon_48X48_fav_added.svg" : (favClicked ? "/Images/Music/p_icon_48X48_fav_add_clicked.svg" : "/Images/Music/p_icon_48X48_fav_add.svg")
            width: 48
            height: 48
            x: 401
            y: 607

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
                    } else if (favAdded) {
                        favClicked = false;
                        favAdded = false;
                    }
                }
            }
        }
        Image {
            id: repeatIcon
            source: repeatState ? "/Images/Music/p_icon_48X48_repeat_one.svg" : (repeatClicked ? "/Images/Music/p_icon_48X48_repeat_clicked.svg" : "/Images/Music/p_icon_48X48_repeat.svg")
            width: 48
            height: 48
            x: 524
            y: 607

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
            x: 647
            y: 602

            MouseArea {
                id: playclicked
                anchors.fill: parent
                onPressed: {
                    if (mediaPlayer.playbackState === MediaPlayer.PlayingState) {
                        mediaPlayer.pause();
                    } else {
                        playClicked = true;
                        mediaPlayer.play();
                    }
                }
                onReleased: {
                    if (playClicked && !pauseState) {
                        playClicked = false;
                        pauseState = true;
                    } else if (pauseState) {
                        playClicked = false;
                        pauseState = false;
                    }
                }
            }
        }
        Image {
            id: shuffleIcon
            source: "/Images/Music/p_icon_48X48_shuffle.svg"
            width: 48
            height: 48
            x: 770
            y: 607
        }
        Image {
            id: stopIcon
            source: stopdisabledState ? "/Images/Music/p_icon_48X48_stop_disabled.svg" : (stopClicked ? "/Images/Music/p_icon_48X48_stop_clicked.svg" : "/Images/Music/p_icon_48X48_stop.svg")
            width: 48
            height: 48
            x: 893
            y: 607

            MouseArea {
                id: stopclicked
                anchors.fill: parent
                onPressed: {
                    if (!stopdisabledState) {
                        stopClicked = true;
                    }
                }
                onReleased: {
                    if (stopClicked && !stopdisabledState) {
                        stopClicked = false;
                        stopdisabledState = true;
                    } else if (stopdisabledState) {
                        stopClicked = false;
                        stopdisabledState = false;
                    }
                }
            }
        }
        Image {
            id: skipNextIcon
            source: skipNextSelected ? "/Images/Music/p_icon_48X48_skip_nxt_clicked.svg" : "/Images/Music/p_icon_48X48_skip_nxt.svg"
            width: 48
            height: 48
            x: 1016
            y: 607

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    skipNextSelected = true;
                    rewindTimer.running = true;
                }
                onReleased: {
                    if (rewindTimer.running) {
                        mediaPlayer.position += 5000;
                    }
                    rewindTimer.stop();
                    skipNextSelected = false;
                }
            }
        }
        Image {
            id: previousesong
            source: "/Images/Music/item_image2_150X150_previous_song.png"
            width: 150
            height: 150
            x: 184
            y: 385
        }
        Image {
            id: skipPreviousSong
            source: skipPreviousSongSelected ? "/Images/Music/p_icon_48X48_skip_previous_song_selected.svg" : "/Images/Music/p_icon_48X48_skip_previous_song.svg"
            width: 48
            height: 48
            x: 235
            y: 436

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    skipPreviousSongSelected = true;
                    mediaPlayer.stop();
                    mediaPlayer.currentSongIndex = (mediaPlayer.currentSongIndex - 1 + mediaPlayer.songList.length) % mediaPlayer.songList.length; // Move to the previous song
                    mediaPlayer.source = mediaPlayer.songList[mediaPlayer.currentSongIndex];
                    mediaPlayer.play();
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
            x: 1059
            y: 436

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    skipNextSongSelected = true;
                    mediaPlayer.stop();
                    mediaPlayer.currentSongIndex = (mediaPlayer.currentSongIndex + 1) % mediaPlayer.songList.length;
                    mediaPlayer.source = mediaPlayer.songList[mediaPlayer.currentSongIndex];
                    mediaPlayer.play();
                }
                onReleased: {
                    skipNextSongSelected = false;
                }
            }
        }
        Image {
            id: backarrow
            source: "/Images/Music/p_icon_48X48_back_arrow.svg"
            width: 48
            height: 48
            x: 178
            y: 138
            visible: true

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    currentScreen = 1;
                }
            }
        }

        SongList {
            visible: currentScreen === 1
        }

        Text {
            id: currentTimeText
            text: "0:00"
            font.bold: true
            font.pixelSize: 20
            color: "white"
            x: 201
            y: 751
        }
        Text {
            id: durationText
            text: "0:00"
            font.bold: true
            font.pixelSize: 20
            color: "white"
            x: 1063
            y: 751
        }
        Rectangle {
            width: 968
            height: 43
            x: 201
            y: 694
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
                x: progressX()

                width: {
                    if (mediaPlayer.duration > 0) {
                        return (mediaPlayer.position / mediaPlayer.duration) * progressBar.width;
                    } else {
                        return 0;
                    }
                }
                height: parent.height
                color: Qt.rgba(13/255, 71/255, 110/255, 1)
                radius: 20

                Behavior on width {
                    NumberAnimation {
                        duration: 500
                    }
                }
                function progressX() {
                    return progressBar.x;
                }
            }
        }
        // SongList{
        //     visible: (currentScreen == 1)?true:false
        // }
    }
}
