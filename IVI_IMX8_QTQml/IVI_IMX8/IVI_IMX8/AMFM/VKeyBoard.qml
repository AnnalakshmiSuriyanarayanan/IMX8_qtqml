import QtQuick 2.15
import QtQuick.VirtualKeyboard 1.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Item {
    id: keyBoarditem
    width: 1280
    height: 800
    visible: true
    Image {
        id: name
        anchors.fill: parent
        source: "/Images/Radio/Rectangle 373.svg"
        z : 10
        TextField {
            id:password_box
            // anchors.top: inputPanel.top
            width:1280
            height:75
            y:325
            visible : true
            z:10
            text:""
            focus: true
            Keys.onReleased:{
                if (event.key === Qt.Key_Return)
                {
                    event.accepted=true
                    isvkey = false
                    password_box.text = ""
                }
            }
        }
        InputPanel
        {
            id:inputPanel
            visible:name.visible
            focus: true
            anchors.fill: inputPanel
            width: 1280
            height: 500
            y:300
        }
    }
    Component.onCompleted: {
        // inputPanel.visible = true
    }
}
