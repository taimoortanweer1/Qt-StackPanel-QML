import QtQuick 2.14
import QtQuick.Controls 2.14

Page {
    width: 1300
    height: 620
    title: qsTr("Introduction")
    signal requestStackChange(var stack, var properties)

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
                   requestStackChange("1_Intro.qml", {});
                }
            }
        }
    }

    background: Rectangle {
        anchors.fill: parent
        Image { source: "images/3.png"; fillMode: Image.Stretch; anchors.fill: parent;  opacity: 1 }
    }
}
