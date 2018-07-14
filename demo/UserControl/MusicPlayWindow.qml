import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.1

Rectangle {
    id:homeWindow;

    width: 843;
    height: 624;
    visible: true;

    Image{
        id:labelUIImg;
        anchors.left: parent.left;
        anchors.top: parent.top;
        source: "/resources/background/bk04.png";
    }

    Rectangle {
        id: commonRect;

        anchors.left: parent.left;
        anchors.leftMargin: 30;
        anchors.top: parent.top;
        anchors.topMargin: 10;


        Image{
            id:labelButtomImg;
            anchors.left: parent.left;
            anchors.top: parent.top;
            source: "/resources/homeWindow/bk_you.png";
        }


        Text {
            id: labelCommon;
            anchors.left: parent.left;
            anchors.leftMargin: 20;
            anchors.top: parent.top;
            anchors.topMargin: 10;
            font.pixelSize: 14;
            font.bold: true;
            text:"音乐播放";
            color: "#98A6B5";
        }
    }



}
