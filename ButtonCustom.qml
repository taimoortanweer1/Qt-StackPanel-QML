import QtQuick 2.14
import QtQuick.Controls 2.14

Button {
    id: control
    font.pointSize: 15
    width: 250

    background: Rectangle {
        anchors.fill: parent
        color: control.hovered ? "#ffffff" : "transparent"
        //opacity: 1
        border.color: "#000000"
        border.width: 2


        Text {
            color: "#000000"
        }

    }


}

