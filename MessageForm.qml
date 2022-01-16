import QtQuick 2.0

Item {
    id: messagecontrol
    width: parent.width-30
    height: messagetext.paintedHeight + 60 + titlerect.height
    x: parent.width+100
    y: parent.height/2 - messagecontrol.height/2 - 80
    z:2

    property string title
    property string message
    property int sec: 0
    property int counter: 0

    // Colors
    property string textColor: "#319ff7"
    property string borderColor: "#319ff7"
    property string titleRectColor: "#319ff7"
    property string titleTextColor: "white"
    property string buttonColor: "white"
    property string backgroundColor: "white"


    function openMessage(){
        messagecontrol.visible = true;
        messageanim.start();
    }

    // Menu animation
    NumberAnimation {
        id: messageanim
        target: messagecontrol
        property: "x"
        duration: 750
        to: parent.width/2 - (messagecontrol.width/2)
        easing.type: Easing.InOutBack
    }


    MouseArea{ anchors.fill: parent }

    Rectangle{
        id: controlrect
        width: parent.width
        height: parent.height
        color: backgroundColor
        border.color: borderColor

        // Title
        Rectangle{
            id: titlerect
            width: parent.width
            height: 45
            anchors.top: parent.top
            anchors.topMargin: 20
            color: titleRectColor

            Text {
                text: title
                color: titleTextColor
                anchors.centerIn: parent
                font.bold: true
            }

            FDataButton{
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 5
                buttontext: "<<"
                textcolor: buttonColor
                bordercolor: buttonColor
                onPressed: { messagecontrol.visible = false }
            }
        }

        Rectangle{
            id: messagerect
            width: parent.width - 20
            height: parent.height - titlerect.height - 20
            anchors.top: titlerect.bottom
            anchors.topMargin: 10
            color: "transparent"
            x: 10
            Text{
                id: messagetext
                text: message
                color: textColor
                width: parent.width
                height: parent.height
                anchors.centerIn: parent
                wrapMode: Text.WordWrap
            }
        }
    }


    Component.onCompleted: {
        messageanim.start();
    }
}
