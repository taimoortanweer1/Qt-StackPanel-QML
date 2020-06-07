import QtQuick 2.14
import QtQuick.Controls 2.14

Page {

    id: emit_recep
    width: 1300
    height: 620
    title: qsTr("Émetteur-Récepteur")
    signal incPage(var value)
    signal decPage(var value)

    Button {
        id: control
        font.pointSize: 15
        width: 250
        y: parent.height - 80
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
                   emit_recep.incPage(-1)
                }
            }
        }
    }

    Button {
        id: control1
        font.pointSize: 15
        width: 250
        y: parent.height - 80
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
                   emit_recep.incPage(3)
                }
            }
        }
    }
    Button {
        id: control2
        font.pointSize: 15
        width: 250
        y: parent.height * 0.5 - height
        x: parent.width - 1.5 * width

        contentItem: Text {
                   color: control2.hovered ? "#000000" : "#ffffff"
                   text: qsTr("Emitteur")
                   font.pointSize: 15
                   horizontalAlignment: Text.AlignHCenter
                   verticalAlignment: Text.AlignVCenter
        }

        background: Rectangle {
            anchors.fill: parent
            color: control2.hovered ? "#ffffff" : "transparent"
            border.color: "#ffffff"
            border.width: 2



            MouseArea {
                anchors.fill: parent
                onClicked: {
                   emit_recep.incPage(1)
                }
            }
        }
    }

    Button {
        id: control3
        font.pointSize: 15
        width: 250
        y: parent.height * 0.5 + height
        x: parent.width - 1.5 * width


        contentItem: Text {
                   color: control3.hovered ? "#000000" : "#ffffff"
                   text: qsTr("Recepteur")
                   font.pointSize: 15
                   horizontalAlignment: Text.AlignHCenter
                   verticalAlignment: Text.AlignVCenter
        }

        background: Rectangle {
            anchors.fill: parent
            color: control3.hovered ? "#ffffff" : "transparent"
            border.color: "#ffffff"
            border.width: 2


            MouseArea {
                anchors.fill: parent
                onClicked: {
                   emit_recep.incPage(2)
                }
            }
        }
    }
    background: Rectangle {
        anchors.fill: parent
        Image { source: "images/4.png"; fillMode:Image.Stretch; anchors.fill: parent;  opacity: 1 }
    }
}
