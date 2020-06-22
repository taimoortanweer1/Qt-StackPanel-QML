import QtQuick 2.4
import QtQuick.Dialogs 1.3
SimulationAvionTowerForm {


    id:simuSol

    //declaration of signals for any event
    signal incPage(var value)
    signal decPage(var value)
    signal playAudio(var value)
    signal stopAudio()
    signal volumeAudio()

    property int audioIndex: 0 //audio to be played
    property int audioVolume: 50 // init audio volumeS
    property var avion: [0,0,0] //which is the active plane
    property bool power: false //powr of the selector panel

    property var sendto: 1 //which plane to send data
    //0x03 one and two exchange
    //0x05 one and three exchange
    //0x06 two and three exchange

    property var startSim: false
    buttonDemarr.onToggled: {

        //if power swithci is not ON
        if(switchOnOff.checked != true)
        {
            //show message
            messagePower.open()
        }
        else
        {
            //if simulation is started
            if(buttonDemarr.checked === true)
            {
                //start all plane animatinos
                animationRightPlane.start()
                animationTakeOff.start()
                animationTakeOffY.start()

                //updated the text
                buttonDemarText.text = "Arretez la simulation"

            }
            else
            {

                //if simulation is stopped initialise to original values
                rectangleLED1.x =21
                rectangleLED1.y =523

                rectanglePlaneLeft.x = 8
                rectanglePlaneLeft.y = 473

                rectangleLED3.x = 1150
                rectanglePlaneRight.x = 1150

                rectangleLED1.color = "#000000"
                rectangleLED2.color = "#000000"
                rectangleLED3.color = "#000000"
                rectangleLEDControl.color = "#000000"

                animationHalfPoint.stop()
                animationRightPlane.stop()
                animationSignal.stop()
                animationTakeOffY.stop()
                animationTakeOff.stop()
                animationTakeOffYHalfPoint.stop()
                animationValid.stop()
                stopAudio()

                buttonDemarText.text = "Demarr la simulation"
            }
        }
    }
    buttonAide.onClicked: {

        //go to aide page
        simuSol.incPage(1)
    }
    dialvolume.onValueChanged: {

        //change volume. it will send signal to cpp file
        audioVolume = dialvolume.value
        volumeAudio()
    }
    rectanglePlaneLeft.onXChanged: {


        //if left plane is in the specific region, play this audio
        //pair 1
        if(rectanglePlaneLeft.x >= 50 && rectanglePlaneLeft.x <= 51)
        {
            //t 1


            audioIndex = 0 // set audio index
            rectangleLED1.color = "green" //set color of LED
            rectangleLED2.color = "red"
            playAudio(0); //send signal to cpp file
        }
        else if(rectanglePlaneLeft.x >= 150 && rectanglePlaneLeft.x <= 151)
        {

            // a 1
            audioIndex = 1
            playAudio(1);
            rectangleLED1.color = "red"
            rectangleLED2.color = "green"
        }

        //pair 2
        else if(rectanglePlaneLeft.x >= 340 && rectanglePlaneLeft.x <= 341)
        {
            //t 2
            audioIndex = 2
            playAudio(2);
            rectangleLED1.color = "green"
            rectangleLED2.color = "red"
        }

        else if(rectanglePlaneLeft.x >= 460 && rectanglePlaneLeft.x <= 461)
        {
            // a 2
            audioIndex = 3
            playAudio(3);
            rectangleLED1.color = "red"
            rectangleLED2.color = "green"
        }


        //pair 3
        else if(rectanglePlaneLeft.x >= 550 && rectanglePlaneLeft.x <= 551)
        {
            // t 3
            audioIndex = 4
            playAudio(4);
            rectangleLED1.color = "green"
            rectangleLED2.color = "red"
        }


        else if(rectanglePlaneLeft.x >= 610 && rectanglePlaneLeft.x <= 611)
        {

            // a 3
            audioIndex = 5
            playAudio(5);
            rectangleLED1.color = "red"
            rectangleLED2.color = "green"
        }

        //pair 4
        else if(rectanglePlaneLeft.x >= 700 && rectanglePlaneLeft.x <= 701)
        {

            // a 4
            audioIndex = 6
            playAudio(6);
            rectangleLED1.color = "red"
            rectangleLED2.color = "black"
            rectangleLEDControl.color = "green"
        }

        //center
        else if(rectanglePlaneLeft.x >= 970 && rectanglePlaneLeft.x <= 971)
        {

            // c 1
            audioIndex = 7
            playAudio(7);

            rectangleLED1.color = "green"
            rectangleLED2.color = "black"
            rectangleLEDControl.color = "red"
            console.log("I am in center")
        }


        else if(rectanglePlaneLeft.x >= 1150)
        {

            rectangleLED1.color = "black"
            rectangleLED2.color = "black"
            rectangleLEDControl.color = "black"
        }


        console.log(rectanglePlaneLeft.x)
    }

    rectanglePlaneRight.onXChanged: {

        //if plane is in this region change color to green
        if(rectanglePlaneRight.x < 500 && rectanglePlaneRight.x > 200)
        {
            rectangleLED3.color = "green"
        }
        else
        {
            rectangleLED3.color = "black"
        }

    }

    buttonrRemplir.onClicked: {

        //show flight pplane form
        flightplan.visible = true
    }

    switchAS.onToggled: {

        //left plane has reached end of circle and switch is on the right side then update the value
        if(switchAS.checked != true && rectanglePlaneLeft.x === 600)
        {
            //spinBoxActiveF.enabled = false
            //spinBoxStandByF.enabled = true
            spinBoxActiveF.dValue = spinBoxStandByF.dValue
            animationTakeOffYHalfPoint.start()
            animationHalfPoint.start()
        }


    } //simulation power button


    switchOnOff.onToggled: {


        if(switchOnOff.checked)
        {
            power = true
            spinBoxActiveF.enabled = true
            spinBoxStandByF.enabled = true
            switchAS.enabled = true
            roundButtonUHF.enabled = true
            roundButtonVHF.enabled = true
            dialvolume.enabled = true
            buttonDemarr.enabled = true
            buttonrRemplir.enabled = true


            rectangleLED1.color = "#000000"
            rectangleLED2.color = "#000000"
            rectangleLED3.color = "#000000"
            rectangleLEDControl.color = "#000000"



        }
        else
        {
            power = false

            spinBoxActiveF.enabled = false
            spinBoxStandByF.enabled = false
            switchAS.enabled = false
            roundButtonUHF.enabled = false
            roundButtonVHF.enabled = false
            dialvolume.enabled = false

            buttonDemarr.enabled = false
            buttonrRemplir.enabled = false

            rectangleLED1.x =21
            rectangleLED1.y =523

            rectanglePlaneLeft.x = 8
            rectanglePlaneLeft.y = 473

            rectangleLED3.x = 1150
            rectanglePlaneRight.x = 1150

            rectangleLED1.color = "#000000"
            rectangleLED2.color = "#000000"
            rectangleLED3.color = "#000000"
            rectangleLEDControl.color = "#000000"

            animationHalfPoint.stop()
            animationRightPlane.stop()
            animationSignal.stop()
            animationTakeOffY.stop()
            animationTakeOff.stop()
            animationTakeOffYHalfPoint.stop()
            animationValid.stop()



        }

    }


    //animations used to move signal signs from plane to tower
    PropertyAnimation {
        id: animationSignal;
        targets: [rectangleSignal,rectangleSignal1,rectangleSignal2]; //objects to be moved
        property: "x"; //whhich property to update with time
        to: 330; // final value of property
        duration: 500 //complete the animation in this time
        property var d: 0


        onStarted: {
            //when animation starts do this
            rectangleSignal.visible = true
            rectangleSignal1.visible = true
            rectangleSignal2.visible = true
        }

        onStopped: {
            //when animation ends go to initial postion
            rectangleSignal.x = 112
            rectangleSignal1.x = 150
            rectangleSignal2.x = 188

            rectangleSignal.visible = false
            rectangleSignal1.visible = false
            rectangleSignal2.visible = false

            // if signal is sent three times start valid signal animation
            if(d===3)
            {
                animationValid.start()
                d = 0
            }
            // if signal is not sent three times then keep sending
            else
            {
                animationSignal.start()
                d++
            }
        }
    }

    //show valid signal for 2000 milliseconds
    PropertyAnimation {
        id: animationValid;
        targets: [labelValidPlan];
        property: "visible";
        //to: 100;
        duration: 2000

        onStarted: {
            labelValidPlan.visible = true
        }
        onStopped: {
            labelValidPlan.visible = false
        }
    }

    //animation to update left plane and its led position x in the given time
    PropertyAnimation { id: animationTakeOff;
        targets: [rectanglePlaneLeft,rectangleLED1];
        property: "x"

        to: 600;
        duration: 65000

        onStarted: {
            console.log("start")
        }
        onStopped: {
        }
    }

    //animation to update left plane and its led position y in the given time
    PropertyAnimation { id: animationTakeOffY;
        targets: [rectanglePlaneLeft,rectangleLED1];
        property: "y"

        to: 440;
        duration: 35000

        onStarted: {
            console.log("start")
        }
        onStopped: {
            //rectanglePlaneLeft.x = 20
            //rectangleLED1.x = 20
            //rectanglePlaneRight.x = 1150
            //rectangleLED3.x = 1150

        }
    }

    //animation to update left plane and its led position x after the frequency changed
    PropertyAnimation { id: animationHalfPoint;
        targets: [rectanglePlaneLeft,rectangleLED1];
        property: "x"

        to: 1300;
        duration: 65000

        onStarted: {
            console.log("start")
        }
        onStopped: {

            //rectanglePlaneLeft.x = 20
            //rectangleLED1.x = 20
            //rectanglePlaneRight.x = 1150
            //rectangleLED3.x = 1150
        }
    }

    //animation to update left plane and its led position y after the frequency changed
    PropertyAnimation { id: animationTakeOffYHalfPoint;
        targets: [rectanglePlaneLeft,rectangleLED1];
        property: "y"

        to: -100;
        duration: 65000

        onStarted: {
            console.log("start")
        }
        onStopped: {

            //rectanglePlaneLeft.x = 20
            //rectangleLED1.x = 20
            //rectanglePlaneRight.x = 1150
            //rectangleLED3.x = 1150
        }
    }


    //animation to update right plane and its led position x
    PropertyAnimation { id: animationRightPlane;
        targets: [rectanglePlaneRight,rectangleLED3];
        property: "x";
        to: -200;
        duration: 80000


        onStarted: {


        }
        onStopped: {
            //rectanglePlaneLeft.x = 20
            //rectangleLED1.x = 20
            //rectanglePlaneRight.x = 1150
            //rectangleLED3.x = 1150
        }


    }

    //initial plan form
    FlightPlan {
        id: flightplan
        visible: false
        onValidate:{

            //when validate button is pressed send the signal to tower and start the signal animation
            flightplan.visible = false
            animationSignal.start()

        }
    }


    MessageDialog {
        id: messagePower
        standardButtons: StandardButton.Ok
        text: "Please switch On Simulator Power"

    }


}//form

