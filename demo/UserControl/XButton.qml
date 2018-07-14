import QtQuick 2.0

Item {
    id: xButton;

    property string buttonNormalImage: "";
    property string buttonPressImage: "";
    property string buttonHoverImage: "";
    property string buttonDisableImage: "";
    property  bool buttonDisable : false;

    signal clicked();
    signal exited();
    signal entered();
    signal pressed();
    signal updated();

    Image {
        id: xbuttonImage;
        source: buttonNormalImage;
        anchors.fill: parent;
        MouseArea{
            id:buttonMouseArea;
            anchors.fill: parent;
            hoverEnabled: true;
            onEntered: {
                if(buttonDisable==false)
                {
                    xButton.entered();
                    xbuttonImage.source = buttonHoverImage;
                }
            }


            onPressed: {
                if(buttonDisable==false)
                {
                    xButton.pressed();
                    xbuttonImage.source = buttonPressImage;
                }
            }

            onClicked: {
                if(buttonDisable==false)
                {
                    xButton.clicked();
                    xbuttonImage.source = buttonPressImage;
                }
            }


            onExited: {
                if(buttonDisable==false)
                {
                    xButton.exited();
                    xbuttonImage.source = buttonNormalImage;
                }

            }
        }
    }

    onButtonDisableChanged: {
        buttonDisable == false?(xbuttonImage.source = buttonNormalImage)
                              :(xbuttonImage.source = buttonDisableImage);
    }



}
