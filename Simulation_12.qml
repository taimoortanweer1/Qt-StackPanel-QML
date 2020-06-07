import QtQuick 2.14
import QtQuick.Controls 2.14


Page {
    id:simu
    width: 1300
    height: 620
    title: qsTr("Simulation")
    signal incPage(var value)
    signal decPage(var value)
    Button {
        id: control
        font.pointSize: 13
        width: 200
        y: parent.height - 200
        x: parent.width * 0.5 - 1.75 * width

        contentItem: Text {
                   color: control.hovered ? "#000000" : "#ffffff"
                   text: qsTr("Communication \n avion-avion")
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

                   simu.incPage(1)
                }
            }
        }
    }

    Button {
        id: control1
        font.pointSize: 13
        width: 200
        y: parent.height - 200
        x: parent.width * 3 / 4 - width * 0.75

        contentItem: Text {
                   color: control1.hovered ? "#000000" : "#ffffff"
                   text: qsTr("Communication \n avion-sol")
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
                   simu.incPage(2)


                }
            }
        }
    }

    background: Rectangle {
        anchors.fill: parent
        Image { source: "images/9.png"; fillMode: Image.Stretch; anchors.fill: parent;  opacity: 1 }
    }
}
