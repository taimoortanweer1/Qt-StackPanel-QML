import QtQuick 2.4
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls 2.13

Item {
    width: 1300
    height: 620
    property alias buttonAide: buttonAide
    property alias textFieldRX2: textFieldRX2
    property alias sliderAV2: sliderAV2
    property alias rectangleLED3: rectangleLED3
    property alias buttonDemarr: buttonDemarr
    property alias sliderAV3: sliderAV3
    property alias textFieldRX1: textFieldRX1
    property alias textFieldTX1: textFieldTX1
    property alias textFieldTX2: textFieldTX2
    property alias textFieldRX3: textFieldRX3
    property alias textFieldTX3: textFieldTX3
    property alias roundButtonUHF: roundButtonUHF
    property alias dialvolume: dialvolume
    property alias switchAS: switchAS
    property alias spinBoxStandByF: spinBoxStandByF
    property alias spinBoxActiveF: spinBoxActiveF
    property alias roundButtonVHF: roundButtonVHF
    property alias rectangleLED1: rectangleLED1
    property alias rectangleLED2: rectangleLED2
    property alias sliderAV1: sliderAV1
    property alias switchOnOff: switchOnOff
    property alias sliderAVSelect: sliderAVSelect

    Rectangle {
        id: rectangle
        color: "#ffffff"
        transformOrigin: Item.Right
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent

        Image {
            id: image
            anchors.fill: parent
            fillMode: Image.Stretch
            source: "images/10.png"

            Rectangle {
                id: rectangle1
                x: 494
                y: 171
                width: 404
                height: 264
                color: "#073685"
                radius: 20
                opacity: 0.6
                anchors.verticalCenterOffset: -151
                anchors.verticalCenter: parent.verticalCenter
                border.width: 0

                Label {
                    id: label
                    y: 27
                    height: 21
                    color: "#f9f9f9"
                    text: qsTr("Active")
                    anchors.right: parent.right
                    anchors.rightMargin: 243
                    anchors.left: parent.left
                    anchors.leftMargin: 90
                }

                Label {
                    id: label1
                    x: 243
                    y: 27
                    width: 69
                    height: 21
                    color: "#f9f9f9"
                    text: qsTr("Standby")
                }

                SpinBox {
                    id: spinBoxActiveF
                    y: 48
                    anchors.right: parent.right
                    anchors.rightMargin: 253
                    anchors.left: parent.left
                    anchors.leftMargin: 27
                    scale: 0.7
                    value: 100
                    stepSize: 1
                    to: 200
                    from: 80
                    font.pointSize: 11
                    wheelEnabled: true
                }

                SpinBox {
                    id: spinBoxStandByF
                    x: 221
                    y: 48
                    enabled: false
                    anchors.leftMargin: 58
                    from: 80
                    stepSize: 1
                    to: 200
                    value: 100
                    font.pointSize: 11
                    scale: 0.7
                    wheelEnabled: true
                }

                Switch {
                    id: switchAS
                    x: 147
                    y: 48
                    text: qsTr("")
                    checked: false
                }

                Dial {
                    id: dialvolume
                    x: 316
                    y: 105
                    width: 73
                    height: 56
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    inputMode: Dial.Horizontal
                    value: 4
                    stepSize: 1
                    to: 10
                    from: 0
                }

                Switch {
                    id: switchOnOff
                    x: 286
                    y: 220
                    width: 118
                    height: 40
                    text: qsTr("On/Off")
                    font.pointSize: 9
                    font.bold: true
                    checked: false
                    checkable: true
                    display: AbstractButton.TextBesideIcon
                }

                Slider {
                    id: sliderAVSelect
                    x: 155
                    y: 120
                    width: 94
                    height: 40
                    stepSize: 5
                    to: 0
                    from: 10
                    snapMode: Slider.SnapAlways
                    value: 0
                }

                Label {
                    id: label2
                    x: -4
                    y: 164
                    height: 21
                    color: "#f9f9f9"
                    text: qsTr("Volume")
                    anchors.left: parent.left
                    anchors.rightMargin: 21
                    anchors.leftMargin: 328
                    anchors.right: parent.right
                }

                Label {
                    id: label3
                    x: -12
                    y: 159
                    height: 21
                    color: "#f9f9f9"
                    text: qsTr("AV1")
                    anchors.left: parent.left
                    anchors.rightMargin: 127
                    anchors.leftMargin: 242
                    anchors.right: parent.right
                }

                Label {
                    id: label4
                    x: -10
                    y: 100
                    height: 21
                    color: "#f9f9f9"
                    text: qsTr("AV2")
                    anchors.left: parent.left
                    anchors.rightMargin: 185
                    anchors.leftMargin: 184
                    anchors.right: parent.right
                }

                Label {
                    id: label5
                    x: -10
                    y: 159
                    height: 21
                    color: "#f9f9f9"
                    text: qsTr("AV3")
                    anchors.left: parent.left
                    anchors.rightMargin: 234
                    anchors.leftMargin: 135
                    anchors.right: parent.right
                }

                Label {
                    id: label6
                    x: -2
                    y: 32
                    height: 21
                    color: "#f9f9f9"
                    text: qsTr("A/S")
                    anchors.left: parent.left
                    anchors.rightMargin: 201
                    anchors.leftMargin: 168
                    anchors.right: parent.right
                }
            }

            GroupBox {
                id: groupBox
                x: 509
                y: 211
                width: 129
                height: 74
                title: qsTr("")

                RoundButton {
                    id: roundButtonVHF
                    x: -8
                    y: -3
                    width: 59
                    height: 56
                    text: "VHF"
                    autoExclusive: true
                    checkable: true
                    checked: false
                }

                RoundButton {
                    id: roundButtonUHF
                    x: 53
                    y: -3
                    width: 58
                    height: 56
                    text: "UHF"
                    autoExclusive: true
                    checkable: true
                    checked: false
                }
            }

            Rectangle {
                id: rectangle2
                x: 8
                y: 202
                width: 200
                height: 200
                color: "#073685"
                radius: 20
                opacity: 0.5

                TextField {
                    id: textFieldTX3
                    x: 17
                    y: 53
                    width: 140
                    height: 40
                }

                TextField {
                    id: textFieldRX3
                    x: 17
                    y: 138
                    width: 140
                    height: 40
                }

                Label {
                    id: label7
                    x: 17
                    y: 27
                    width: 99
                    height: 20
                    color: "#000000"
                    text: qsTr("Transmission")
                }

                Label {
                    id: label8
                    x: 17
                    y: 112
                    width: 99
                    height: 20
                    color: "#000000"
                    text: qsTr("Reception")
                }
            }

            Rectangle {
                id: rectangle3
                x: 389
                y: 510
                width: 401
                height: 102
                color: "#073685"
                radius: 20
                opacity: 0.5
                TextField {
                    id: textFieldTX2
                    x: 17
                    y: 53
                    width: 140
                    height: 40
                }

                TextField {
                    id: textFieldRX2
                    x: 188
                    y: 53
                    width: 173
                    height: 40
                }

                Label {
                    id: label9
                    x: 17
                    y: 27
                    width: 99
                    height: 20
                    color: "#000000"
                    text: qsTr("Transmission")
                }

                Label {
                    id: label10
                    x: 205
                    y: 30
                    width: 99
                    height: 20
                    color: "#000000"
                    text: qsTr("Reception")
                }
            }

            Rectangle {
                id: rectangle4
                x: 1083
                y: 284
                width: 192
                height: 188
                color: "#073685"
                radius: 20
                opacity: 0.5
                TextField {
                    id: textFieldTX1
                    x: 17
                    y: 53
                    width: 140
                    height: 40
                }

                TextField {
                    id: textFieldRX1
                    x: 17
                    y: 138
                    width: 140
                    height: 40
                }

                Label {
                    id: label11
                    x: 17
                    y: 27
                    width: 99
                    height: 20
                    color: "#000000"
                    text: qsTr("Transmission")
                }

                Label {
                    id: label12
                    x: 17
                    y: 112
                    width: 99
                    height: 20
                    color: "#000000"
                    text: qsTr("Reception")
                }
            }

            Rectangle {
                id: rectangleLED3
                x: 268
                y: 155
                width: 26
                height: 24
                color: "#000000"
                radius: 19.5
            }

            Slider {
                id: sliderAV3
                x: 32
                y: 139
                width: 94
                height: 40
                from: 10
                stepSize: 10
                to: 0
                value: 0
                snapMode: Slider.SnapAlways
            }

            Label {
                id: label13
                x: -12
                y: 180
                height: 21
                color: "#f9f9f9"
                text: qsTr("AV2")
                anchors.left: parent.left
                anchors.rightMargin: 1155
                anchors.leftMargin: 97
                anchors.right: parent.right
            }

            Label {
                id: label14
                x: -10
                y: 180
                height: 21
                color: "#f9f9f9"
                text: qsTr("AV1")
                anchors.left: parent.left
                anchors.rightMargin: 1231
                anchors.leftMargin: 32
                anchors.right: parent.right
            }

            Slider {
                id: sliderAV2
                x: 409
                y: 472
                width: 94
                height: 40
                from: 10
                stepSize: 10
                value: 0
                to: 0
                snapMode: Slider.SnapAlways
            }

            Label {
                id: label15
                x: -16
                y: 451
                height: 21
                color: "#f9f9f9"
                text: qsTr("AV3")
                anchors.left: parent.left
                anchors.rightMargin: 785
                anchors.leftMargin: 467
                anchors.right: parent.right
            }

            Label {
                id: label16
                x: -14
                y: 451
                height: 21
                color: "#f9f9f9"
                text: qsTr("AV1")
                anchors.left: parent.left
                anchors.rightMargin: 861
                anchors.leftMargin: 402
                anchors.right: parent.right
            }

            Slider {
                id: sliderAV1
                x: 1150
                y: 211
                width: 94
                height: 40
                from: 10
                stepSize: 10
                value: 0
                to: 0
                snapMode: Slider.SnapAlways
            }

            Label {
                id: label17
                x: -4
                y: 252
                height: 21
                color: "#f9f9f9"
                text: qsTr("AV3")
                anchors.left: parent.left
                anchors.rightMargin: 45
                anchors.leftMargin: 1207
                anchors.right: parent.right
            }

            Label {
                id: label18
                x: -2
                y: 252
                height: 21
                color: "#f9f9f9"
                text: qsTr("AV2")
                anchors.left: parent.left
                anchors.rightMargin: 121
                anchors.leftMargin: 1142
                anchors.right: parent.right
            }

            Rectangle {
                id: rectangleLED2
                x: 753
                y: 480
                width: 26
                height: 24
                color: "#000000"
                radius: 19.5
            }

            Rectangle {
                id: rectangleLED1
                x: 1060
                y: 164
                width: 26
                height: 24
                color: "#000000"
                radius: 19.5
            }

            Button {
                id: buttonDemarr
                x: 37
                y: 519
                width: 200
                height: 74
                text: qsTr("Demarr la simulation")
                checkable: true
                flat: false
                layer.enabled: false
            }

            Button {
                id: buttonAide
                x: 1181
                y: 19
                text: qsTr("Aide")
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;height:620;width:1300}D{i:4;anchors_width:69;anchors_x:90}D{i:6;anchors_x:40}
D{i:12;anchors_width:69;anchors_x:90}D{i:13;anchors_width:69;anchors_x:90}D{i:14;anchors_width:69;anchors_x:90}
D{i:15;anchors_width:69;anchors_x:90}D{i:16;anchors_width:69;anchors_x:90}D{i:18;anchors_height:56;anchors_width:59;anchors_x:"-8";anchors_y:"-3"}
D{i:37;anchors_width:69;anchors_x:90}D{i:38;anchors_width:69;anchors_x:90}D{i:40;anchors_width:69;anchors_x:90}
D{i:41;anchors_width:69;anchors_x:90}D{i:43;anchors_width:69;anchors_x:90}D{i:44;anchors_width:69;anchors_x:90}
D{i:2;anchors_height:100;anchors_width:100;anchors_x:452;anchors_y:216}D{i:1;anchors_height:200;anchors_width:200;anchors_x:511;anchors_y:175}
}
##^##*/

