import QtQuick 2.0

Item {
    id: control
    width: 120
    height: 48

    MouseArea{ anchors.fill: parent }

    property bool onState: false
    property real textsize: 30
    signal buttonState()


    Rectangle{
        id: mainrect
        width: parent.width
        height: parent.height
        gradient: Gradient{
            GradientStop { position: 0.0; color: "#787878" }
            GradientStop { position: 0.3; color: onState ? "#00ffff" : "#A8A8A8" }
        }

        Rectangle{
            id: sliderect
            width: mainrect.width/2
            height: parent.height
            color: "white"
            border.color: "#A8A8A8"

            onXChanged: {
                if(x >= sliderect.width)
                {
                    if(!onState){
                        onState = true;
                        buttonState(onState);
                    }

                }
                if(x < sliderect.width/2)
                {
                    if(onState){
                        onState = false;
                        buttonState(onState);
                    }
                }
            }

            Text{
                id: statustext
                text: onState ? "on" : "off"
                color: onState ? "#00ffff" : "#787878"
                anchors.centerIn: parent
                font.pointSize: textsize
            }

            MouseArea{
                anchors.fill: parent
                drag.target: sliderect
                drag.axis: Drag.XAxis
                drag.minimumX: 0
                drag.maximumX: mainrect.width - sliderect.width
                onPressed: {
//                    if(!onState)
//                        sliderect.x = mainrect.width - sliderect.width
                }
            }
        }
    }
}
