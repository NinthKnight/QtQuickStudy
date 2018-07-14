import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.1

Window {
        id:mainWindow;
        visible: true
        width: 1020
        height: 720
        color: "#798792"
        flags: Qt.FramelessWindowHint;

        property point startPoint: Qt.point(0, 0);
        property point offsetPoint: Qt.point(0, 0);
        property  bool isMoveMainWindow: false;

        //标题栏
        Rectangle {
            id:titleBarRectangle;
            visible: true;
            anchors.left: parent.left;
            anchors.top: parent.top;
            width: mainWindow.width;
            height: 65;

            //标题栏左边
            Rectangle{
                id: labelNetbar;
                width: 177;
                height: 65;
                Image{
                    id:labelNetbarImg;
                    anchors.left: parent.left;
                    anchors.top: parent.top;
                    source: "/resources/background/bk01.png";
                }

                Text {
                    id:labelNetbarText;
                    anchors.left: labelNetbar.left;
                    anchors.leftMargin: 40;
                    anchors.top: parent.top;
                    anchors.topMargin: 20;
                    font.pixelSize: 20;
                    font.bold: true;
                    text:"卫士网吧";
                    color: "white";
                }
            }

            //标题栏右边
            Rectangle{
                id: labelMenu;
                anchors.right: parent.right;
                anchors.top: parent.top;
                width: 843;
                height: 65;
                Image{
                    id:labelMenuImg;
                    anchors.left: parent.left;
                    anchors.top: parent.top;
                    source: "/resources/background/bk02.png";
                }


                //云平台按钮
                Loader {
                    id: closeCloudLogin;
                    anchors.top: parent.top;
                    anchors.topMargin: 10;
                    anchors.left: parent.left;
                    anchors.leftMargin: 10;
                    source: "XButton.qml";

                    onLoaded: {
                        item.buttonNormalImage = "/resources/UpMenuImage/btn_cloudLogin_normal.png";
                        item.buttonPressImage = "/resources/UpMenuImage/btn_cloudLogin_press.png";
                        item.buttonHoverImage = "/resources/UpMenuImage/btn_cloudLogin_roll.png";
                        item.buttonDisableImage = "/resources/UpMenuImage/btn_cloudLogin_normal.png";
                        item.width = 120;
                        item.height = 41;

                    }

                }

                //云平台按钮
                Loader {
                    id: closeVipPress;
                    anchors.top: parent.top;
                    anchors.topMargin: 10;
                    anchors.left: closeCloudLogin.right;
                    anchors.leftMargin: 10;
                    source: "XButton.qml";

                    onLoaded: {
                        item.buttonNormalImage = "/resources/UpMenuImage/btn_vip_press.png";
                        item.buttonPressImage = "/resources/UpMenuImage/btn_vip_roll.png";
                        item.buttonHoverImage = "/resources/UpMenuImage/btn_vip_roll.png";
                        item.buttonDisableImage = "/resources/UpMenuImage/btn_vip_press.png";
                        item.width = 91;
                        item.height = 41;
                    }
                }


            }

            MouseArea{
                id:mouseMoveWindowArea;
                anchors.fill: parent;
                onPressed: {
                    //cursorShape = Qt.DragMoveCursor;
                    mainWindow.startPoint = Qt.point(mouseX, mouseY);
                    mainWindow.isMoveMainWindow = true;
                }
                onPositionChanged: {
                    mainWindow.offsetPoint = Qt.point(mouseX - mainWindow.startPoint.x,
                                                      mouseY - mainWindow.startPoint.y);
                    if(mainWindow.isMoveMainWindow == true)
                    {
                        mainWindow.x = mainWindow.x + mainWindow.offsetPoint.x;
                        mainWindow.y = mainWindow.y + mainWindow.offsetPoint.y;
                    }
                }
                onReleased: {
                    cursorShape = Qt.ArrowCursor;
                    mainWindow.isMoveMainWindow = false;
                }
            }

            Loader {
                id: closeButtonLoader;
                anchors.right: titleBarRectangle.right;
                anchors.rightMargin: 10;
                anchors.top: titleBarRectangle.top;
                anchors.topMargin: 10;
                source: "XButton.qml";

                onLoaded: {
                    item.buttonNormalImage = "/resources/buttonImage/close_normal.png";
                    item.buttonPressImage = "/resources/buttonImage/close_down.png";
                    item.buttonHoverImage = "/resources/buttonImage/close_hover.png";
                    item.buttonDisableImage = "/resources/buttonImage/close_disable.png";
                    item.width = 23;
                    item.height = 18;

                }

            }

            Loader{
                id:miniSizeButtonLoader;
                anchors.right: closeButtonLoader.left;
                anchors.top: closeButtonLoader.top;
                source: "XButton.qml";

                onLoaded: {
                    item.buttonNormalImage = "/resources/buttonImage/min_normal.png";
                    item.buttonPressImage = "/resources/buttonImage/min_down.png";
                    item.buttonHoverImage = "/resources/buttonImage/min_hover.png";
                    item.buttonDisableImage = "/resources/buttonImage/min_disable.png";
                    item.width = 23;
                    item.height = 18;
                }
            }

            Loader {
                id: menuButtonLoader;
                anchors.right: miniSizeButtonLoader.left;
                anchors.top: miniSizeButtonLoader.top;
                source: "XButton.qml";

                onLoaded: {
                    item.buttonNormalImage = "/resources/buttonImage/menu_normal.png";
                    item.buttonPressImage = "/resources/buttonImage/menu_down.png";
                    item.buttonHoverImage = "/resources/buttonImage/menu_hover.png";
                    item.buttonDisableImage = "/resources/buttonImage/menu_disable.png";
                    item.width = 23;
                    item.height = 18;
                }
            }

            Connections {
                target: closeButtonLoader.item;
                onClicked: {
                    mainWindow.close();
                }
            }

            Connections {
                target: miniSizeButtonLoader.item
                onClicked: {
                    mainWindow.showMinimized();
                }
            }
        }

        //主界面区 web ui
        //左边按钮
        Rectangle{
            id:mainMenuRectangle;
            anchors.top: titleBarRectangle.bottom;
            anchors.left: mainWindow.left;

            width: 177;
            height: 624;

            property int nCurrentSelected: buttonHome.nHome
            function setPressImage(){

                //buttonHome.item.buttonNormalImage = "/resources/leftMenuImage/btn_menu_home_normal.png";
                //buttonMusicPlay.item.buttonNormalImage = "/resources/leftMenuImage/btn_menu_musicplay_normal.png";

                emit: buttonHome.item.updated();
                emit: buttonMusicPlay.item.updated();

                if (nCurrentSelected == buttonHome.nHome){
                    emit: buttonHome.item.pressed();
                }
                else if (nCurrentSelected == buttonMusicPlay.nMusicPlay){
                    //buttonMusicPlay.item.buttonNormalImage = "/resources/leftMenuImage/btn_menu_musicplay_press.png";
                    emit: buttonMusicPlay.item.pressed();
                }



            }


            Image{
                id:labelLeftMenuImg;
                anchors.left: parent.left;
                anchors.top: parent.top;
                source: "/resources/background/bk03.png";
            }

            //主页
            Loader {
                id: buttonHome;
                anchors.left: parent.left;
                anchors.top: parent.top;
                source: "XButton.qml";
                property int nHome: 1

                onLoaded: {
                    item.buttonNormalImage = "/resources/leftMenuImage/btn_menu_home_normal.png";
                    item.buttonPressImage = "/resources/leftMenuImage/btn_menu_home_press.png";
                    item.buttonHoverImage = "/resources/leftMenuImage/btn_menu_home_roll.png";
                    item.buttonDisableImage = "/resources/leftMenuImage/btn_menu_home_normal.png";
                    item.width = 177;
                    item.height = 50;
                }


                Connections {
                    target: buttonHome.item;
                    onClicked: {
                        mainUIRectangleLoader.source = "HomeWindow.qml";
                        mainMenuRectangle.nCurrentSelected = buttonHome.nHome;
                        mainMenuRectangle.setPressImage();
                    }

                    onPressed:{
                        buttonHome.item.buttonNormalImage = "/resources/leftMenuImage/btn_menu_home_press.png";
                        console.log("buttonHome onPressed");
                    }

                    onUpdated:{
                        buttonHome.item.buttonNormalImage = "/resources/leftMenuImage/btn_menu_home_normal.png";
                        emit: buttonHome.item.buttonMouseArea.pressed();
                        console.log("buttonHome OnUpdated");
                    }
                }

            }

            //音乐点播
            Loader {
                id: buttonMusicPlay;
                anchors.left: buttonHome.left;
                anchors.top: buttonHome.bottom;
                source: "XButton.qml";
                property int nMusicPlay: 2

                onLoaded: {
                    item.buttonNormalImage = "/resources/leftMenuImage/btn_menu_musicplay_normal.png";
                    item.buttonPressImage = "/resources/leftMenuImage/btn_menu_musicplay_press.png";
                    item.buttonHoverImage = "/resources/leftMenuImage/btn_menu_musicplay_roll.png";
                    item.buttonDisableImage = "/resources/leftMenuImage/btn_menu_musicplay_normal.png";
                    item.width = 177;
                    item.height = 50;
                }
                Connections {
                    target: buttonMusicPlay.item;
                    onClicked: {
                        mainUIRectangleLoader.source = "MusicPlayWindow.qml";
                        mainMenuRectangle.nCurrentSelected = buttonMusicPlay.nMusicPlay;
                        mainMenuRectangle.setPressImage();
                    }
                    onPressed:{
                        buttonMusicPlay.item.buttonNormalImage = "/resources/leftMenuImage/btn_menu_musicplay_press.png";
                        console.log("buttonMusicPlay onPressed");
                    }

                    onUpdated:{
                        buttonMusicPlay.item.buttonNormalImage = "/resources/leftMenuImage/btn_menu_musicplay_normal.png";
                        console.log("buttonMusicPlay OnUpdated");
                    }
                }
            }

            //奖品派发
            Loader {
                id: buttonPrizeSend;
                anchors.left: buttonMusicPlay.left;
                anchors.top: buttonMusicPlay.bottom;
                source: "XButton.qml";

                onLoaded: {
                    item.buttonNormalImage = "/resources/leftMenuImage/btn_menu_prizesend_normal.png";
                    item.buttonPressImage = "/resources/leftMenuImage/btn_menu_prizesend_press.png";
                    item.buttonHoverImage = "/resources/leftMenuImage/btn_menu_prizesend_roll.png";
                    item.buttonDisableImage = "/resources/leftMenuImage/btn_menu_prizesend_normal.png";
                    item.width = 177;
                    item.height = 50;
                }
            }

            //留言版
            Loader {
                id: buttonLeaveMsg;
                anchors.left: buttonPrizeSend.left;
                anchors.top: buttonPrizeSend.bottom;
                source: "XButton.qml";

                onLoaded: {
                    item.buttonNormalImage = "/resources/leftMenuImage/btn_menu_leavemsg_normal.png";
                    item.buttonPressImage = "/resources/leftMenuImage/btn_menu_leavemsg_press.png";
                    item.buttonHoverImage = "/resources/leftMenuImage/btn_menu_leavemsg_roll.png";
                    item.buttonDisableImage = "/resources/leftMenuImage/btn_menu_leavemsg_normal.png";
                    item.width = 177;
                    item.height = 50;
                }
            }

            //幸运点赠送
            Loader {
                id: buttonLuckyPoint;
                anchors.left: buttonLeaveMsg.left;
                anchors.top: buttonLeaveMsg.bottom;
                source: "XButton.qml";

                onLoaded: {
                    item.buttonNormalImage = "/resources/leftMenuImage/btn_menu_luckypoint_normal.png";
                    item.buttonPressImage = "/resources/leftMenuImage/btn_menu_luckypoint_press.png";
                    item.buttonHoverImage = "/resources/leftMenuImage/btn_menu_luckypoint_roll.png";
                    item.buttonDisableImage = "/resources/leftMenuImage/btn_menu_luckypoint_normal.png";
                    item.width = 177;
                    item.height = 50;
                }
            }

            //顾客管理
            Loader {
                id: buttonClientChat;
                anchors.left: buttonLuckyPoint.left;
                anchors.top: buttonLuckyPoint.bottom;
                source: "XButton.qml";

                onLoaded: {
                    item.buttonNormalImage = "/resources/leftMenuImage/btn_menu_clientchat_normal.png";
                    item.buttonPressImage = "/resources/leftMenuImage/btn_menu_clientchat_press.png";
                    item.buttonHoverImage = "/resources/leftMenuImage/btn_menu_clientchat_roll.png";
                    item.buttonDisableImage = "/resources/leftMenuImage/btn_menu_clientchat_normal.png";
                    item.width = 177;
                    item.height = 50;
                }
            }


            //商品管理
            Loader {
                id: buttonGoodsManage;
                anchors.left: buttonClientChat.left;
                anchors.top: buttonClientChat.bottom;
                source: "XButton.qml";

                onLoaded: {
                    item.buttonNormalImage = "/resources/leftMenuImage/btn_menu_goodsmanage_normal.png";
                    item.buttonPressImage = "/resources/leftMenuImage/btn_menu_goodsmanage_press.png";
                    item.buttonHoverImage = "/resources/leftMenuImage/btn_menu_goodsmanage_roll.png";
                    item.buttonDisableImage = "/resources/leftMenuImage/btn_menu_goodsmanage_normal.png";
                    item.width = 177;
                    item.height = 50;
                }
            }

            //活动管理
            Loader {
                id: buttonActivityManage;
                anchors.left: buttonGoodsManage.left;
                anchors.top: buttonGoodsManage.bottom;
                source: "XButton.qml";

                onLoaded: {
                    item.buttonNormalImage = "/resources/leftMenuImage/btn_menu_activitymanage_normal.png";
                    item.buttonPressImage = "/resources/leftMenuImage/btn_menu_activitymanage_press.png";
                    item.buttonHoverImage = "/resources/leftMenuImage/btn_menu_activitymanage_roll.png";
                    item.buttonDisableImage = "/resources/leftMenuImage/btn_menu_activitymanage_normal.png";
                    item.width = 177;
                    item.height = 50;
                }
            }

            //租号管理
            Loader {
                id: buttonRentno;
                anchors.left: buttonActivityManage.left;
                anchors.top: buttonActivityManage.bottom;
                source: "XButton.qml";

                onLoaded: {
                    item.buttonNormalImage = "/resources/leftMenuImage/btn_menu_rentno_normal.png";
                    item.buttonPressImage = "/resources/leftMenuImage/btn_menu_rentno_press.png";
                    item.buttonHoverImage = "/resources/leftMenuImage/btn_menu_rentno_roll.png";
                    item.buttonDisableImage = "/resources/leftMenuImage/btn_menu_rentno_normal.png";
                    item.width = 177;
                    item.height = 50;
                }
            }


        }

        //右边显示
        Loader{
            id:mainUIRectangleLoader;
            anchors.top: titleBarRectangle.bottom;
            anchors.left: mainMenuRectangle.right;

            width:843;
            height: 624;
            visible: true;

            source: "HomeWindow.qml"

        }

        //底部显示
        Rectangle{
            id:mainBottomRectangle;
            anchors.left: mainMenuRectangle.left;
            anchors.top: mainMenuRectangle.bottom;
            width: 1020;
            height: 31;

            Image{
                id:labelButtomImg;
                anchors.left: parent.left;
                anchors.top: parent.top;
                source: "/resources/background/bk05.png";
            }


            Text {
                anchors.left: parent.left;
                anchors.leftMargin: 30;
                anchors.top: labelButtomImg.top;
                anchors.topMargin: 10;
                font.pixelSize: 13;
                font.bold: true;
                text:"连接状态:正常";
                color: "#979797";
            }

            Text {
                anchors.right: parent.right;
                anchors.rightMargin: 30;
                anchors.top: labelButtomImg.top;
                anchors.topMargin: 10;
                font.pixelSize: 13;
                font.bold: true;
                text:"版本号:v0.0.1";
                color: "#979797";
            }


        }




}
