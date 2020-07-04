import QtQuick 2.15
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
        Rectangle {
            anchors {
                left: parent.left
                right: parent.right
            }
            color: "pink"
            height: textButton.height + 10
            Text {
                id: textButton
                anchors.centerIn: parent
                text: qsTr("Click me")
            }
            MouseArea {
                anchors.fill: parent
                onClicked: counter.increaseCount()
            }
        }
    }
}
