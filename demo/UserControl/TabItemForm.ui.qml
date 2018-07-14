import QtQuick 2.9
import QtQuick.Controls 2.2

Item {
    id: item1
    width: 177
    height: 50

    property alias mouseArea: mouseArea
    property alias source: itemImage.source

    Image {
        id: itemImage
        width: 177
        height: 50
        source: null
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.verticalCenter: parent.verticalCenter

        MouseArea {
            id: mouseArea
            hoverEnabled: true
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
        }
    }
}
