import QtQuick 2.14
import QtQuick.Controls 2.14

ApplicationWindow {
    id: window
    visible: true
    width: 1300
    height: 620
    title: qsTr("Acceuil")

    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }
        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.2
        height: window.height

        Column {
            anchors.fill: parent
            ItemDelegate {
                text: qsTr("Formation")
                width: parent.width
                onClicked: {
                    stackView.push("1_Intro.qml")
                    drawer.close()
                }
            }

            ItemDelegate{
                text: qsTr("Introduction")
                x: parent.width / 6
                width: parent.width - x
                onClicked: {
                    stackView.push("1_Intro.qml")
                    drawer.close()
                }
            }

            ItemDelegate{
                text: qsTr("Emetteur-Recepteur")
                x: parent.width / 6
                width: parent.width - x
                onClicked: {
                    stackView.push("4_emitteur-recep.qml")
                    drawer.close()
                }
            }

            ItemDelegate{
                text: qsTr("Panneau de commande Radio")
                x: parent.width / 6
                width: parent.width - x
                onClicked: {
                    stackView.push("7_rmp.qml")
                    drawer.close()
                }
            }
            ItemDelegate{
                text: qsTr("Paneau de commande audio")
                x: parent.width / 6
                width: parent.width - x
                onClicked: {
                    stackView.push("8_acp.qml")
                    drawer.close()
                }
            }
            ItemDelegate{
                text: qsTr("Unite de gestion audio")
                x: parent.width / 6
                width: parent.width - x
                onClicked: {
                    stackView.push("12_gest.qml")
                    drawer.close()
                }
            }            

            ItemDelegate{
                text: qsTr("Bande radiofrequence")
                x: parent.width / 6
                width: parent.width - x
                onClicked: {
                    stackView.push("13_bande.qml")
                    drawer.close()
                }
            }
            ItemDelegate{
                text: qsTr("Phraséologie aéronautique ")
                x: parent.width / 6
                width: parent.width - x
                onClicked: {
                    stackView.push("13_bande.qml")
                    drawer.close()
                }
            }

            ItemDelegate {
                text: qsTr("Simulation")
                width: parent.width
                onClicked: {
                    stackView.push("9_simulation.qml")
                    drawer.close()
                }

            }

            ItemDelegate{
                text: qsTr("Comunication avion-avion")
                x: parent.width / 6
                width: parent.width - x
                onClicked: {
                    stackView.push("10_com_avion.qml")
                    drawer.close()
                }
            }

            ItemDelegate{
                text: qsTr("Comunication avion-sol")
                x: parent.width / 6
                width: parent.width - x
                onClicked: {
                    stackView.push("11_com_sol.qml")
                    drawer.close()
                }
            }

            ItemDelegate {
                text: qsTr("Exit Program")
                width: parent.width
                onClicked: {
                    Qt.quit()
                }
            }


        }
    }

    StackView {
        id: stackView
        initialItem: "HomeForm.qml"
        anchors.fill: parent

        onCurrentItemChanged: {
                     stackView.currentItem.requestStackChange.connect(stackView.push);
        }

    }
}
