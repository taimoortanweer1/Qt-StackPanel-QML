import QtQuick 2.4
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls 2.13
import QtQuick 2.14
import QtQuick 2.0

Item {
    width: 1300
    height: 620
    property alias buttonDemarText: buttonDemarText
    property alias spinBoxStandByF: spinBoxStandByF
    property alias rectangleLEDControl: rectangleLEDControl

    property alias rectanglePlaneRight: rectanglePlaneRight
    property alias rectangleLED3: rectangleLED3
    property alias rectangleLED2: rectangleLED2
    property alias rectangleLED1: rectangleLED1
    property alias rectangleSignal2: rectangleSignal2
    property alias rectangleSignal1: rectangleSignal1
    property alias rectangleSignal: rectangleSignal
    property alias rectanglePlaneLeft: rectanglePlaneLeft
    property alias buttonrRemplir: buttonrRemplir
    property alias name1: name1
    property alias image: image
    property alias rectangle1: rectangle1

    property alias buttonAide: buttonAide
    property alias buttonDemarr: buttonDemarr
    property alias roundButtonUHF: roundButtonUHF
    property alias dialvolume: dialvolume
    property alias switchAS: switchAS
    property alias spinBoxActiveF: spinBoxActiveF
    property alias roundButtonVHF: roundButtonVHF
    property alias switchOnOff: switchOnOff
    property alias labelValidPlan: labelValidPlan

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
            layer.wrapMode: ShaderEffectSource.RepeatHorizontally
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            fillMode: Image.Stretch
            source: "comAvion.png"

            Rectangle {
                id: rectangle1
                x: 181
                y: 171
                width: 404
                height: 172
                color: "#073685"
                radius: 20
                opacity: 0.6
                anchors.verticalCenterOffset: -210
                anchors.verticalCenter: parent.verticalCenter
                border.width: 0

                Label {
                    id: label
                    y: 5
                    height: 21
                    color: "#f9f9f9"
                    text: qsTr("Active")
                    anchors.right: parent.right
                    anchors.rightMargin: 280
                    anchors.left: parent.left
                    anchors.leftMargin: 54
                }

                Label {
                    id: label1
                    x: 243
                    y: 5
                    width: 69
                    height: 21
                    color: "#f9f9f9"
                    text: qsTr("Standby")
                }

                DoubleSpinBox {
                    id: spinBoxActiveF
                    y: 18
                    width: 160
                    height: 60
                    editable: true
                    font.pixelSize: 20
                    enabled: false
                    anchors.right: parent.right
                    anchors.rightMargin: 248
                    anchors.left: parent.left
                    anchors.leftMargin: -1
                    scale: 0.7
                    wheelEnabled: true
                }

                Switch {
                    id: switchAS
                    x: 147
                    y: 26
                    text: qsTr("")
                    checkable: true
                    enabled: false
                    checked: true
                }

                Dial {
                    id: dialvolume
                    x: 150
                    y: 72
                    width: 73
                    height: 56
                    enabled: false
                    anchors.right: parent.right
                    anchors.rightMargin: 181
                    inputMode: Dial.Horizontal
                    value: 50
                    stepSize: 5
                    to: 100
                    from: 0
                }

                Switch {
                    id: switchOnOff
                    x: 248
                    y: 95
                    width: 118
                    height: 40
                    text: qsTr("Off/On")
                    font.pointSize: 9
                    font.bold: true
                    checked: false
                    checkable: true
                    display: AbstractButton.TextBesideIcon
                }

                Label {
                    id: label2
                    x: -4
                    y: 140
                    height: 21
                    color: "#f9f9f9"
                    text: qsTr("Volume")
                    anchors.left: parent.left
                    anchors.rightMargin: 191
                    anchors.leftMargin: 158
                    anchors.right: parent.right
                }

                Label {
                    id: label6
                    x: -2
                    y: 10
                    height: 21
                    color: "#f9f9f9"
                    text: qsTr("A/S")
                    anchors.left: parent.left
                    anchors.rightMargin: 201
                    anchors.leftMargin: 168
                    anchors.right: parent.right
                }

                DoubleSpinBox {
                    id: spinBoxStandByF
                    x: 9
                    y: 17
                    width: 160
                    height: 60
                    dValue: 300
                    anchors.right: parent.right
                    anchors.left: parent.left
                    anchors.leftMargin: 211
                    editable: true
                    anchors.rightMargin: 36
                    wheelEnabled: true
                    scale: 0.7
                    font.pixelSize: 20
                    enabled: false
                }

                GroupBox {
                    id: groupBox
                    x: 13
                    y: 91
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
                        enabled: false
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
                        enabled: false
                        autoExclusive: true
                        checkable: true
                        checked: false
                    }
                }
            }

            Button {
                id: buttonDemarr
                x: 1136
                y: 575
                width: 156
                height: 37

                Text {
                    id: buttonDemarText
                    width: 156
                    height: 37
                    text: qsTr("Demarr la simulation")
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    color: "white"
                }

                checkable: true
                flat: false
                layer.enabled: false

                background: Rectangle {
                    color: "blue"
                    radius: 18.5
                }
            }

            Button {
                id: buttonAide
                x: 1181
                y: 19
                text: qsTr("Aide")
            }

            Button {
                id: buttonrRemplir
                x: 8
                y: 114
                width: 156
                height: 47
                layer.enabled: false
                background: Rectangle {
                    color: "#0000ff"
                    radius: 18.5
                }
                Text {
                    id: name1
                    color: "#ffffff"
                    text: qsTr("Remplir le plan de
vole")
                    anchors.fill: parent
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
                checkable: true
                flat: false
            }

            Rectangle {
                id: rectangleLED1
                x: 21
                y: 523
                width: 30
                height: 30
                color: "#000000"
                radius: 15
            }

            Rectangle {
                id: rectangleLED3
                x: 1150
                y: 201
                width: 30
                height: 30
                color: "#000000"
                radius: 15
            }

            Rectangle {
                id: rectangleLED2
                x: 328
                y: 513
                width: 30
                height: 30
                color: "#000000"
                radius: 15
            }

            Rectangle {
                id: rectanglePlaneLeft
                x: 8
                y: 473
                width: 110
                height: 70
                color: "#00000000"

                Image {
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                    anchors.fill: parent
                    fillMode: Image.Stretch
                    source: "planeLeft.png"
                }
            }

            Rectangle {
                id: rectanglePlaneRight
                x: 1150
                y: 237
                width: 110
                height: 70
                color: "#00000000"
                Image {
                    anchors.leftMargin: 0
                    anchors.fill: parent
                    anchors.topMargin: 0
                    source: "planeRight.png"
                    anchors.bottomMargin: 0
                    fillMode: Image.Stretch
                    anchors.rightMargin: 0
                }
            }

            Rectangle {
                id: rectangleSignal
                visible: false
                x: 112
                y: 505
                width: 32
                height: 5
            }

            Rectangle {
                id: rectangleSignal1
                x: 150
                y: 505
                width: 32
                height: 5
                visible: false
            }

            Rectangle {
                id: rectangleSignal2
                x: 188
                y: 505
                width: 32
                height: 5
                visible: false
            }

            Label {
                id: labelValidPlan
                x: 372
                y: 528
                width: 93
                height: 20
                visible: false
                text: qsTr("Valide Plan")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Rectangle {
                id: rectangleLEDControl
                x: 827
                y: 488
                width: 30
                height: 30
                color: "#000000"
                radius: 15
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;height:620;width:1300}D{i:4;anchors_width:69;anchors_x:90}D{i:10;anchors_width:69;anchors_x:90}
D{i:11;anchors_width:69;anchors_x:90}D{i:14;anchors_height:56;anchors_width:69;anchors_x:90;anchors_y:202}
D{i:15;anchors_height:56;anchors_width:69;anchors_x:90;anchors_y:"-3"}D{i:13;anchors_width:69;anchors_x:90;anchors_y:202}
D{i:17;anchors_width:69;anchors_x:90}D{i:16;anchors_width:69;anchors_x:90}D{i:21;anchors_width:69;anchors_x:90}
D{i:22;anchors_height:37;anchors_width:156}D{i:20;anchors_width:69;anchors_x:90}D{i:23;anchors_height:37;anchors_width:156}
D{i:2;anchors_height:100;anchors_width:100;anchors_x:452;anchors_y:216}D{i:1;anchors_height:200;anchors_width:200;anchors_x:511;anchors_y:175}
}
##^##*/

