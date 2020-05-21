import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.13

Page {
    width: 1366
    height: 768
    title: qsTr("Communication avion-avion")
    signal requestStackChange(var stack, var properties)

    background: Rectangle {
        anchors.fill: parent
        Image { source: "images/10.png"; fillMode: Image.Stretch; anchors.fill: parent;  opacity: 1 }
    }

    Rectangle {

        width: 450
        height: 200
        color: "#7fa3f1"
        x: parent.width / 2 - width/2
        y: 50
        opacity: 0.7


        GridLayout {
                 id: grid
                 anchors.fill: parent
                 columns: 5
                 rows: 3


                 Text { text: "Active";   Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter; }
                 Text { Layout.columnSpan: 2; text: "" ;   Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter; }
                 Text { text: "Standby";   Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter; }


                 SpinBox { value: 200 ;   Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter; }
                 Switch { text: "Channel";   Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter; }
                 SpinBox { value: 300 ;   Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter; }

                 RoundButton { text: "VHF1";   Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter; }
                 RoundButton { text: "VHF2"; Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter; }
                 RoundButton { text: "VHF3";  Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter; }
                 RoundButton { text: "HF1";   Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter; }
                 RoundButton { text: "HF2"; Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter; }
                 SpinBox { value: 3;  Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter; }

            }
    }
}

