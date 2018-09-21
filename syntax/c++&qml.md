# qml调用c++方法：
 + 1 c++中新建一个类，必须继承自QObject,声明对应的槽函数以提供给qml调用。

```
#ifndef QUICKLAYER_H
#define QUICKLAYER_H
#include <QObject>
#include <QDebug>
#include <QJSEngine>
#include <QJSValue>


#include "PlayCore\FFmpegPlayer.h"
#include "netWork\mynetwork.h"
#include "model.h"

extern SongModel model;

class CQuickLayer : public QObject
{
    Q_OBJECT
private:
	QObject* qmlRoot;

public:
	CQuickLayer()
	{
		//播放音乐&mv
		connect(&m_net, SIGNAL(sig_reqSongStatus(ItemResult, SearchStatus)), this, SLOT(slot_requestSong(ItemResult, SearchStatus)));

		//时长
		connect(&m_ffplayer, SIGNAL(sig_PositionChange(qint64)), this, SLOT(slot_positionChange(qint64)));
	}

	const ItemResult& GetItemByIndex(int index) { return m_songlist.at(index); }

	Q_INVOKABLE  void searchSong(QString songName)
	{
		qDebug() << "slot_searchSong:" << songName << endl;
		m_net.requestSong(songName);
	}

	Q_INVOKABLE  void playSong(int nRow)
	{
		qDebug() << "playSong:" << nRow << endl;

		//获取对应的歌曲的url，然后播放即可。
		m_ffplayer.stop();
		QString url;

		const ItemResult &result = GetItemByIndex(nRow);

		if (!result.strUrl.isEmpty())
		{
			m_ffplayer.setMedia(result.strUrl);
			m_ffplayer.play();
		}
	}

	Q_INVOKABLE  void close()
	{
		qDebug() << "close"  << endl;
		m_ffplayer.stop();
	}

signals:
	void begin();
	void beginTime(const QString& strTimeBegin);
	void endTime(const QString& strTimeEnd);
	void setTimeSlider(int nBegin, int nEnd, int nPos);


public slots:
	void slot_requestSong(const ItemResult&, SearchStatus);
	void slot_positionChange(qint64);
	void slot_setVolumn(int nValue);



public:
	virtual ~CQuickLayer();

	FFmpegPlayer m_ffplayer;
	MyNetWork m_net;

	QList<ItemResult> m_songlist;
	QMap<int, QString> m_hashmap;
	QMap<int, QString> m_MvHashmap;

	int rowCount = 3;
	QJSEngine m_JS;
	QJSValue m_jsArray;

	int  m_nSongId = 0;
};

#endif // QUICKLAYER_H

```

+ 2 在main函数中，注册该类
```
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

	//register C++ type CQuickLayer
	qmlRegisterType<CQuickLayer>("com.mplayer", 1, 0, "Mplayer");

	//return app.exec();

    QQmlApplicationEngine engine;

	QQmlContext *ctxt = engine.rootContext();
	ctxt->setContextProperty("myModel", &model);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
```

+ 3 在qml中导入上面声明的类，创建对象使用：

```
import com.mplayer 1.0

Window {
    id:mainWindow;
    visible: true
    width: 1022
    height: 670
    color: "#FAFAFA"
    flags: Qt.FramelessWindowHint;

    property point startPoint: Qt.point(0, 0);
    property point offsetPoint: Qt.point(0, 0);
    property  bool isMoveMainWindow: false;

    Mplayer{
        id:quickLayer;   //Instance of CQuickLayer
    }

    onClosing:{
        //这里就可以直接使用quickLayer对象了
        quickLayer.close();
    }
}
```

# c++ 调用 qml
有时候，c++层数据发生了变化，需要通知qml改变界面，这时候的做法是：
+ 1 c++的导出类定义信号函数
```
signals:
	void begin();
	void beginTime(const QString& strTimeBegin);
	void endTime(const QString& strTimeEnd);
	void setTimeSlider(int nBegin, int nEnd, int nPos);
```

+ 2 c++中在合适的时机，emit该信号
```
void CQuickLayer::slot_positionChange(qint64 length)
{
	int pos = length / 1000;
	int dur = m_ffplayer.getDuration() / 1000000;

	QTime time;
	time.setHMS(0, dur / 60, dur % 60);
	QString durstr = time.toString("mm:ss");

	time.setHMS(0, pos / 60, pos % 60);
	QString posstr = time.toString("mm:ss");

	emit beginTime(posstr);
	emit endTime(durstr);
	emit setTimeSlider(0, dur, pos);
}
```

+ 3 qml中做好Connection，关联对应的信号和槽

```
//音乐进度条
       Rectangle{
           id: musicControl;
           anchors.left:  buttonPlay.right;
           anchors.top: buttomLine.bottom;
           color: "#F6F6F8";
           width: 550;
           height: 42;

           Label{
             id: startTimeLabel;
             anchors.left:  parent.left;
             anchors.top:   parent.top;
             anchors.leftMargin: 10;
             anchors.topMargin: 25;

             Text {
                 font.pixelSize: 13;
                 font.bold: false;
                 //text:"00:00";
                 color: "black";
             }

             //这里做好关联：onBeginTime即为信号beginTime的槽函数，参数是依次对应的，参数名必须相同：
             Connections {
                     target: quickLayer;
                     onBeginTime:{
                         //console.log("123");
                         startTimeLabel.text = strTimeBegin;
                     }
                 }
           }
       }
```

# tableview与model的关联使用
在qml中使用了tableview，在c++层中获取的数据需要提交给tableview显示，这时候需要新建一个model与tableview相关联，然后改变model，则会通知view修改界面，这是mvc的设计模式。
    具体做法如下：
+ 1 在qml中添加tableview控件：

```
Rectangle{
               anchors.left:  rightLine.right;
               anchors.top: parent.top;
               visible: true;
               width:right_mainUIRectangle.width - rightLine.width;
               height: parent.height;
               color:"#FAFAFA";

               TableView{
                       id: songTable;
                       anchors.left:  parent.left;
                       anchors.top: parent.top;
                       anchors.fill: parent;

                       width: parent.width;
                       height: parent.height;

                       backgroundVisible: false;
                       frameVisible: false;

                       //响应双击
                       onDoubleClicked:{
                            quickLayer.playSong(songTable.currentRow);
                       }

                       //TableViewColumn 描述表格的每一列
                       TableViewColumn{
                           role: "songId";
                           title: "";
                           width: 50;
                           elideMode: Text.ElideRight;

                       }

                       TableViewColumn{
                           role: "songName";
                           title: "音乐标题";
                           width: 150;
                           elideMode: Text.ElideLeft;

                       }

                       TableViewColumn{
                           role: "songer";
                           title: "歌手";
                           width: 100;
                           elideMode: Text.ElideLeft;
                       }

                       TableViewColumn{
                           role: "AlbumName";
                           title: "专辑";
                           width: 100;
                           elideMode: Text.ElideLeft;
                       }

                       TableViewColumn{
                           role: "Duration";
                           title: "时长";
                           width: 50;
                           elideMode: Text.ElideLeft;
                       }

                       itemDelegate:Text{//设置每个单元格的字体样式
                           text: styleData.value
                           color: styleData.selected? "balck" : styleData.textColor
                           elide: styleData.elideMode;
                           font.pixelSize: 14
                           Layout.preferredWidth: 120
                       }

                       rowDelegate :Rectangle{//设置行的背景色
                           color: styleData.selected ? "#E6E7EA" : "#FAFAFA";
                           visible: true
                       }

                       headerDelegate :Rectangle{//设置表头的样式
                           implicitWidth: 10
                           implicitHeight: 24


                           border.color: "#707070"
                           color: "#FAFAFA";
                           Text{
                               anchors.verticalCenter: parent.verticalCenter
                               anchors.left: parent.left
                               anchors.leftMargin: 4
                               anchors.right: parent.right
                               anchors.rightMargin: 4
                               text: styleData.value
                               color: "#707070"
                               font.pixelSize: 14
                               Layout.preferredWidth: 120
                           }
                       }

                       model: myModel
                       focus: true
                   }
               }
```
 这里qt在设计的时候，使用的是delegate委托的形式，即通过rowDelegate，headerDelegate等属性的设置，可以具体的细化tableview的显示。

+ 2 c++层次编写model。
 - 创建一个model类，继承自抽象model类：

  ```
  class SongModel : public QAbstractTableModel
  ```
  具体不同的view有对应不同的model，因为这里我使用的是tableview，所以继承的也是tablemodel。

  - 重写model中对应的方法：


  ```
    class SongModel : public QAbstractTableModel
    {
    	Q_OBJECT
    public:
    	enum SongRoles {
    		IdRole = Qt::UserRole + 1,
    		NameRole,
    		SongerRole,
    		AlbumRole,
    		DurationRole
    	};

    	SongModel(QObject *parent = 0);

    	void addSong(const Song &s);

    	void clearData();

    	int rowCount(const QModelIndex & parent = QModelIndex()) const;

    	int columnCount(const QModelIndex & parent = QModelIndex()) const
    	{
    		Q_UNUSED(parent);
    		return 5;
    	}

    	QModelIndex index(int row, int column, const QModelIndex &parent) const
    	{
    		Q_UNUSED(parent);


    		if ((row >= 0) && (row < m_Lst.size()))
    		{
    			return createIndex(row, column);
    		}
    		return QModelIndex();   //返回一个无效的空索引
    	}

    	QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
    	QHash<int, QByteArray> roleNames() const;

    private:
    	QList<Song> m_Lst;
    };

    SongModel::SongModel(QObject *parent)
    	: QAbstractTableModel(parent)
    {
    }


    void SongModel::clearData() {
    	if (rowCount() > 0)
    	{
    		beginRemoveRows(QModelIndex(), 0, rowCount() - 1);

    		if (!m_Lst.isEmpty()) {
    			m_Lst.clear();
    		}
    		endRemoveRows();
    	}

    }

    void SongModel::addSong(const Song &s)
    {
    	beginInsertRows(QModelIndex(), rowCount(), rowCount());
    	m_Lst << s;
    	endInsertRows();
    }

    int SongModel::rowCount(const QModelIndex & parent) const {
    	Q_UNUSED(parent);
    	return m_Lst.count();
    }

    QVariant SongModel::data(const QModelIndex & index, int role) const {
    	if (index.row() < 0 || index.row() >= m_Lst.count())
    		return QVariant();

    	const Song &s = m_Lst[index.row()];
    	if (role == IdRole)
    		return s.songId();
    	else if (role == NameRole)
    		return s.songName();
    	else if (role == SongerRole)
    		return s.songer();
    	else if (role == AlbumRole)
    		return s.AlbumName();
    	else if (role == DurationRole)
    		return s.Duration();

    	return QVariant();
    }

    QHash<int, QByteArray> SongModel::roleNames() const {
    	QHash<int, QByteArray> roles;

    	roles[IdRole] = "songId";
    	roles[NameRole] = "songName";
    	roles[SongerRole] = "songer";
    	roles[AlbumRole] = "AlbumName";
    	roles[DurationRole] = "Duration";

    	return roles;
    }
  ```


这里注意table的model是通过role来关联每一个cell的数据的，所以必须重写roleNames函数，并且上面qml中的TableViewColumn中的role名必须和roleNames赋值的名字一样。

接下来就是在c++中注册这个model，这里可以在main中使用另外一种写法：


  ```
  QQmlApplicationEngine engine;

  QQmlContext *ctxt = engine.rootContext();
  ctxt->setContextProperty("myModel", &model);

  engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
  if (engine.rootObjects().isEmpty())
      return -1;
  ```

  - 在qml中设置tableview的model属性，这里的myModel就是c++层导出的对象。
  ```
  model: myModel
  ```
  - 接下来，如果改变了model的数据，就需要通过父类model提供的接口函数通知view来进行更新，具体类似于：

  ```
  void SongModel::clearData() {
  if (rowCount() > 0)
  {
    	beginRemoveRows(QModelIndex(), 0, rowCount() - 1);

    	if (!m_Lst.isEmpty()) {
    		m_Lst.clear();
    	}
    	endRemoveRows();
    }

  }

  void SongModel::addSong(const Song &s)
  {
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_Lst << s;
    endInsertRows();
  }
  ```
这里的beginInsertRows是父类model的虚函数，这里的使用就是让model通知view，view就会自动绘制了。
