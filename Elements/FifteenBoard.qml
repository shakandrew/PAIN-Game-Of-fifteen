import QtQuick 2.0

Repeater {
    id: grid
    signal clicked(int index)
    property int cellSize: 100
    Rectangle {
        id: cell
        property int value: grid.model[index]
        property int row: index / 4
        property int col: index % 4

        width: parent.cellSize
        height: parent.cellSize
        x: col * width
        y: row * height
        visible: grid.visible

        border {
            color: "black";width: 1
        }
        color: Qt.hsla(1 - value / 25, 1 - value / 25, 1 - value / 25)

        Text {
            id: cellText
            anchors.centerIn: parent
            text: parent.value == 0 ? "" : parent.value
            font {
                pixelSize: parent.height / 2
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: grid.clicked(index)
            hoverEnabled: true
        }
    }
}
