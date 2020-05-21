import QtQuick 2.14
import QtQuick.Controls 2.14


Page {
    width: 1366
    height: 768
    title: qsTr("Simulation")
    signal requestStackChange(var stack, var properties)

    Button {
        id: control
        text: qsTr("Communication avion-avion")
        font.pointSize: 13
        width: 250
        y: parent.height * 0.8
        x: parent.width * 0.5 - 1.5 * width

        background: Rectangle {
            anchors.fill: parent
            color: "#f9c5bd"
            opacity: enabled ? 1 : 0.3
            border.color: control.hovered ? "#1dbab4" : "#21be2b"
            border.width: 1
            radius: 10


            MouseArea {
                anchors.fill: parent
                onClicked: {
                   requestStackChange("10_com_avion.qml", {});
                }
            }
        }
    }

    Button {
        id: control1
        text: qsTr("Communication avion-sol")
        font.pointSize: 13
        width: 250
        y: parent.height * 0.8
        x: parent.width * 0.5 + width / 2

        background: Rectangle {
            anchors.fill: parent
            color: "#f9c5bd"
            opacity: enabled ? 1 : 0.3
            border.color: control.hovered ? "#1dbab4" : "#21be2b"
            border.width: 1
            radius: 10


            MouseArea {
                anchors.fill: parent
                onClicked: {
                   requestStackChange("11_com_sol.qml", {});
                }
            }
        }
    }

    background: Rectangle {
        anchors.fill: parent
        Image { source: "images/9.png"; fillMode: Image.Stretch; anchors.fill: parent;  opacity: 1 }
    }
}
