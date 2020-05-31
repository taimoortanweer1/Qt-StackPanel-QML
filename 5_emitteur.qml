import QtQuick 2.14
import QtQuick.Controls 2.14

Page {
    width: 1300
    height: 620
    title: qsTr("Émetteur-Récepteur")
    signal requestStackChange(var stack, var properties)

    background: Rectangle {
        anchors.fill: parent
        Image { source: "images/5.png"; fillMode: Image.Stretch; anchors.fill: parent;  opacity: 1 }
    }
}
