import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

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
            id: mainMenuRectangle
            anchors.top: titleBarRectangle.bottom;
            anchors.left: mainWindow.left;

            width: 177
            height: 624

            Rectangle{
                id:leftside
                property int currentIndex: 0
                property var items: []

                function changeActive(){
                    for(var i = 0;i<leftside.items.length;i++){
                        leftside.items[i].active = false
                    }
                    leftside.items[leftside.currentIndex].active = true
                }

                Image{
                    id:labelLeftMenuImg;
                    anchors.left: parent.left;
                    anchors.top: parent.top;
                    width: 177
                    height: 624

                    source: "/resources/background/bk03.png";
                }


                //主页
                TabItem{
                    id: item0;
                    anchors.left: parent.left;
                    anchors.top: parent.top;

                    active: leftside.currentIndex == 0;

                    buttonNormalImage : "/resources/leftMenuImage/btn_menu_home_normal.png";
                    buttonPressImage : "/resources/leftMenuImage/btn_menu_home_press.png";
                    buttonHoverImage : "/resources/leftMenuImage/btn_menu_home_roll.png";
                    buttonDisableImage : "/resources/leftMenuImage/btn_menu_home_normal.png";

                    onClicked: {
                        stackView.clear()
                        stackView.push("HomeWindow.qml")
                        leftside.currentIndex = 0
                        leftside.changeActive()
                    }
                }

                //音乐点播
                TabItem{
                    id: item1;
                    anchors.left: item0.left;
                    anchors.top: item0.bottom;

                    buttonNormalImage : "/resources/leftMenuImage/btn_menu_musicplay_normal.png";
                    buttonPressImage : "/resources/leftMenuImage/btn_menu_musicplay_press.png";
                    buttonHoverImage : "/resources/leftMenuImage/btn_menu_musicplay_roll.png";
                    buttonDisableImage : "/resources/leftMenuImage/btn_menu_musicplay_normal.png";


                    active: leftside.currentIndex == 1
                    onClicked: {
                        stackView.clear()
                        stackView.push("MusicPlayWindow.qml")
                        leftside.currentIndex = 1
                        leftside.changeActive()
                    }
                }

                //奖品派发
                TabItem{
                    id:item2
                    anchors.left: item1.left;
                    anchors.top: item1.bottom;

                    buttonNormalImage : "/resources/leftMenuImage/btn_menu_prizesend_normal.png";
                    buttonPressImage : "/resources/leftMenuImage/btn_menu_prizesend_press.png";
                    buttonHoverImage : "/resources/leftMenuImage/btn_menu_prizesend_roll.png";
                    buttonDisableImage : "/resources/leftMenuImage/btn_menu_prizesend_normal.png";

                    active: leftside.currentIndex == 2
                    onClicked: {
                        stackView.clear()
                        stackView.push("MusicPlayWindow.qml")
                        leftside.currentIndex = 2
                        leftside.changeActive()
                    }
                }

                //留言版
                TabItem{
                    id:item3
                    anchors.left: item2.left;
                    anchors.top: item2.bottom;

                    buttonNormalImage : "/resources/leftMenuImage/btn_menu_leavemsg_normal.png";
                    buttonPressImage : "/resources/leftMenuImage/btn_menu_leavemsg_press.png";
                    buttonHoverImage : "/resources/leftMenuImage/btn_menu_leavemsg_roll.png";
                    buttonDisableImage : "/resources/leftMenuImage/btn_menu_leavemsg_normal.png";

                    active: leftside.currentIndex == 3
                    onClicked: {
                        stackView.clear()
                        stackView.push("MusicPlayWindow.qml")
                        leftside.currentIndex = 3
                        leftside.changeActive()
                    }
                }

                //幸运点赠送
                TabItem{
                    id:item4
                    anchors.left: item3.left;
                    anchors.top: item3.bottom;

                    buttonNormalImage : "/resources/leftMenuImage/btn_menu_luckypoint_normal.png";
                    buttonPressImage : "/resources/leftMenuImage/btn_menu_luckypoint_press.png";
                    buttonHoverImage : "/resources/leftMenuImage/btn_menu_luckypoint_roll.png";
                    buttonDisableImage : "/resources/leftMenuImage/btn_menu_luckypoint_normal.png";

                    active: leftside.currentIndex == 4
                    onClicked: {
                        stackView.clear()
                        stackView.push("MusicPlayWindow.qml")
                        leftside.currentIndex = 4
                        leftside.changeActive()
                    }
                }

                //顾客管理
                TabItem{
                    id:item5
                    anchors.left: item4.left;
                    anchors.top: item4.bottom;

                    buttonNormalImage : "/resources/leftMenuImage/btn_menu_clientchat_normal.png";
                    buttonPressImage : "/resources/leftMenuImage/btn_menu_clientchat_press.png";
                    buttonHoverImage : "/resources/leftMenuImage/btn_menu_clientchat_roll.png";
                    buttonDisableImage : "/resources/leftMenuImage/btn_menu_clientchat_normal.png";

                    active: leftside.currentIndex == 5
                    onClicked: {
                        stackView.clear()
                        stackView.push("MusicPlayWindow.qml")
                        leftside.currentIndex = 5
                        leftside.changeActive()
                    }
                }

                //商品管理
                TabItem{
                    id:item6
                    anchors.left: item5.left;
                    anchors.top: item5.bottom;

                    buttonNormalImage : "/resources/leftMenuImage/btn_menu_goodsmanage_normal.png";
                    buttonPressImage : "/resources/leftMenuImage/btn_menu_goodsmanage_press.png";
                    buttonHoverImage : "/resources/leftMenuImage/btn_menu_goodsmanage_roll.png";
                    buttonDisableImage : "/resources/leftMenuImage/btn_menu_goodsmanage_normal.png";

                    active: leftside.currentIndex == 6
                    onClicked: {
                        stackView.clear()
                        stackView.push("MusicPlayWindow.qml")
                        leftside.currentIndex = 6
                        leftside.changeActive()
                    }
                }

                //活动管理
                TabItem{
                    id:item7
                    anchors.left: item6.left;
                    anchors.top: item6.bottom;

                    buttonNormalImage : "/resources/leftMenuImage/btn_menu_activitymanage_normal.png";
                    buttonPressImage : "/resources/leftMenuImage/btn_menu_activitymanage_press.png";
                    buttonHoverImage : "/resources/leftMenuImage/btn_menu_activitymanage_roll.png";
                    buttonDisableImage : "/resources/leftMenuImage/btn_menu_activitymanage_normal.png";

                    active: leftside.currentIndex == 7
                    onClicked: {
                        stackView.clear()
                        stackView.push("MusicPlayWindow.qml")
                        leftside.currentIndex = 7
                        leftside.changeActive()
                    }
                }

                //租号管理
                TabItem{
                    id:item8
                    anchors.left: item7.left;
                    anchors.top: item7.bottom;

                    buttonNormalImage : "/resources/leftMenuImage/btn_menu_rentno_normal.png";
                    buttonPressImage : "/resources/leftMenuImage/btn_menu_rentno_press.png";
                    buttonHoverImage : "/resources/leftMenuImage/btn_menu_rentno_roll.png";
                    buttonDisableImage : "/resources/leftMenuImage/btn_menu_rentno_normal.png";

                    active: leftside.currentIndex == 8;
                    onClicked: {
                        stackView.clear()
                        stackView.push("MusicPlayWindow.qml")
                        leftside.currentIndex = 8
                        leftside.changeActive()
                    }
                }

            }
            //右边显示
            StackView {
                id: stackView
                anchors.top: titleBarRectangle.bottom;
                anchors.left: mainMenuRectangle.right;
                width:843;
                height: 624;
                visible: true;

                initialItem: "HomeWindow.qml"

                popEnter: null
                popExit: null
                pushEnter: null
                pushExit: null
            }


            Component.onCompleted: {
                leftside.items.push(item0)
                leftside.items.push(item1)
                leftside.items.push(item2)
                leftside.items.push(item3)
                leftside.items.push(item4)
                leftside.items.push(item5)
                leftside.items.push(item6)
                leftside.items.push(item7)
                leftside.items.push(item8)
        //        QmlController.stackView = stackView
        //        QmlController.header = myHeader
        //        console.log("stackView",QmlController.header,myHeader)
            }

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
