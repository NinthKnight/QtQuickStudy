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
            text:"常用功能";
            color: "#98A6B5";
        }


        //扫描收款
        Loader {
            id: buttonScanCode;

            anchors.top: labelCommon.bottom;
            anchors.topMargin: 9;
            anchors.left: parent.left;
            anchors.leftMargin: 4;

            source: "XButton.qml";
            width:106;
            height:112;

            onLoaded: {
                item.buttonNormalImage = "/resources/homeWindow/btn_scancode_normal.png";
                item.buttonPressImage = "/resources/homeWindow/btn_scancode_press.png";
                item.buttonHoverImage = "/resources/homeWindow/btn_scancode_roll.png";
                item.buttonDisableImage = "/resources/homeWindow/btn_scancode_normal.png";
            }
        }

        //记录查询
        Loader {
            id: buttonSearchRecord;

            anchors.top: buttonScanCode.top;
            anchors.left: buttonScanCode.right;

            source: "XButton.qml";
            width:112;
            height:112;

            onLoaded: {
                item.buttonNormalImage = "/resources/homeWindow/btn_searchrecord_normal.png";
                item.buttonPressImage = "/resources/homeWindow/btn_searchrecord_press.png";
                item.buttonHoverImage = "/resources/homeWindow/btn_searchrecord_roll.png";
                item.buttonDisableImage = "/resources/homeWindow/btn_searchrecord_normal.png";
            }
        }


        //广播消息
        Loader {
            id: buttonBroadcast;

            anchors.top: buttonSearchRecord.top;
            anchors.left: buttonSearchRecord.right;


            source: "XButton.qml";
            width:112;
            height:112;

            onLoaded: {
                item.buttonNormalImage = "/resources/homeWindow/btn_broadcast_normal.png";
                item.buttonPressImage = "/resources/homeWindow/btn_broadcast_press.png";
                item.buttonHoverImage = "/resources/homeWindow/btn_broadcast_roll.png";
                item.buttonDisableImage = "/resources/homeWindow/btn_broadcast_normal.png";
            }
        }

        //音量调节
        Loader {
            id: buttonVolumeset;

            anchors.top: buttonBroadcast.top;
            anchors.left: buttonBroadcast.right;


            source: "XButton.qml";
            width:112;
            height:112;

            onLoaded: {
                item.buttonNormalImage = "/resources/homeWindow/btn_volumeset_normal.png";
                item.buttonPressImage = "/resources/homeWindow/btn_volumeset_press.png";
                item.buttonHoverImage = "/resources/homeWindow/btn_volumeset_roll.png";
                item.buttonDisableImage = "/resources/homeWindow/btn_volumeset_normal.png";
            }
        }

        //顾客消息
        Loader {
            id: buttonClientChat;

            anchors.top: buttonVolumeset.top;
            anchors.left: buttonVolumeset.right;


            source: "XButton.qml";
            width:112;
            height:112;

            onLoaded: {
                item.buttonNormalImage = "/resources/homeWindow/btn_clientchat_normal.png";
                item.buttonPressImage = "/resources/homeWindow/btn_clientchat_press.png";
                item.buttonHoverImage = "/resources/homeWindow/btn_clientchat_roll.png";
                item.buttonDisableImage = "/resources/homeWindow/btn_clientchat_normal.png";
            }
        }

        //机位图
        Loader {
            id: buttonNetbarSeat;

            anchors.top: buttonClientChat.top;
            anchors.left: buttonClientChat.right;


            source: "XButton.qml";
            width:112;
            height:112;

            onLoaded: {
                item.buttonNormalImage = "/resources/homeWindow/btn_netbarseat_normal.png";
                item.buttonPressImage = "/resources/homeWindow/btn_netbarseat_press.png";
                item.buttonHoverImage = "/resources/homeWindow/btn_netbarseat_roll.png";
                item.buttonDisableImage = "/resources/homeWindow/btn_netbarseat_normal.png";
            }
        }

        //数据上传
        Loader {
            id: buttonUploadSale;

            anchors.top: buttonNetbarSeat.top;
            anchors.left: buttonNetbarSeat.right;


            source: "XButton.qml";
            width:112;
            height:112;

            onLoaded: {
                item.buttonNormalImage = "/resources/homeWindow/btn_uploadsale_normal.png";
                item.buttonPressImage = "/resources/homeWindow/btn_uploadsale_press.png";
                item.buttonHoverImage = "/resources/homeWindow/btn_uploadsale_roll.png";
                item.buttonDisableImage = "/resources/homeWindow/btn_uploadsale_normal.png";
            }
        }



    }



}
