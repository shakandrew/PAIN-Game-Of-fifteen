import QtQuick 2.0

Rectangle {
    id: button
    property alias text: buttonText.text
    property alias source: image.source
    signal clicked
    color: "transparent"
    width: buttonText.width + 20
    height: 30
    radius: 5
    antialiasing: true
    Text {
        id: buttonText
        text: parent.description
        anchors.centerIn: parent
        font.pixelSize: parent.height * .5
        style: Text.Sunken
        color: "white"
        styleColor: "black"
    }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: parent.clicked()
    }
    Image {
        id: image
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
    }
}
