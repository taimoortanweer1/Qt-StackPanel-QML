import QtQuick 2.4
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls 2.13

Page {
    width: 700
    height: 550
    property alias button: button
    property alias element: element

    property alias comboBox6: comboBox6
    property alias textArea: textArea
    //modal: Qt.WindowModal
    x: 100
    y: 0

    property alias comboBox10: comboBox10
    visible: true

    Rectangle {
        id: rectangle
        width: 600
        height: 550
        color: "#ffffff"
        transformOrigin: Item.Right
        anchors.rightMargin: 0
        anchors.bottomMargin: -1
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
        border.width: 2
        border.color: "#000000"

        Frame {
            id: frame
            width: 600
            height: 169
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.top: parent.top
            anchors.topMargin: 11

            Label {
                id: label5
                x: 420
                y: 70
                width: 240
                height: 40
                text: qsTr("Wake Turbulence")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Label {
                id: label4
                x: 210
                y: 70
                width: 186
                height: 40
                text: qsTr("Type of Aircraft")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Label {
                id: label3
                x: 29
                y: 70
                width: 140
                height: 40
                text: qsTr("Number")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            ComboBox {
                id: comboBox5
                x: 420
                y: 104
                width: 240
                height: 40
                model: ["Light (L)", "Medium (M)", "Heavy (H)", "Jumbo (J)"]
            }

            ComboBox {
                id: comboBox4
                x: 210
                y: 104
                width: 186
                height: 40

                model: ["Statesman (100)", "Statesman (200)", "BAE-146-300", "Sioux", "UH-13R", "Bell 47", "Stratofortress", "Mercurey", "BA-607", "707-100", "J-Stars", "Business Express"]
            }

            ComboBox {
                id: comboBox3
                x: 29
                y: 104

                model: ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
            }

            Label {
                id: label2
                x: 420
                width: 240
                height: 40
                text: qsTr("Type of Flight")
                anchors.top: parent.top
                anchors.topMargin: -6
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Label {
                id: label1
                x: 209
                y: -6
                width: 187
                height: 40
                text: qsTr("Flight Rules")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Label {
                id: label
                x: 28
                y: -6
                width: 140
                height: 40
                text: qsTr("Aircraft Identification")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Rectangle {
                border.width: 1
                border.color: "black"
                width: 140
                height: 40
                x: 28
                y: 24

                TextField {
                    id: textField1
                    x: 0
                    y: 0
                    width: 140
                    height: 40
                    text: qsTr("CNA - 234")
                }
            }

            ComboBox {
                id: comboBox6
                x: 209
                y: 24
                width: 187
                height: 40

                model: ["IFR Instrument Flight", "VFR Visual Flight", "IFR -> VFR ", "VFR -> IFR"]
            }

            ComboBox {
                id: comboBox11
                x: 420
                y: 24
                width: 240
                height: 40
                model: ["S : Scheduled Air Transport", "N : Non Scheduled Air Transport", "G : General Aviation", "M : Military", "X : Other"]
            }
        }

        Frame {
            id: frame1
            x: 1
            y: 0
            width: 600
            height: 152
            anchors.right: parent.right
            anchors.top: frame.bottom

            Label {
                id: label7
                x: 209
                y: 59
                width: 188
                height: 40
                text: qsTr("Level")
                anchors.right: parent.right
                anchors.rightMargin: 263
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Label {
                id: label8
                y: 59
                width: 140
                height: 40
                text: qsTr("Cruising Speed (Km/h)")
                anchors.left: parent.left
                anchors.leftMargin: 28
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            ComboBox {
                id: comboBox7
                x: 209
                y: 92
                width: 188
                height: 40
                anchors.right: parent.right
                anchors.rightMargin: 263
                model: [20000, 25000, 30000, 35000, 40000, 45000]
            }

            ComboBox {
                id: comboBox8
                y: 92
                anchors.left: parent.left
                anchors.leftMargin: 28
                model: [400, 500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500]
            }

            Label {
                id: label9
                x: 421
                y: -10
                width: 140
                height: 40
                text: qsTr("Departure Time")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                Tumbler {
                    id: tumbler
                    x: 8
                    y: 47
                    width: 38
                    height: 92
                    hoverEnabled: false
                    spacing: 0
                    wrap: true
                    font.bold: true
                    font.pointSize: 15
                    model: 13
                }

                Tumbler {
                    id: tumbler1
                    x: 52
                    y: 47
                    width: 38
                    height: 92
                    font.pointSize: 15
                    model: 60
                    font.bold: true
                }

                Tumbler {
                    id: tumbler2
                    x: 96
                    y: 47
                    width: 51
                    height: 92
                    font.pointSize: 15
                    model: ["AM", "PM"]
                    font.bold: true
                }
            }

            Label {
                id: label10
                x: 209
                y: -10
                width: 188
                height: 40
                text: qsTr("Departure Aerodrome")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Label {
                id: label11
                x: 28
                y: -10
                width: 140
                height: 40
                text: qsTr("Equipment")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            ComboBox {
                id: comboBox10
                x: 209
                y: 21
                width: 188
                height: 40

                model: ["Take-off alternate", "En-route alternate", "Destination alternate"]
            }

            ComboBox {
                id: comboBox9
                x: -4
                y: 21
                model: ["S - Standard", "B - LPV", "C - LORAN C", "D - DME", "T - TACAN", "U - UHF", "X - MNPS", "M1", "M2", "M3"]
                anchors.left: parent.left
                anchors.leftMargin: 28
            }
            anchors.topMargin: 8
            anchors.leftMargin: 8
            anchors.left: parent.left
            anchors.rightMargin: 8
        }

        Frame {
            id: frame2
            x: 8
            y: 364
            width: 600
            height: 180
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 7
            anchors.top: frame1.bottom
            anchors.right: parent.right

            Label {
                id: label16
                x: 0
                width: 658
                height: 21
                text: qsTr("Route")
                anchors.top: parent.top
                anchors.topMargin: 0
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Rectangle {
                id: rectangle1
                y: 27
                height: 107
                color: "#ffffff"
                border.width: 1
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 40
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0

                TextArea {
                    id: textArea
                    text: qsTr("Text Area")
                    anchors.fill: parent
                }
            }

            Button {
                id: button
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0

                Text {
                    id: element
                    text: qsTr("Envoyer")
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }
            anchors.topMargin: 6
            anchors.leftMargin: 8
            anchors.left: parent.left
            anchors.rightMargin: 8
        }
    }
}
