import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Styles 1.4

Page {
    width: 1366
    height: 768
    title: qsTr("Acceuil")
    signal requestStackChange(var stack, var properties)
    Button {
        id: control
        text: qsTr("Découvrir le système")
        font.pointSize: 15

        y: parent.height * 0.8
        x: parent.width * 0.5 - width / 2
        width: 250


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
                   requestStackChange("0_SystemeForm.qml", {});
                }
            }
        }
    }
    background: Rectangle {
        anchors.fill: parent
        Image { source: "images/Home.png"; fillMode: Image.Stretch; anchors.fill: parent;  opacity: 1 }
    }
}
