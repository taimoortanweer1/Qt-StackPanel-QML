import QtQuick 2.14
import QtQuick.Controls 2.14


Page {
    id: aide
    width: 1300
    height: 620
    title: qsTr("Aide")
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
                   aide.incPage(-1)
                }
            }
        }
    }


    background: Rectangle {
        anchors.fill: parent
        Image { source: "images/18.png"; fillMode: Image.Stretch; anchors.fill: parent;  opacity: 1 }
    }
}
