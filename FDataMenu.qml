import QtQuick 2.0

Item {
    id: menucontrol
    width: parent.width-40
    height: 50
    x: parent.width

    signal infoSelect()
    signal settingsSelect()
    signal addItemSelect()
    signal quitApp()

    property bool quit: false

    function openMenu(){
        menucontrol.visible = true;
        menuopen.start();
    }

    function closeMenu(){
        menuclose.start();
    }

    // Menu-Animation
    NumberAnimation {
         id: menuopen
         target: menucontrol
         property: "x"
         duration: 750
         to: 0
         easing.type: Easing.InOutBack
     }

    NumberAnimation {
         id: menuclose
         target: menucontrol
         property: "x"
         duration: 750
         to: parent.width
         easing.type: Easing.InOutQuad
         onStopped: {
             menucontrol.visible = false
             if(quit)
                 Qt.quit();
         }
     }


    Rectangle{
        id: menurect
        width: parent.width
        height: 50
        color: "darkgray"
        border.color: "white"

        Row{
            height: parent.height
            width: parent.width
            x: 5; spacing: 5

            FDataButton{
                id: addButton
                width: (menurect.width / 4) - 5
                buttontext: ""
                imagesource: btndown ?  "qrc:/icons/AddDown.png" : "qrc:/icons/Add.png"
                anchors.verticalCenter: parent.verticalCenter
                onPressed: { addItemSelect() }
            }
            FDataButton{
                id: settingButton
                width: (menurect.width / 4) - 5
                buttontext: ""
                imagesource: btndown ?  "qrc:/icons/SettingsDown.png" : "qrc:/icons/Settings.png"
                anchors.verticalCenter: parent.verticalCenter
                onPressed: { settingsSelect() }
            }
            FDataButton{
                id: infoButton
                width: (menurect.width / 4) - 5
                buttontext: ""
                imagesource: btndown ?  "qrc:/icons/InfoDown.png" : "qrc:/icons/Info.png"
                anchors.verticalCenter: parent.verticalCenter
                onPressed: { infoSelect() }
            }
            FDataButton{
                id: closeButton
                width: (menurect.width / 4) - 5
                buttontext: ""
                imagesource: btndown ?  "qrc:/icons/AusDown.png" : "qrc:/icons/Aus.png"
                anchors.verticalCenter: parent.verticalCenter
                onPressed: { quitApp() }
            }
        }
    }
}
