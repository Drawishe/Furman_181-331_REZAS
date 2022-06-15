import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.5

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Лабораторная работа №2. Менеджер паролей. Фурман Кирилл 181-331")
    GridLayout{
        id: accessDenied
        anchors.fill: parent
        visible: false
        rows: 2
        columns: 3
        Rectangle{
            color: "salmon"
            anchors.fill: parent
        }
        Item{
            Layout.column: 0
            Layout.row: 0
            Layout.rowSpan: 2
            Layout.fillWidth: true
        }

        Item{
            Layout.column: 2
            Layout.row: 0
            Layout.rowSpan: 2
            Layout.fillWidth: true
        }
        Label{
            Layout.row: 1
            Layout.column: 1
            text: "Доступ запрещен!"
            font.pixelSize: 25
            //font.family: consolas
        }
        Button{
            id: accessDeniedTryAgain
            Layout.column: 1
            Layout.row: 2
            Layout.alignment: Qt.AlignCenter | Qt.AlignVCenter
            background: Rectangle{
                color: "#e66761"
                radius: 5
            }
            contentItem: Text {

                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: qsTr("Попробовать еще")
            }
            onClicked: {
                authScreen.visible = true
                accessDenied.visible = false
            }
        }
    }
    GridLayout{
        id: accessGranted
        anchors.fill: parent
        visible: false
        rows: 2
        columns: 3
        Rectangle{
            color: "palegreen"
            anchors.fill: parent
        }
        Item{
            Layout.column: 0
            Layout.row: 0
            Layout.rowSpan: 2
            Layout.fillWidth: true
        }

        Item{
            Layout.column: 2
            Layout.row: 0
            Layout.rowSpan: 2
            Layout.fillWidth: true
        }
        Label{
            Layout.row: 1
            Layout.column: 1
            text: "Доступ разрешен!"
            font.pixelSize: 25
            //font.family: consolas
        }
        Button{
            id: accessGrantedNext
            Layout.column: 1
            Layout.row: 2
            Layout.alignment: Qt.AlignCenter | Qt.AlignVCenter
            background: Rectangle{
                color: "#77dd77"
                radius: 5
            }
            contentItem: Text {

                            font.pixelSize: 20
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: qsTr("Продолжить")
            }
            onClicked: {
                authScreen.visible = false
                accessGranted.visible = false
                scrollView.visible = true
                listView.visible = true
               //listView.visible = true
            }
        }

    }
    GridLayout{
        id: authScreen
        anchors.fill: parent
        rows: 4
        columns: 3
        Rectangle {
                id:background
                color: "cyan"
                anchors.fill: parent
        }
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
//            //font.family: consolas
            text: "Введите PIN-код"
         }

        TextField{
            Layout.column: 1
            Layout.row: 2
            id: key
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
                radius: 5
            }
        }

        Button{
            Layout.column: 1
            Layout.row: 3
            id: authButton
            Layout.alignment: Qt.AlignCenter | Qt.AlignVCenter
            background: Rectangle{
                color: "#008b8b"
                radius: 5
            }
            contentItem: Text {
                            font.pixelSize: 20
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: qsTr("Войти")

                        }
                        onClicked: {
                           //accessDenied.visible = true
//                            authScreen.visible = false
                           //accessGranted.visible = true
                            if(makerDeff.parserFunc(key.text, "") === false){
                                accessDenied.visible = true
                                authScreen.visible = false
                            }
                            else {
                                accessDenied.visible = false
                                authScreen.visible = false
                                accessGranted.visible = true

                            //    key.visible = false
                            //    labelauth.visible = false
                            //    scrollview.visible = true
                            //    auth.visible = false

                            }
                        }
                    }




    }
    ScrollView{
        id: scrollView
        anchors.fill: parent
        visible: false
        Layout.fillWidth: true
        Rectangle {
                color: "cyan"
                anchors.fill: parent
        }
        Item {}

        ColumnLayout{
            anchors.fill: parent
            TextField{
                id: searchin
                Layout.fillWidth: true
                visible: true
                cursorVisible: false
                placeholderText: "Поиск"
                Layout.margins: 20
                color: "black"
                font.pixelSize: 20
                onEditingFinished: {
                    makerDeff.parserFunc(key.text, searchin.text)
                    //                    listView.model.roleNames().forEach(el => console.log(el))
                }
                background: Rectangle{
                    color: "#008b8b"
                    radius: 5
                }
            }

            ListView{
                id: listView
                Layout.margins: 20
                visible: false
                Layout.fillHeight: true
                Layout.fillWidth: true
                enabled: true
                model: sicretsmodal
                spacing: 10
                anchors.margins: 5

                delegate: Rectangle{
                    anchors.margins: 5
                    width: listView.width
                    height: 120
                    border.color: "grey"
                    radius: 10


                    GridLayout{
                        anchors.fill: parent
                        columns: 4

                        Image{
                            //                            source: "img/back.jpg"

                            Layout.rowSpan: 3
                            Layout.fillHeight: true
                            Layout.preferredWidth: 100
                            Layout.margins: 5
                            fillMode: Image.PreserveAspectFit
                            Layout.alignment: Qt.AlignCenter
                        }
                        Label{
                            color: "black"
                            Layout.alignment: Qt.AlignVCenter
                            text: urlka
                            Layout.rowSpan: 3
                            Layout.preferredWidth: 120
                        }

                        Button {
                            id: givemelogin
                            Layout.alignment: Qt.AlignVCenter
                            Layout.rowSpan: 3
                            Layout.preferredWidth: 170
                            contentItem: Text {
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                text: "Скопировать логин"
                                font.pixelSize: 15
                            }
                            onClicked: {
                                popup.open()
                                indexField.text = index
                                typeField.text = "login"
                            }
                        }


                        Button {
                            id: givemepassword
                            Layout.alignment: Qt.AlignVCenter
                            Layout.rowSpan: 3
                            Layout.preferredWidth: 170
                            contentItem: Text {
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                text: "Скопировать пароль"
                                font.pixelSize: 15
                            }
                            onClicked: {
                                popup.open()
                                indexField.text = index
                                typeField.text = "password"
                            }
                        }
                    }
                }
            }
        }


    }

    Popup{
        id: popup
        parent: Overlay.overlay
        x: Math.round((parent.width - width) / 2)
        y: Math.round((parent.height - height) / 2)
        width: 400
        height: 350
        modal: true
        ColumnLayout{
            Layout.fillWidth: true
            anchors.fill: parent
            TextField{
                id: popuppin
                placeholderText: "Введите ключ шифрования"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                Layout.alignment: Qt.AlignCenter
                Layout.fillWidth: true
                Layout.margins: 20
                color: "black"
                font.pixelSize: 15

            }

            Label {
                id: indexField
                text: ""
                visible: false
            }

            Label {
                id: typeField
                text: ""
                visible: false
            }

            Button {
                id: popupClose
                Layout.alignment: Qt.AlignCenter
                contentItem: Text {
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: qsTr("Получить данные")
                    font.pixelSize: 20

                }
                onClicked: {
                    makerDeff.copyToBufBarter(indexField.text, typeField.text, popuppin.text)
                    popup.close()
                    popuppin.clear()
                    indexField.text = ""
                    typeField.text = ""
                }
            }
        }
    }

}
