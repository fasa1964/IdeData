import QtQuick 2.0

Rectangle {
    id: delegate
    width: mainwindow.width
    height: android ? 105 : 95
    color: "transparent"
    border.color: "white"

    property bool tvisible: false

    FSwitchButton{
        id: onbutton
        width: android ? 70 : 55
        height: android ? 28 : 25
        textsize: android ? 14 :  10
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 5; anchors.rightMargin: 10
        onButtonState: {  tvisible = onState  }
    }

    FDataButton{
        id: changeButton
        width: onbutton.width   //android ? 70 : 55;
        height: onbutton.height // android ? 35 : 25
        imagesource: "qrc:/icons/Pencel.png"
        buttontext: ""
        anchors.top: onbutton.bottom
        anchors.right: parent.right
        anchors.topMargin: 5; anchors.rightMargin: 10
        buttonradius: 0
        onPressed: {

            changedata.name = name
            changedata.setText(login, password, url)
            changedata.visible = true
        }

    }

    FDataButton{
        id: webButton
        width: onbutton.width   //android ? 70 : 55;
        height: onbutton.height //android ? 35 : 25
        imagesource: "qrc:/icons/Web.png"
        buttontext: ""
        anchors.top: changeButton.bottom
        anchors.right: parent.right
        anchors.topMargin: 5; anchors.rightMargin: 10
        buttonradius: 0
        onPressed: {

            var valid = checkUrl(url)
            if(valid)
                Qt.openUrlExternally(url);
            else
                sendMessage("Error-Url", "Please ckeck web adress!\nUrl: "+url)
        }
    }

    Column{
        width: parent.width-10
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter
        spacing: 5
        x:5; y:5
        Row{
            spacing: 10
            Text { text: "Name:"; color: "white" }
            Text { text: name; color: "white"; font.bold: true }
        }
        Row{
            spacing: 10
            Text { text: "Login:"; color: "white" }
            Text { text: login; color: "white"; visible: tvisible }
        }
        Row{
            spacing: 10
            Text { text: "Paßwort:"; color: "white" }
            Text { text: password; color: "white"; visible: tvisible }
        }
        Row{
            spacing: 10
            Text { text: "Url:"; color: "white" }
            Text { text: url; color: "white"; visible: tvisible }
        }
    }
}

