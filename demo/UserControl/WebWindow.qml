import QtQuick 2.9
import QtQuick.Window 2.2
import QtWebEngine 1.0

Rectangle {
    id:webWindow;

    width: 843;
    height: 624;
    visible: true;

    WebEngineView {
             anchors.fill: parent
             url: "http://www.51asm.com"
         }

}
