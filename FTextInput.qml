import QtQuick 2.7

Item {
    width: 150
    height: 25

    property string dtext
    property string dtextcolor: "blue"
    property bool passw: false


    function setText(text){
        input.text = text+"";
    }

    function getText(){
        return input.displayText;
    }

    signal textIsChanging()

    Rectangle{
        color: "#e5e7e9"
        border.color: "#99a3a4"
        anchors.fill: parent

        TextInput{
            id: input
            width: parent.width-10
            font.pixelSize: android ? 22 : 18
            color: focus ? dtextcolor : "gray";
            echoMode: passw ? TextInput.Password : TextInput.Normal
            anchors.left: parent.left;
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            activeFocusOnPress: true
            clip: true
        }
    }

}
