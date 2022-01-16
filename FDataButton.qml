import QtQuick 2.0

Item {
    id: button
    implicitWidth: 80
    implicitHeight: 35

    MouseArea{ anchors.fill: parent }

    property string buttoncolor: "white"
    property string bordercolor: "white"
    property string buttondowncolor: "red"
    property string backgroundcolor: "transparent"
    property string buttontext: "?"
    property string textcolor: "white"
    property real textsize: android ? 14 : 10
    property string imagesource: ""
    property bool btndown: false
    property bool bold: false
    property real bopacity: 1.0
    property real buttonradius: 5

    property real  imageopacity: 1.0

    signal pressed()


    Rectangle{
        id: buttonrect
        width: parent.width
        height: parent.height
        color: backgroundcolor
        border.color: btndown ? buttondowncolor : bordercolor
        radius: buttonradius
        opacity: bopacity

        Image {
            id: picture
            width: parent.width-10
            height: parent.height-10
            source: imagesource
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
            antialiasing: true
            smooth: true
            opacity: imageopacity
            z:2
        }


        Text{
            text: buttontext
            anchors.centerIn: parent
            color: btndown ? buttondowncolor : textcolor
            font.bold: bold
            font.pointSize: textsize
        }

        MouseArea{
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton
            onPressed: {  btndown = true }
            onReleased: { btndown = false; button.pressed() }
        }
    }

}
