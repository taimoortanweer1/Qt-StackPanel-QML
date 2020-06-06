import QtQuick 2.14
import QtQuick.Controls 2.14


Page {

    id: intro1
    width: 1300
    height: 620
    title: qsTr("Introduction")

    signal incPage(var value)
    signal decPage(var value)

    background: Rectangle {
        anchors.fill: parent
        Image { source: "images/1.png"; fillMode: Image.Stretch; anchors.fill: parent;  opacity: 1 }
    }
}
