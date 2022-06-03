import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.5

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Лабораторная работа №2. Менеджер паролей. Фурман Кирилл 181-331")
    Rectangle {
            id:background
            color: "cyan"
            anchors.fill: parent
        }
    GridLayout{
        anchors.fill: parent
        rows: 4
        columns: 3
        Item{
            Layout.column: 0
            Layout.row: 0
            Layout.rowSpan: 3
            Layout.fillWidth: true
        }

        Item{
            Layout.column: 2
            Layout.row: 0
            Layout.rowSpan: 3
            Layout.fillWidth: true
        }

        Label {
            Layout.row: 1
            Layout.column: 1
            id: authLabel
            font.pixelSize: 25
            font.family: consolas
            text: "Введите PIN-код"
         }

        TextField{
            Layout.column: 1
            Layout.row: 2
            id: pin
            visible: true
            cursorVisible: false
            placeholderText: "PIN"
            echoMode: TextField.Password
            passwordCharacter: "X"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.alignment: Qt.AlignCenter | Qt.AlignVCenter
            color: "black"
            font.pixelSize: 20
            background: Rectangle{
                color: "#008b8b"
            }
        }

        Button{
            Layout.column: 1
            Layout.row: 3
            id: authButton
            Layout.alignment: Qt.AlignCenter | Qt.AlignVCenter
            background: Rectangle{
                color: "#008b8b"
            }
            contentItem: Text {
                            font.pixelSize: 20
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: qsTr("Войти")

                        }

                        
                    }




    }



}
