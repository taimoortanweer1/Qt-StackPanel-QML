import QtQuick 2.4

SimulationSolForm {

    id:simuSol
    signal incPage(var value)
    signal decPage(var value)

    property var avion: [0,0,0] //which is the active plane
    property bool power: false //powr of the selector panel

    property var lineCanvas: [0,0,0,0] //line position
    property var sendto: 1 //which plane to send data
    //0x03 one and two exchange
    //0x05 one and three exchange
    //0x06 two and three exchange

    property var startSim: false
    textFieldTX2.onPressed: {
        textFieldTX2.text = ""
    }
    textFieldTX1.onPressed: {
        textFieldTX1.text = ""
    }
    textFieldTX3.onPressed: {
        textFieldTX3.text = ""
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

    textFieldTX1.onTextChanged: {
        canvas1.changeLEDAvion1()
    }

    textFieldTX2.onTextChanged: {
        canvas1.changeLEDAvion2()
    }

    textFieldTX3.onTextChanged: {
        canvas1.changeLEDAvion3()
    }
    textFieldTX1.onEditingFinished: {

        if(startSim === true)
            canvas1.sendFunction1()



    }
    textFieldTX2.onEditingFinished: {

        if(startSim === true)
            canvas1.sendFunction2()

    }

    textFieldTX3.onEditingFinished: {

        if(startSim === true)
            canvas1.sendFunction3()

    }

    buttonAide.onClicked: {

        simuSol.incPage(1);
    }


    buttonDemarr.onToggled: {

        if(buttonDemarr.checked)
        {
            startSim = true
            //sliderAV1.enabled = true
            //sliderAV2.enabled = true
            //sliderAV3.enabled = true


            if(avion[0] === 1)
            {
                sliderAV1.enabled = true
                sliderAV2.enabled = false
                sliderAV3.enabled = false

                rectangleLED1.color = "#FF0000"
                rectangleLED2.color = "#00FF00"
                rectangleLED3.color = "#00FF00"

            }
            else if(avion[1] === 1)
            {
                sliderAV2.enabled = true
                sliderAV1.enabled = false
                sliderAV1.enabled = false

                rectangleLED2.color = "#FF0000"
                rectangleLED1.color = "#00FF00"
                rectangleLED3.color = "#00FF00"
            }
            else if(avion[2] === 1)
            {
                sliderAV3.enabled = true
                sliderAV1.enabled = false
                sliderAV2.enabled = false

                rectangleLED3.color = "#FF0000"
                rectangleLED1.color = "#00FF00"
                rectangleLED2.color = "#00FF00"
            }


        }
        else
        {
            canvas1.linePosition(0,0,0,0)
            canvas1.clear_canvas()
            canvas1.requestPaint()

            startSim = false
            textFieldRX1.text = ""
            textFieldRX2.text = ""
            textFieldRX3.text = ""
            textFieldTX1.text = ""
            textFieldTX2.text = ""
            textFieldTX3.text = ""
            sliderAV1.enabled = false
            sliderAV2.enabled = false
            sliderAV3.enabled = false
            rectangleLED1.color = "black"
            rectangleLED2.color = "black"
            rectangleLED3.color = "black"
        }


    }


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
        { power = true
            spinBoxActiveF.enabled = true
            spinBoxStandByF.enabled = true
            switchAS.enabled = true
            roundButtonUHF.enabled = true
            roundButtonVHF.enabled = true
            dialvolume.enabled = true
            sliderAVSelect.enabled = true


            sliderAV3.enabled = true
            sliderAV1.enabled = true
            sliderAV2.enabled = true

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
            sliderAVSelect.enabled = false

            sliderAV3.enabled = false
            sliderAV1.enabled = false
            sliderAV2.enabled = false

            rectangleLED1.color = "#000000"
            rectangleLED2.color = "#000000"
            rectangleLED3.color = "#000000"

            textFieldRX1.text = ""
            textFieldRX2.text = ""
            textFieldRX3.text = ""
            textFieldTX1.text = ""
            textFieldTX2.text = ""
            textFieldTX3.text = ""

            canvas1.clear_canvas()

        }

    }

    sliderAV3.onValueChanged: {

        if(avion[2] === 1)
        {
            if(sliderAV3.value == 0) {
                sendto = 6
                avion = [0,1,1]
                rectangleLED1.color = "#00FF00"
                rectangleLED2.color = "#00FF00"
                rectangleLED3.color = "#FF0000"

                canvas1.linePosition(sliderAV3.x,sliderAV3.y,sliderAV2.x,sliderAV2.y)
            }

            if(sliderAV3.value == 10) {
                sendto = 5
                avion = [1,0,1]
                rectangleLED1.color = "#00FF00"
                rectangleLED2.color = "#00FF00"
                rectangleLED3.color = "#FF0000"

                canvas1.linePosition(sliderAV3.x,sliderAV3.y,sliderAV1.x,sliderAV1.y)

            }
        }
        canvas1.clear_canvas()
        canvas1.requestPaint()

    }
    sliderAV2.onValueChanged: {

        if(avion[1] === 1)
        {
            if(sliderAV2.value == 0) {

                sendto = 6
                avion = [0,1,1]

                rectangleLED1.color = "#00FF00"
                rectangleLED2.color = "#FF0000"
                rectangleLED3.color = "#00FF00"
                canvas1.linePosition(sliderAV2.x,sliderAV2.y,sliderAV3.x,sliderAV3.y)
            }

            if(sliderAV2.value == 10) {
                sendto = 3
                avion = [1,1,0]

                rectangleLED1.color = "#00FF00"
                rectangleLED2.color = "#FF0000"
                rectangleLED3.color = "#00FF00"

                canvas1.linePosition(sliderAV2.x,sliderAV2.y,sliderAV1.x,sliderAV1.y)
            }
        }

        canvas1.clear_canvas()
        canvas1.requestPaint()


    }
    sliderAV1.onValueChanged: {

        if(avion[0] === 1)
        {
            if(sliderAV1.value == 0) {
                sendto = 5
                avion = [1,0,1]
                rectangleLED1.color = "#FF0000"
                rectangleLED2.color = "#00FF00"
                rectangleLED3.color = "#00FF00"

                canvas1.linePosition(sliderAV1.x,sliderAV1.y,sliderAV3.x,sliderAV3.y)
            }

            if(sliderAV1.value == 10) {
                sendto = 3
                avion = [1,1,0]
                rectangleLED1.color = "#FF0000"
                rectangleLED2.color = "#00FF00"
                rectangleLED3.color = "#00FF00"
                canvas1.linePosition(sliderAV1.x,sliderAV1.y,sliderAV2.x,sliderAV2.y)

            }

        }

        canvas1.clear_canvas()
        canvas1.requestPaint()

    }

    sliderAVSelect.onValueChanged: {

        if(power === true)
        {
            if(sliderAVSelect.value == 0)
            {
                avion[0] = 1
                avion[1] = 0
                avion[2] = 0

                rectangleLED1.color = "#FF0000"
                rectangleLED2.color = "#00FF00"
                rectangleLED3.color = "#00FF00"

                sliderAV1.enabled = true
                sliderAV2.enabled = false
                sliderAV3.enabled = false

            }


            if(sliderAVSelect.value == 5)
            {
                avion[0] = 0
                avion[1] = 1
                avion[2] = 0


                rectangleLED1.color = "#00FF00"
                rectangleLED2.color = "#FF0000"
                rectangleLED3.color = "#00FF00"

                sliderAV2.enabled = true
                sliderAV1.enabled = false
                sliderAV3.enabled = false
            }

            if(sliderAVSelect.value == 10)
            {
                avion[0] = 0
                avion[1] = 0
                avion[2] = 1

                rectangleLED1.color = "#00FF00"
                rectangleLED2.color = "#00FF00"
                rectangleLED3.color = "#FF0000"

                sliderAV3.enabled = true
                sliderAV1.enabled = false
                sliderAV2.enabled = false
            }
        }
        canvas1.clear_canvas()

    }

}//form

