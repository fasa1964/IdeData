import QtQuick 2.7
import QtQuick.Controls 2.2


Rectangle {
    id: fdatainfo
    width: parent.width
    height: parent.height
    color: backgroundcolor

    MouseArea{ anchors.fill: parent }

    // Title
    Rectangle{
        id: titlerect
        width: parent.width
        height: 45
        anchors.top: parent.top
        anchors.topMargin: 15
        color: "#dc7633"
        Text {
            text: "FData Information";
            color: "white";
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        FDataButton{
            id: close
            height: parent.height - 8
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            buttoncolor: "white"
            bordercolor: "white"
            textcolor: "white"
            buttontext: "<<"
            onPressed: { fdatainfo.visible = false }
        }
    }

    // FDataLicence Text
    Text{ text: "qrc:\\FDataLicenceText" }


}
