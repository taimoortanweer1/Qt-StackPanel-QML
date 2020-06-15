import QtQuick 2.4

SimulationAvionTowerForm {


    id:simuSol
    signal incPage(var value)
    signal decPage(var value)
    signal playAudio(int index)

    property var avion: [0,0,0] //which is the active plane
    property bool power: false //powr of the selector panel

    property var lineCanvas: [0,0,0,0] //line position
    property var sendto: 1 //which plane to send data
    //0x03 one and two exchange
    //0x05 one and three exchange
    //0x06 two and three exchange

    property var startSim: false
    buttonrRemplir.onClicked: {

        flightplan.visible = true
    }

    switchAS.onToggled: {

        if(switchAS.checked == true)
        {
            spinBoxActiveF.enabled = false
            spinBoxStandByF.enabled = true

        }
        else
        {
            spinBoxActiveF.enabled = true
            spinBoxStandByF.enabled = false
        }
    } //simulation power button


    Canvas
    {
        width: parent.width
        height: parent.height
        id: canvas1

        onPaint: {
            var ctx = canvas1.getContext('2d')

            ctx.strokeStyle = "black"
            ctx.lineWidth = 2
            ctx.lineCap = "round"
            ctx.lineJoin = "round"
            ctx.setLineDash( [ 1, 4 ] )
            ctx.fillStyle = Qt.rgba(0, 0, 0, 1);
            ctx.fillRect(0, 0, 1, 1);
            ctx.beginPath()
            ctx.create
            ctx.moveTo(lineCanvas[0], lineCanvas[1])
            ctx.lineTo(lineCanvas[2], lineCanvas[3])
            ctx.stroke()

        }


        function linePosition (x1,y1,x2,y2) {

            lineCanvas = [x1,y1,x2,y2]
        }

        function clear_canvas () {
            var ctx = getContext("2d");
            ctx.reset();
            canvas1.requestPaint();
        }

        function sendFunction1()
        {
            if(avion[0] === 1)
            {

                textFieldRX2.text = textFieldTX1.text
                textFieldRX3.text = textFieldTX1.text


                //                if(sendto === 3)
                //                {
                //                    textFieldRX2.text = textFieldTX1.text
                //                }
                //                if(sendto === 5)
                //                {
                //                    textFieldRX3.text = textFieldTX1.text
                //                }
            }

            if(avion[1] === 1 && sendto === 3)
            {
                textFieldRX1.text = textFieldTX2.text
            }

            else if (avion[2] === 1 && sendto === 5)
            {
                textFieldRX1.text = textFieldTX2.text
            }
        }
        function sendFunction2() {
            if(avion[1] === 1)
            {

                textFieldRX1.text = textFieldTX2.text
                textFieldRX3.text = textFieldTX2.text

                if(sendto === 3)
                {
                    textFieldRX1.text = textFieldTX2.text
                }
                if(sendto === 6)
                {
                    textFieldRX3.text = textFieldTX2.text
                }
            }

            if(avion[0] === 1 && sendto === 3)
            {
                textFieldRX2.text = textFieldTX1.text
            }

            else if (avion[2] === 1 && sendto === 6)
            {
                textFieldRX2.text = textFieldTX3.text
            }
        }

        function sendFunction3() {
            if(avion[2] === 1)
            {
                textFieldRX1.text = textFieldTX3.text
                textFieldRX2.text = textFieldTX3.text

                if(sendto === 5)
                {
                    textFieldRX1.text = textFieldTX3.text
                }
                if(sendto === 6)
                {
                    textFieldRX2.text = textFieldTX3.text
                }
            }

            if(avion[0] === 1 && sendto === 5)
            {
                textFieldRX3.text = textFieldTX1.text
            }

            else if (avion[1] === 1 && sendto === 6)
            {
                textFieldRX3.text = textFieldTX2.text
            }

        }

        function changeLEDAvion1()
        {
            if(avion[0] === 1 && startSim === true)
            {
                if(sendto === 3)
                {
                    rectangleLED1.color = "#FF0000"
                    rectangleLED2.color = "#00FF00"
                }
                if(sendto === 5)
                {
                    rectangleLED1.color = "#FF0000"
                    rectangleLED3.color = "#00FF00"
                }
            }
        }

        function changeLEDAvion2()
        {
            if(avion[1] === 1 && startSim === true)
            {
                if(sendto === 3) //011
                {
                    rectangleLED1.color = "#00FF00"
                    rectangleLED2.color = "#FF0000"
                }
                if(sendto === 6)//110
                {
                    rectangleLED3.color = "#00FF00"
                    rectangleLED2.color = "#FF0000"
                }
            }
        }

        function changeLEDAvion3()
        {
            if(avion[2] === 1 && startSim === true)
            {
                if(sendto === 5) //101
                {
                    rectangleLED1.color = "#00FF00"
                    rectangleLED3.color = "#FF0000"
                }
                if(sendto === 6)//110
                {
                    rectangleLED2.color = "#00FF00"
                    rectangleLED3.color = "#FF0000"
                }
            }
        }

    }


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


            rectangleLED1.color = "#000000"
            rectangleLED2.color = "#000000"
            rectangleLED3.color = "#000000"

        }
        else
        {
            canvas1.linePosition(0,0,0,0)
            canvas1.clear_canvas()
            canvas1.requestPaint()

            power = false

            spinBoxActiveF.enabled = false
            spinBoxStandByF.enabled = false
            switchAS.enabled = false
            roundButtonUHF.enabled = false
            roundButtonVHF.enabled = false
            dialvolume.enabled = false

            rectangleLED1.color = "#000000"
            rectangleLED2.color = "#000000"
            rectangleLED3.color = "#000000"

            canvas1.clear_canvas()

        }

    }



    buttonDemarr.onClicked: {

        rectanglePlaneLeft.x = 10
        animationTakeOff.start()
        //playAudio(0)
    }


    PropertyAnimation { id: animationSignal;
        targets: [rectangleSignal,rectangleSignal1,rectangleSignal2];
        property: "x";
        to: 800;
        duration: 500
        loops: 3
        property var d: 0

        onStarted: {
            rectangleSignal.visible = true
            rectangleSignal1.visible = true
            rectangleSignal2.visible = true

        }

        onStopped: {
            rectangleSignal.x = 112
            rectangleSignal1.x = 150
            rectangleSignal2.x = 188

            rectangleSignal.visible = false
            rectangleSignal1.visible = false
            rectangleSignal2.visible = false

            console.log(d)
            d++;

            if(d===3)
                animationValid.start()
            else
                animationSignal.start()



        }
    }

    PropertyAnimation { id: animationValid;
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

    PropertyAnimation { id: animationTakeOff;
        targets: [rectanglePlaneLeft];
        property: "x";
        to: 600;
        duration: 2000

        onStarted: {

        }
        onStopped: {


        }
    }

    FlightPlan {
        id: flightplan
        visible: false
        onValidate:{
            flightplan.visible = false
            animationSignal.start()

        }
    }


}//form

