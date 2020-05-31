import QtQuick 2.4

SimulationSolForm {

    signal requestStackChange(var stack, var properties)

    property var avion: [0,0,0]
    property bool power: false

    property var lineCanvas: [0,0,0,0]
    property var sendto: 1
    property var startSim: false
    buttonAide.onClicked: {

        requestStackChange("12_aide.qml", {});
    }

    textFieldTX3.onEditingFinished: {
        canvas1.sendFunction()

}
    buttonDemarr.onToggled: {
        startSim = true


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

        function sendFunction()
        {
            if(avion[0] === 1)
            {
                if(sendto === 2)
                {
                    textFieldRX2.text = textFieldTX1.text
                }
                if(sendto === 3)
                {
                    textFieldRX3.text = textFieldTX1.text
                }
            }

            if(avion[1] === 1)
            {
                if(sendto === 1)
                {
                    textFieldRX1.text = textFieldTX2.text
                }
                if(sendto === 3)
                {
                    textFieldRX3.text = textFieldTX2.text
                }
            }

            if(avion[2] === 1)
            {
                if(sendto === 1)
                {
                    textFieldRX1.text = textFieldTX3.text
                }
                if(sendto === 2)
                {
                    textFieldRX2.text = textFieldTX3.text
                }
            }

        }

    }





    switchOnOff.onToggled: {
        if(switchOnOff.checked)
        { power = true}
        else
        {power = false}

    }

    sliderAV3.onValueChanged: {

        if(avion[2] === 1)
        {
            if(sliderAV3.value == 0) {
                sendto = 2
                rectangleLED1.color = "#FF0000"
                rectangleLED2.color = "#00FF00"

                canvas1.linePosition(sliderAV3.x,sliderAV3.y,sliderAV2.x,sliderAV2.y)
            }

            if(sliderAV3.value == 10) {
                sendto = 1
                rectangleLED2.color = "#FF0000"
                rectangleLED1.color = "#00FF00"

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

                sendto = 3
                rectangleLED3.color = "#00FF00"
                rectangleLED1.color = "#FF0000"
                canvas1.linePosition(sliderAV2.x,sliderAV2.y,sliderAV3.x,sliderAV3.y)
            }

            if(sliderAV2.value == 10) {
                sendto = 1
                rectangleLED3.color = "#FF0000"
                rectangleLED1.color = "#00FF00"
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
                sendto = 3
                rectangleLED2.color = "#FF0000"
                rectangleLED3.color = "#00FF00"

                canvas1.linePosition(sliderAV1.x,sliderAV1.y,sliderAV3.x,sliderAV3.y)
            }

            if(sliderAV1.value == 10) {
                sendto = 2
                rectangleLED3.color = "#FF0000"
                rectangleLED2.color = "#00FF00"
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
            }


            if(sliderAVSelect.value == 5)
            {
                avion[0] = 0
                avion[1] = 1
                avion[2] = 0


                rectangleLED1.color = "#00FF00"
                rectangleLED2.color = "#FF0000"
                rectangleLED3.color = "#00FF00"
            }

            if(sliderAVSelect.value == 10)
            {
                avion[0] = 0
                avion[1] = 0
                avion[2] = 1

                rectangleLED1.color = "#00FF00"
                rectangleLED2.color = "#00FF00"
                rectangleLED3.color = "#FF0000"
            }
        }
        canvas1.clear_canvas()

    }

}//form

