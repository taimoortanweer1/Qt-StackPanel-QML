import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Styles 1.4


Page {

    id: home
    width: 1300
    height: 620
    title: qsTr("Acceuil")
    signal incPage(var value)
    signal decPage(var value)


    Button {
        id: control
        text: qsTr("Découvrir le système")
        font.pointSize: 15

        y: parent.height * 0.8
        x: parent.width * 0.5 - width / 2
        width: 250


        background: Rectangle {
            anchors.fill: parent
            color: control.hovered ? "#ffffff" : "transparent"
            border.color: "#000000"
            border.width: 2

            Text {
                color: "#000000"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    home.incPage(1)
                }
            }
        }
    }
    background: Rectangle {
        anchors.fill: parent
        Image { source: "images/Home.png"; fillMode: Image.Stretch; anchors.fill: parent;  opacity: 1 }
    }
}
