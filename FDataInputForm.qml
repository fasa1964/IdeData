import QtQuick 2.7

Item {
    id: inputcontrol
    width: parent.width-30
    height: 250
    z:2

    MouseArea{  anchors.fill: parent }

    signal acceptButtonClicked()
    signal cancelButtonClicked()
    property string name
    property string login
    property string password
    property string url



    Rectangle{
        id: mainrect
        anchors.fill: parent
        color: "lightgray"
        border.color: "#34495e"
        radius: 5

        // Title
        Rectangle{
            id: titlerect
            width: parent.width-2
            height: 30
            anchors.top: parent.top
            anchors.topMargin: 15
            color: "transparent"
            x:1

            Rectangle{
                id:line1;
                width: caption.width + 40; height: 1; color: "blue"
                x: parent.width/2 - line1.width/2 //anchors.verticalCenter: parent.verticalCenter
                anchors.bottom: caption.top
            }

            Text {
                id: caption
                text: "Input";
                color: "blue";
                font.bold: true
                font.pixelSize: android ? 22 : 18
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            Rectangle{
                id:line2;
                width: caption.width + 40; height: 1; color: "blue"
                x: parent.width/2 - line1.width/2 //anchors.verticalCenter: parent.verticalCenter
                anchors.top: caption.bottom
            }


        }

        Rectangle{
            id: inputrect
            width: parent.width
            anchors.top: titlerect.bottom
            anchors.topMargin: 10
            //color: "lightgrey"

            Grid{
                anchors.horizontalCenter: parent.horizontalCenter
                columns: 2
                spacing: 10
                Text{text: "Name:"; font.pixelSize: android ? 20 : 16  ;anchors.verticalCenter: parent.Center}
                FTextInput{ id: sname; width: inputrect.width/2 }
                Text{text: "Login:"; font.pixelSize: android ? 20 : 16  ;anchors.verticalCenter: parent.Center}
                FTextInput{ id: slogin; width: inputrect.width/2 }
                Text{text: "Password:"; font.pixelSize: android ? 20 : 16  ;anchors.verticalCenter: parent.Center}
                FTextInput{ id: spassword; width: inputrect.width/2 }
                Text{text: "Url:"; font.pixelSize: android ? 20 : 16  ;anchors.verticalCenter: parent.Center}
                FTextInput{ id: surl; width: inputrect.width/2 }

            }
        }

        Row{
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.margins: 5
            spacing: 5

            FDataButton{
                buttontext: "";
                imagesource: "qrc:/icons/Cancel.png";
                buttondowncolor: "#34495e"
                bordercolor: "gray";
                onPressed: { cancelButtonClicked() }
            }

            FDataButton{
                buttontext: "";
                imagesource: "qrc:/icons/Ok.png"
                buttondowncolor: "#34495e"
                bordercolor: "gray"
                onPressed: {
                        name = sname.getText();
                        login = slogin.getText();
                        password = spassword.getText();
                        url = surl.getText();
                        acceptButtonClicked();
                }
            }
        }

    }

}
