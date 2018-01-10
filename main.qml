import QtQuick 2.9
import QtQuick.Window 2.3
import "fifteen_model.js"
as Model
import "Elements"
Item {
    id: root
    width: 600
    height: 600
    Item {
        id: board
        property int cellSize: Math.min(parent.width, parent.height) / 5
        property
        var model: null

        anchors.centerIn: parent

        width: 4 * cellSize
        height: width

        function startNewGame() {
            board.model = new Model.CreateModel()
            grid.model = board.model
            grid.visible = true
            buttonContainer.visible = false
            menuTexture.visible = false
            startScreen.visible = false
        }

        function cellMove(index) {
            if (board.model.swapWithZero(index)) {

                startScreen.visible = true
                menuTextureImage.source = "Resources/won_texture.png"
                buttonContainer.visible = true
                menuTexture.visible = true
            }
            grid.model = board.model
        }
        // Start Menu
        Rectangle {
            id: startScreen
            anchors.centerIn: parent
            width: parent.width
            height: parent.height
            visible: true
            Button {
                id: startBtn
                anchors.centerIn: parent
                width: parent.width * 1 / 2
                height: parent.height * 1 / 4
                anchors.bottom: closeBtn.top
                source: "Resources/start.png"
                onClicked: board.startNewGame()
            }
            Button {
                id: closeBtn
                width: parent.width * 1 / 2
                height: parent.height * 1 / 4
                anchors.top: startBtn.bottom
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 1 / 4
                anchors.right: parent.right
                anchors.rightMargin: parent.width * 1 / 4
                source: "Resources/end.png"
                onClicked: Qt.quit()
            }
        }
        // Game
        FifteenBoard {
            id: grid
            model: board.model
            visible: false
            cellSize: board.cellSize
            onClicked: if (!menuTexture.visible) board.cellMove(index)
        }
        // Texture
        Item {
            id: menuTexture
            anchors.centerIn: board
            width: board.width
            height: board.height
            opacity: 0.8
            visible: false
            Image {
                id: menuTextureImage
                source: "Resources/texture.png"
                anchors.centerIn: parent
                width: parent.width
                height: parent.height
            }
        }
        // Back/Refresh
        Item {
            id: buttonContainer
            anchors.centerIn: parent
            width: parent.width * 5 / 8
            height: parent.height * 1 / 4
            visible: false
            Button {
                id: backMenuBnt
                anchors.left: parent.left
                width: parent.height
                height: parent.height
                source: "Resources/back_btn.png"
                onClicked: {
                    grid.visible = false
                    buttonContainer.visible = false
                    menuTexture.visible = false
                    startScreen.visible = true
                }
            }
            Button {
                id: refreshMenuBtn
                anchors.right: parent.right
                width: parent.height
                height: parent.height
                source: "Resources/refresh_btn.png"
                onClicked: board.startNewGame()
            }
        }
    }

    MouseArea {
        acceptedButtons: Qt.RightButton
        anchors.fill: parent
        hoverEnabled: true
        onClicked: if (!startScreen.visible) {
            menuTexture.visible = !menuTexture.visible
            buttonContainer.visible = !buttonContainer.visible
        }
    }
}
