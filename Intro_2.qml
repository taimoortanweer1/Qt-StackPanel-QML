import QtQuick 2.14
import QtQuick.Controls 2.14

Page {
    id: intro2
    width: 1300
    height: 620
    title: qsTr("Introduction")
    signal incPage(var value)
    signal decPage(var value)

    Button {
        id: control
        font.pointSize: 15
        width: 250
        y: parent.height - 100
        x: parent.width * 0.5 - 2 * width

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
                   intro2.incPage(-1)
                }
            }
        }
    }

    Button {
        id: control1
        font.pointSize: 15
        width: 250
        y: parent.height - 100
        x: parent.width * 0.5 - width / 2

        contentItem: Text {
                   color: control1.hovered ? "#000000" : "#ffffff"
                   text: qsTr("Plus de details")
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
                   intro2.incPage(1)
                }
            }
        }
    }

    Button {
        id: control2
        font.pointSize: 15
        width: 250
        y: parent.height - 100
        x: parent.width * 0.5 + width

        contentItem: Text {
                   color: control2.hovered ? "#000000" : "#ffffff"
                   text: qsTr("Suivants")
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
                   intro2.incPage(2)//logical increment + 1
                }
            }
        }
    }

    background: Rectangle {
        anchors.fill: parent
        Image { source: "images/2.png"; fillMode: Image.Stretch; anchors.fill: parent;  opacity: 1 }
    }
}
