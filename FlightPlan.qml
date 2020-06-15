import QtQuick 2.4
import QtQuick 2.14
import QtQuick.Controls 2.14

FlightPlanForm {

    id:flightplanform
    signal validate()


    button.onClicked: {
        var d = 0
        flightplanform.validate()

   }


}//form

