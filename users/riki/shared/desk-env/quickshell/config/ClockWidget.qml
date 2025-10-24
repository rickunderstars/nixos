// ClockWidget.qml
import QtQuick

Rectangle {
	
    anchors.centerIn: parent
    color: "red"
    height: wow.height + 2
    width: wow.width + 2
    Text {
        id: wow
        anchors.centerIn: parent
        color: "white"
        text: Time.time
    }
}
