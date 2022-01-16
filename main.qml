import QtQuick 2.15
import QtQuick.Window 2.15
import QtQml 2.2
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

import fdatafile 1.0


Window {
    id: mainwindow
    width: 460
    height: 680
    visible: true
    title: qsTr("IdeData II")
    color: backgroundcolor


    Material.theme: Material.Dark
    Material.accent: Material.Purple

    property bool android: false
    property string backgroundcolor: "darkgray"


    function sendMessage(title, text){
        var message = Qt.createQmlObject ('MessageForm{}', mainwindow);
        message.title = title;
        message.message = text;
        message.openMessage();
    }

    function updateDatas(){
        datamodel.clear();
        var list = data.dataList();
        for(var i = 0; i < list.length; i++){
           datamodel.append({"name":list[i].name, "login":list[i].login,
                             "password":list[i].password, "url":list[i].url })
        }

    }


    // add datas to Model
    function addDatas(name, login, password, url){
        data.addData(name, login, password, url )
    }


    // Title for open or close the Mainmenu
    Rectangle{
        id: titlerect
        width: parent.width
        height: 50
        color: "transparent"
        border.color: "white"

        Image {
            id: image
            width: 110
            //height: 20
            fillMode:Image.PreserveAspectFit
            source: "qrc:/icons/IDE.png"
            x: parent.width/2 - image.width/2
            anchors.verticalCenter: parent.verticalCenter
        }

        FDataButton{
            id: menuBtn
            buttontext: ""
            imagesource: btndown ?  "qrc:/icons/MenuDown.png" : "qrc:/icons/Menu.png"
            height: parent.height
            width: 40
            bordercolor: "transparent"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right;
            onPressed: {  menu.visible ?  menu.closeMenu() : menu.openMenu()  }
        }
    }



    // Mainmenu
    FDataMenu{
        id: menu
        visible: false
        onInfoSelect: { info.visible = true; }
        onAddItemSelect: { inputform.visible = true }
        onQuitApp: { Qt.quit() }

    }

    // FDataInfo
    FDataInfo{ id: info; visible: false;/* width: parent.width*/ }

    // FDataInputForm
    FDataInputForm{
        id: inputform
        x: (parent.width - inputform.width) / 2
        y: 30
        visible: false
        onAcceptButtonClicked: {
            if(name === "")
            {
                sendMessage("Adding Item", "The Name has to be filled!.")
                return;
            }

            if(data.nameExist(name))
            {
                sendMessage("Adding Item", "Item already exist. Delete first the old Item!")
                return;
            }

            addDatas(name, login, password, url)
            inputform.visible = false;
            updateDatas();
        }

        onCancelButtonClicked: { inputform.visible = false }
    }

    // C++ connecting with
    FDataFile{
        id: data
        onErrorFileData: { sendMessage("File Error", errorMessage)  }
    }


    // ListView datas
    ListModel{ id: datamodel  }
    ListView{
        id: dataview
        visible: true
        width: parent.width
        height: parent.height - titlerect.height
        anchors.top: titlerect.bottom
        anchors.left: parent.left
        clip: true; spacing: 5
        model: datamodel
        delegate: FDelegateView{/*width: parent.width*/}
    }



    Component.onCompleted: {

        if(Qt.platform.os == "android")
            android = true;

        data.loadData();
        updateDatas();
    }
}
