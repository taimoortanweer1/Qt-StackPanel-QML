import QtQuick 2.14
import QtQuick.Controls 2.14

import io.qt.examples.AudiosClass 1.0

ApplicationWindow {
    id: window

    //properties of the main window
    visible: true
    width: 1300
    height: 650
    maximumHeight: 650
    maximumWidth:  1300
    minimumHeight: 650
    minimumWidth:  1300

    title: qsTr("Your School Name")

    //this index value is set when jumpping to new page
    property var reqIndex : -1

    //
    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: view.currentIndex > 0 ? "\u25C0" : "\u2630"

            font.pixelSize: Qt.application.font.pixelSize * 1.6

            ToolTip.visible: hovered
            ToolTip.text: view.currentIndex > 1 ? qsTr("Home Page") : qsTr("Menu")

            onClicked: {

                //if current index is not home , set it to home
                if (view.currentIndex > 0) {
                    view.setCurrentIndex(0)

                    console.log(view.currentIndex)

                }
                //if you are in home page then open drawar
                else {
                    drawer.open()
                }
            }


        }

        Label {
            id: headertext
            text: "Home"
            anchors.centerIn: parent
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.2
        height: window.height

        // setting all the items in a list of column in a drawer
        Column {
            anchors.fill: parent
            ItemDelegate {

                //setting image of the item
                Image {
                    id: image1
                    source: "qrc:/images/formationImage.png"
                    width: 20
                    height: 20
                    y : 13
                }

                //setting text
                Text {
                    text: qsTr("Formation")
                    x: 25
                    y: 13
                }

                width: parent.width

                //go to respective page when clicked, other ItemDelegate works same like this
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
                    view.setCurrentIndex(5)
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
                    view.setCurrentIndex(16)
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


        //whenever page is scrolled text of the page is updated
        onCurrentIndexChanged: {

            var title = ["Acceil","Systeme","Introduction","Introduction","Introduction","Introduction",
                         "Émetteur-Récepteur","Émetteur-Récepteur","Panneau de commande radio (RMP)",
                         "Panneau de configuration audio (ACP)","Unité de gestion audio (AMU)","Bande frequency","Phraseologie Aeronotique",
                         "Simulation",
                         "Communication avion-avion","Aide","Communication Sol-Avion"]

            headertext.text = title[view.currentIndex]

        }

        // setting the list of pages in the respective order for SwipeView
        //home
        Item {
            HomeForm{
                id: home


                //this slot is called when user change this page to some other page i.e. go backward or forward
                //similar working for other pages
                onIncPage: {

                    //function used to increment or decrement the page
                    //similar working for other pages
                    view.receive(value)
                }
            }
        }

        //0 systeme
        Item{
            id: two
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
            Intro_1 {
                id: intro1
                onIncPage: {
                    view.receive(value)
                }
            }
        }

        //2-intro2
        Item{
            id: four
            Intro_2{
                id: intro2
                onIncPage: {
                    view.receive(value)
                }
            }
        }
        //3-intro3 plus
        Item{
            id: five
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
            Emitteur_recep_4 {
                id:emiterRecForm4
                onIncPage: {
                    view.receive(value)
                }
            }
        }

        Item{
            id: seven
            Emitteur_5 {
                id:emiterForm5
                onIncPage: {
                    view.receive(value)
                }
            }
        }

        Item{
            id: eight
            Recepteur_6 {
                id:emiterForm6
                onIncPage: {
                    view.receive(value)
                }
            }
        }

        Item{
            id: nine
            Rmp_7 {
                id:rmp7

                onIncPage: {
                    view.receive(value)
                }
            }
        }

        Item{
            id: ten
            Acp_8 {
                id:acp8

                onIncPage: {
                    view.receive(value)
                }
            }
        }

        Item{
            id: eleven
            Amu_9 {
                id:amu9

                onIncPage: {
                    view.receive(value)
                }
            }
        }

        Item{
            id: twelve
            Rf_10 {
                id:rf10

                onIncPage: {
                    view.receive(value)
                }
            }
        }
        Item{
            id: thirteen
            Aero_11 {
                id:aero11

                onIncPage: {
                    view.receive(value)
                }
            }
        }

        Item{
            id: forteen
            Simulation_12 {
                id:simu12

                onIncPage: {
                    view.receive(value)
                }
            }
        }

        Item{
            id: fifteen
            SimulationSol {
                id:simuSol

                onIncPage: {
                    view.receive(value)
                }
            }
        }
        Item{
            id: sixteen
            Aide_12 {
                id:aide12

                onIncPage: {
                    view.receive(value)
                }
            }
        }

        Item{
            id: seventeen
            SimulationAvionTower {
                id:simuAvionTower


                //different slots for audio playing stopping and volume changing
                onPlayAudio: {

                    audioCpp.playfile(audioIndex)

                }
                onIncPage: {
                    view.receive(value)
                }

                onVolumeAudio: {
                    audioCpp.setVolume(audioVolume)
                }

                onStopAudio: {
                    audioCpp.stopfile()
                }

            }
        }

        Item{
            id: eighteen
            Aide2_13 {
                id:aide13

                onIncPage: {
                    view.receive(value)
                }
            }
        }


        AudiosClass
        {
            //Cpp class initialised here
            id: audioCpp
        }


//        function setStaticIncrement(value)
//        {
//            view.setCurrentIndex(value)
//        }

//        function setOrientation(value)
//        {
//            if(value === 1)
//            {
//                view.orientation = Qt.Vertical
//            }

//            else if(value === 0 )
//            {
//                view.orientation = Qt.Horizontal

//            }
//        }

        function receive(value)
        {
            //if value is 1 go to next page
            //if value is 2 go to next page two times
            //if value is -1 go to previous page
            //if value is -2 go to previous page two times
            //if value is 6 go to next page six times
            // similarly for other values

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


//        Timer {
//            id: timer
//        }

//        function delay(delayTime) {
//            timer.interval = delayTime;
//            timer.repeat = false;
//            timer.start();
//        }

    }

    //Number of dots / page indicators
    PageIndicator {
        id: indicator
        count: view.count
        currentIndex: view.currentIndex
        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }


    //only active pages are loaded to save memory
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


