import QtQuick 2.14
import QtQuick.Controls 2.14

Page {
    id:plus
    width: 1300
    height: 620
    title: qsTr("Introduction")
    signal incPage(var value)
    signal decPage(var value)

    Button {
        font.pointSize: 15
        width: 100
        y: 0
        x: parent.width * 0.5 - width/2

        background: Rectangle {
            anchors.fill: parent
            color: "transparent"
            opacity: 1

            Image { source: "images/back.png"; fillMode: Image.Stretch; anchors.fill: parent;  opacity: 1 }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                   plus.incPage(-1)
                }
            }
        }
    }

    background: Rectangle {
        anchors.fill: parent
        Image { source: "images/3.png"; fillMode: Image.Stretch; anchors.fill: parent;  opacity: 1 }
    }
}
