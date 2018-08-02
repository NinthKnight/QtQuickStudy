import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Component {
        id: footerRect

        Rectangle{
            width: 200;
            height: 100
            color: "red";
        }
    }

    ListModel {
        id: tableModle;

        ListElement {
            checked: true;
            color: "blue";
        }
        ListElement {
            checked: false;
            color: "gray";
        }
    }

    TableView {
        id: tableView;

        alternatingRowColors: true;
        backgroundVisible: true;
        //contentFooter: footerRect;
        anchors.fill: parent;
        // 指定要加载哪个模块的数据
        model: tableModle;

        // role对应的就是ListModle中ListElemnt中定义的角色
        // 这样就实现了模块->表格的数据映射
        TableViewColumn {
            id: checkedColumn;
            role: "checked";
            title: qsTr("Checked");
            width: 100;
        }
        TableViewColumn {
            role: "color";
            title: qsTr("Color");
            width: 100;
        }

        itemDelegate: Item {
            CheckBox {
                anchors.centerIn: parent;
                checked: styleData.value;
                visible: isCheckColumn(styleData.column);
            }

            Text {
                anchors.left: parent.left;
                anchors.verticalCenter: parent.verticalCenter;
                text: styleData.value;
                visible: !isCheckColumn(styleData.column);
                color: isCheckColumn(styleData.column) ? "black" : styleData.value;
            }

            function isCheckColumn(columnIndex) {
                return tableView.getColumn(columnIndex) === checkedColumn;
            }
        }
    }
}
