import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

import io.rainbyte.hello 1.0

Window {
    visible: true
    width: 1280
    height: 720
    title: qsTr("Hello Qt Qml")

    Counter {
        id: counter
    }

    Column {
        anchors.centerIn: parent
        Text {
            text: qsTr("Hello! This is Qt Qml")
        }
        Text {
            id: textCount
            text: qsTr("Clicks: ") + counter.count
        }
        Button {
            anchors {
                left: parent.left
                right: parent.right
            }
            text: qsTr("Click me")
            onClicked: counter.increaseCount()
        }
    }
}
