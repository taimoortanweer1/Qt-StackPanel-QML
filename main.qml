import QtQuick 2.14
import QtQuick.Controls 2.14

ApplicationWindow {
    id: window
    visible: true
    width: 1300
    height: 650
    maximumHeight: 650
    maximumWidth:  1300
    minimumHeight: 650
    minimumWidth:  1300
    title: qsTr("Acceuil")

    property var reqIndex : -1
    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: view.currentIndex > 1 ? "\u25C0" : "\u2630"

            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (view.currentIndex > 1) {
                    view.decrementCurrentIndex()
                } else {
                    drawer.open()
                }
            }
        }
        Label {
            //text: view.currentIndex
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

                Image {
                    id: image1
                    source: "qrc:/images/formationImage.png"
                    width: 20
                    height: 20
                    y : 13
                }

                Text {
                    text: qsTr("Formation")
                    x: 25
                    y: 13
                }

                width: parent.width
                onClicked: {
                    view.setCurrentIndex(2)

                    drawer.close()
                }
            }

            ItemDelegate{
                text: qsTr("Introduction")
                x: parent.width / 6
                width: parent.width - x
                onClicked: {
                    view.setCurrentIndex(2)
                    drawer.close()
                }
            }

            ItemDelegate{
                text: qsTr("Emetteur-Recepteur")
                x: parent.width / 6
                width: parent.width - x
                onClicked: {
                    view.setCurrentIndex(6)
                    drawer.close()
                }
            }

            ItemDelegate{
                text: qsTr("Panneau de commande Radio")
                x: parent.width / 6
                width: parent.width - x
                onClicked: {
                    view.setCurrentIndex(8)

                    drawer.close()
                }
            }
            ItemDelegate{
                text: qsTr("Paneau de commande audio")
                x: parent.width / 6
                width: parent.width - x
                onClicked: {
                    view.setCurrentIndex(9)

                    drawer.close()
                }
            }
            ItemDelegate{
                text: qsTr("Unite de gestion audio")
                x: parent.width / 6
                width: parent.width - x
                onClicked: {
                    view.setCurrentIndex(10)

                    drawer.close()
                }
            }

            ItemDelegate{
                text: qsTr("Bande radiofrequence")
                x: parent.width / 6
                width: parent.width - x
                onClicked: {
                    view.setCurrentIndex(11)
                    drawer.close()
                }
            }
            ItemDelegate{
                text: qsTr("Phraséologie aéronautique ")
                x: parent.width / 6
                width: parent.width - x
                onClicked: {
                    view.setCurrentIndex(12)
                    drawer.close()
                }
            }

            ItemDelegate {



                Image {

                    source: "qrc:/images/simulationImage.png"
                    width: 20
                    height: 20
                    y : 13
                }

                Text {
                    text: qsTr("Simulation")
                    x: 25
                    y: 13
                }
                width: parent.width
                onClicked: {
                    view.setCurrentIndex(13)
                    drawer.close()
                }

            }

            ItemDelegate{
                text: qsTr("Comunication avion-avion")
                x: parent.width / 6
                width: parent.width - x
                onClicked: {
                    view.setCurrentIndex(14)
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


    SwipeView {
        id: view
        currentIndex: 0
        anchors.fill: parent
        anchors.top: parent.top



        onCurrentIndexChanged: {

            var title = ["Acceil","Systeme","Introduction","Introduction","Introduction","Introduction",
                         "Émetteur-Récepteur","Émetteur-Récepteur","Panneau de commande radio (RMP)",
                         "Panneau de configuration audio (ACP)","Unité de gestion audio (AMU)","Bande frequency","Phraseologie Aeronotique",
                         "Simulation",
                         "Communication avion-avion","Aide"]

            window.title = title[view.currentIndex]

//            if(view.currentIndex === 3 || view.currentIndex === 4)
//            {
//                view.orientation = Qt.Vertical
//                console.log("Required Index " + reqIndex + "/n")
//            }

//            else
//            {
//                view.orientation = Qt.Horizontal
//                console.log("Required Index " + reqIndex + "/n")

//            }


            console.log("After Index Changed " + view.currentIndex)

        }
        //home
        Item {
            HomeForm{
                id: home


                onIncPage: {

                    view.receive(value)
                }
            }
        }

        //0 systeme
        Item{

            id: two
            //            Loader {
            //                // index 1
            //                id: pagetwo
            //                source: "SystemeForm_0.qml"
            //                anchors.fill: parent
            //                anchors.top: parent.top
            //            }

            SystemeForm_0{
                id: systemeForm
                onIncPage: {
                    view.receive(value)
                }
            }

        }

        //1-intro1
        Item{
            id: three
            //            Loader {
            //                // index 2
            //                id: pagethree
            //                source: "Intro_1.qml"
            //                anchors.fill: parent
            //                anchors.top: parent.top
            //            }

            Intro_1 {
                id: intro1



            }
        }

        //2-intro2
        Item{
            id: four
            //            Loader {
            //                // index 3
            //                id: pagefour
            //                source: "Intro_2.qml"
            //                anchors.fill: parent
            //                anchors.top: parent.top
            //            }

            Intro_2{
                id: intro2

                onIncPage: {


                    console.log("Button event  = " + view.currentIndex)


                    view.receive(value)
                    console.log("Button event  = " + view.currentIndex)


                }
                onChangeOrientation : {

                    view.setOrientation(value)
                    console.log("Current Orientation = " + view.orientation.toString())
                    view.delay(300);

                }
            }
        }


        //3-intro3 plus
        Item{
            id: five
            //            Loader {
            //                // index 4
            //                id: pagefive
            //                source: "Intro_3.qml"
            //                anchors.fill: parent
            //                anchors.top: parent.top
            //            }

            Intro_3{
                id: intro3

                onIncPage: {
                    view.receive(value)
                }
            }
        }


        //Emitteur-recep_4
        Item{
            id: six
            //            Loader {
            //                // index 5
            //                id: pageSix
            //                source: "Emitteur_recep_4.qml"
            //                anchors.fill: parent
            //                anchors.top: parent.top
            //            }

            Emitteur_recep_4 {
                id:emiterRecForm4

                onIncPage: {
                    view.receive(value)
                }
            }
        }

        Item{
            id: seven
            //            Loader {
            //                // index 6
            //                id: pageSeven
            //                source: "Emitteur_5.qml"
            //                anchors.fill: parent
            //                anchors.top: parent.top
            //            }

            Emitteur_5 {
                id:emiterForm5

                onIncPage: {
                    view.receive(value)
                }
            }
        }

        Item{
            id: eight
            //            Loader {
            //                // index 7
            //                id: pageEight
            //                source: "Recepteur_6.qml"
            //                anchors.fill: parent
            //                anchors.top: parent.top
            //            }

            Recepteur_6 {
                id:emiterForm6

                onIncPage: {
                    view.receive(value)
                }
            }
        }

        Item{
            id: nine
            //            Loader {
            //                // index 8
            //                id: pageNine
            //                source: "Rmp_7.qml"
            //                anchors.fill: parent
            //                anchors.top: parent.top
            //            }

            Rmp_7 {
                id:rmp7

                onIncPage: {
                    view.receive(value)
                }
            }
        }

        Item{
            id: ten
            //            Loader {
            //                // index 9
            //                id: pageTen
            //                source: "Acp_8.qml"
            //                anchors.fill: parent
            //                anchors.top: parent.top
            //            }

            Acp_8 {
                id:acp8

                onIncPage: {
                    view.receive(value)
                }
            }
        }

        Item{
            id: eleven
            //            Loader {
            //                // index 9
            //                id: pageEleven
            //                source: "Amu_9.qml"
            //                anchors.fill: parent
            //                anchors.top: parent.top
            //            }

            Amu_9 {
                id:amu9

                onIncPage: {
                    view.receive(value)
                }
            }
        }

        Item{
            id: twelve
            //            Loader {
            //                // index 9
            //                id: pageTwelve
            //                source: "Rf_10.qml"
            //                anchors.fill: parent
            //                anchors.top: parent.top
            //            }

            Rf_10 {
                id:rf10

                onIncPage: {
                    view.receive(value)
                }
            }
        }
        Item{
            id: thirteen
            //            Loader {
            //                // index 9
            //                id: pageThirteen
            //                source: "Aero_11.qml"
            //                anchors.fill: parent
            //                anchors.top: parent.top
            //            }

            Aero_11 {
                id:aero11

                onIncPage: {
                    view.receive(value)
                }
            }
        }

        Item{
            id: forteen
            //            Loader {
            //                // index 9
            //                id: pageforteen
            //                source: "Simulation_12.qml"
            //                anchors.fill: parent
            //                anchors.top: parent.top
            //            }

            Simulation_12 {
                id:simu12

                onIncPage: {
                    view.receive(value)
                }
            }
        }

        Item{
            id: fifteen
            //            Loader {
            //                // index 9
            //                id: pagefifteen
            //                source: "SimulationSol.qml"
            //                anchors.fill: parent
            //                anchors.top: parent.top
            //            }

            SimulationSol {
                id:simuSol

                onIncPage: {
                    view.receive(value)
                }
            }
        }
        Item{
            id: sixteen
            //            Loader {
            //                // index 9
            //                id: pageSixteen
            //                source: "Aide_12.qml"
            //                anchors.fill: parent
            //                anchors.top: parent.top
            //            }

            Aide_12 {
                id:aide12

                onIncPage: {
                    view.receive(value)
                }
            }
        }








        function setStaticIncrement(value)
        {
            view.setCurrentIndex(value)
        }

        function setOrientation(value)
        {
            if(value === 1)
            {
                view.orientation = Qt.Vertical
            }

            else if(value === 0 )
            {
                view.orientation = Qt.Horizontal

            }
        }

        function receive(value)
        {

            reqIndex = view.currentIndex + value
            if(value > 0)
            {
                for(var i = 0; i < value; i++)
                {
                    console.log("before increment "+currentIndex)
                    view.incrementCurrentIndex()
                    //view.setCurrentIndex(view.currentIndex+value)

                }
            }


            if(value < 0)
            {
                for(var j = value; j < 0; j++)
                {
                    //view.setCurrentIndex(view.currentIndex+value)
                    view.decrementCurrentIndex()
                }
            }
        }


        Timer {
            id: timer
        }

        function delay(delayTime) {
            timer.interval = delayTime;
            timer.repeat = false;
            timer.start();
        }

    }

    PageIndicator {
        id: indicator
        count: view.count
        currentIndex: view.currentIndex
        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }


    Repeater {
        model: 3
        Loader {
            active: SwipeView.isCurrentItem || SwipeView.isNextItem || SwipeView.isPreviousItem
            sourceComponent: Text {
                text: index
                Component.onCompleted: console.log("created:", index)
                Component.onDestruction: console.log("destroyed:", index)
            }
        }
    }



}


