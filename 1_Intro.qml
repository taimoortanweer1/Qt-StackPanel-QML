import QtQuick 2.14
import QtQuick.Controls 2.14


Page {
    width: 1300
    height: 620
    title: qsTr("Introduction")
    signal requestStackChange(var stack, var properties)

    Button {
        id: control
        font.pointSize: 15
        width: 250
        y: parent.height - 100
        x: parent.width * 0.5 - 1.5 * width

        contentItem: Text {
                   color: control.hovered ? "#000000" : "#ffffff"
                   text: qsTr("Retour")
                   font.pointSize: 15
                   horizontalAlignment: Text.AlignHCenter
                   verticalAlignment: Text.AlignVCenter
        }

        background: Rectangle {
            anchors.fill: parent
            color: control.hovered ? "#ffffff" : "transparent"
            border.color: "#ffffff"
            border.width: 2


            MouseArea {
                anchors.fill: parent
                onClicked: {
                   requestStackChange("0_SystemeForm.qml", {});
                }
            }
        }
    }

    Button {
        id: control1
        font.pointSize: 15
        width: 250
        y: parent.height - 100
        x: parent.width * 0.5 + width / 2

        contentItem: Text {
                   color: control1.hovered ? "#000000" : "#ffffff"
                   text: qsTr("Suivant")
                   font.pointSize: 15
                   horizontalAlignment: Text.AlignHCenter
                   verticalAlignment: Text.AlignVCenter
        }

        background: Rectangle {
            anchors.fill: parent
            color: control1.hovered ? "#ffffff" : "transparent"
            border.color: "#ffffff"
            border.width: 2


            MouseArea {
                anchors.fill: parent
                onClicked: {
                   requestStackChange("2_Intro-2.qml", {});
                }
            }
        }
    }

    background: Rectangle {
        anchors.fill: parent
        Image { source: "images/1.png"; fillMode: Image.Stretch; anchors.fill: parent;  opacity: 1 }
    }
}
