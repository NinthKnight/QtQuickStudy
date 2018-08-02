TableView类型
=====
简介
---
<p>
表格编辑器，提供列表视图和滚动条以及头部区域<br />
（效果相当于MFC的TableView或TableControl）<br />
通过delegate可以定制表格的外观
</p>
目录
---
<a href="#property"><font size=5>属性</font></a><br />
<div style="margin-left:30px">
    <a href="#alternatingRowColors">
        <font size=4>alternatingRowColors</font>
    </a>
    <br />
    <a href="#backgroundVisible">
        <font size=4>backgroundVisible</font>
    </a>
    <br />
    <a href="#columnCount">
        <font size=4>columnCount</font>
    </a>
    <br />
    <a href="#contentFooter">
        <font size=4>contentFooter</font>
    </a>
    <br />
    <a href="#contentHeader">
        <font size=4>contentHeader</font>
    </a>
    <br />
    <a href="#currentRow">
        <font size=4>currentRow</font>
    </a>
    <br />
    <a href="#headerDelegate">
        <font size=4>headerDelegate</font>
    </a>
    <br />
    <a href="#headerVisible">
        <font size=4>headerVisible</font>
    </a>
    <br />
    <a href="#itemDelegate">
        <font size=4>itemDelegate</font>
    </a>
    <br />
    <a href="#model">
        <font size=4>model</font>
    </a>
    <br />
    <a href="#rowCount">
        <font size=4>rowCount</font>
    </a>
    <br />
    <a href="#rowDelegate">
        <font size=4>rowDelegate</font>
    </a>
    <br />
    <a href="#selection">
        <font size=4>selection</font>
    </a>
    <br />
    <a href="#selectionMode">
        <font size=4>selectionMode</font>
    </a>
    <br />
    <a href="#sortIndicatorColumn">
        <font size=4>sortIndicatorColumn</font>
    </a>
    <br />
    <a href="#sortIndicatorOrder">
        <font size=4>sortIndicatorOrder</font>
    </a>
    <br />
    <a href="#sortIndicatorVisible">
        <font size=4>sortIndicatorVisible</font>
    </a>
    <br />
</div>
<a href="#signal"><font size=5>信号</font></a><br />
<div style="margin-left:30px">
    <a href="#activated">
        <font size=4>activated</font>
    </a>
    <br />
    <a href="#clicked">
        <font size=4>clicked</font>
    </a>
    <br />
    <a href="#doubleClicked">
        <font size=4>doubleClicked</font>
    </a>
    <br />
    <a href="#pressAndHold">
        <font size=4>pressAndHold</font>
    </a>
    <br />
</div>
</div>
<a href="#mothed"><font size=5>方法</font></a><br />
<div style="margin-left:30px">
    <a href="#addColumn">
        <font size=4>addColumn</font>
    </a>
    <br />
    <a href="#getColumn">
        <font size=4>getColumn</font>
    </a>
    <br />
    <a href="#insertColumn">
        <font size=4>insertColumn</font>
    </a>
    <br />
    <a href="#moveColumn">
        <font size=4>moveColumn</font>
    </a>
    <br />
    <a href="#positionViewAtRow">
        <font size=4>positionViewAtRow</font>
    </a>
    <br />
    <a href="#removeColumn">
        <font size=4>removeColumn</font>
    </a>
    <br />
    <a href="#resizeColumnsToContents">
        <font size=4>resizeColumnsToContents</font>
    </a>
    <br />
    <a href="#rowAt">
        <font size=4>rowAt</font>
    </a>
    <br />
</div>

属性
----
<div id="property">
    <p id="alternatingRowColors">
        <strong id="#alternatingRowColors">alternatingRowColors : bool</strong><br />
        &ensp;&ensp;&ensp;&ensp;描述：是否交替显示行颜色<br />
        &ensp;&ensp;&ensp;&ensp;默认值：ture<br />
    </p>
    
    <p id="backgroundVisible">
        <strong>backgroundVisible : bool</strong><br />
        &ensp;&ensp;&ensp;&ensp;描述：背景颜色是否要填充<br />
        &ensp;&ensp;&ensp;&ensp;默认值：ture<br />
        &ensp;&ensp;&ensp;&ensp;注意：rowDelegate不会被该属性影响<br />
    </p>
    <p id="columnCount">
        <strong>columnCount : int</strong><br />
        &ensp;&ensp;&ensp;&ensp;描述：当前总行数<br />
        &ensp;&ensp;&ensp;&ensp;注意：只读<br />
    </p>
    <p id="contentFooter">
        <strong>contentFooter : Component</strong><br />
        &ensp;&ensp;&ensp;&ensp;描述：页脚内容<br />
        &ensp;&ensp;&ensp;&ensp;默认值：ture<br />
    </p>
    <p id="contentHeader">
        <strong>contentHeader : Component</strong><br />
        &ensp;&ensp;&ensp;&ensp;描述：是否交替显示行颜色<br />
        &ensp;&ensp;&ensp;&ensp;默认值：ture<br />
    </p>
    <p id="currentRow">
        <strong>currentRow : int</strong><br />
        &ensp;&ensp;&ensp;&ensp;描述：当前选中行的索引<br />
        &ensp;&ensp;&ensp;&ensp;默认值：-1，表示没有行被选中<br />
        &ensp;&ensp;&ensp;&ensp;理解：MFC中的GetCurSel()<br />
    </p>
    <p id="headerDelegate">
        <strong>headerDelegate : Component</strong><br />
        &ensp;&ensp;&ensp;&ensp;描述： 设置绘制头部时的属性来定制头部外观<br />
        &ensp;&ensp;&ensp;&ensp;其中可访问的属性：<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;styleData.value：当前列的值或文本<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;styleData.column：当前的列的索引<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;styleData.pressed：当该列被按下时该值为True<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;styleData.containsMouse：当鼠标顶留在该列时该值为True<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;styleData.textAlignment：当前列的水平对齐方式<br />
    </p>
    <p id="headerVisible">
        <strong>headerVisible : bool</strong><br />
        &ensp;&ensp;&ensp;&ensp;描述：头部是否可见<br />
        &ensp;&ensp;&ensp;&ensp;默认值：ture<br />
    </p>
    <p id="itemDelegate">
        <strong>itemDelegate : Component</strong><br />
        &ensp;&ensp;&ensp;&ensp;描述：设置绘制单元格时的属性来定制单元格外观<br />
        &ensp;&ensp;&ensp;&ensp;其中可访问的属性：<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;styleData.selected：如果该单元格被选中则为True<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;styleData.value：单元格的值或文本<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;styleData.textColor：默认文本颜色<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;styleData.row：行索引<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;styleData.column：列索引<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;styleData.elideMode：列是否采用省略模式<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;styleData.textalignment：单元格所在列列的水平对齐方式<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;styleData.pressed：当该单元格被按下时该值为True<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;styleData.hasActiveFocus：当行被选中时为True<br />
    </p>
    <p id="model">
        <strong>model : model</strong><br />
        &ensp;&ensp;&ensp;&ensp;描述：该属性使用一个模块来为视图提供数据<br />
        &ensp;&ensp;&ensp;&ensp;model：可以使用QML的ListModel、XmlListModle、或VisualItemModelc创建，该值提供一个id；也可以由C++的模块类来提供<br />
        &ensp;&ensp;&ensp;&ensp;理解：数据映射 模块->表格<br />
    </p>
    <p id="rowCount">
        <strong>rowCount : int</strong><br />
        &ensp;&ensp;&ensp;&ensp;描述：当前行的数量<br />
    </p>
    <p id="rowDelegate">
        <strong>rowDelegate : Component</strong><br />
        &ensp;&ensp;&ensp;&ensp;描述：设置绘制行时的属性来定制行<br />
        &ensp;&ensp;&ensp;&ensp;其中可访问的属性：<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;styleData.alternate：如果行使用交替背景色则为True<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;styleData.selected：当前行被选中时为True<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;styleData.row：行索引<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;styleData.hasActiveFocus：列索引<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;styleData.pressed：鼠标在该行按下时为True<br />
    </p>
    <p id="selection">
        <strong>selection : Selection</strong><br />
        &ensp;&ensp;&ensp;&ensp;描述：控制当前选中的行或者迭代选中的行对其做操作<br />
        &ensp;&ensp;&ensp;&ensp;可用属性：<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;[read-only]int count：处于选中状态的行数<br />
        &ensp;&ensp;&ensp;&ensp;可用函数：<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;clear()：取消所有行的选中状态<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;selectAll()：取消所有行的选中状态<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;select(from, to)：取消所有行的选中状态<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;deselect(from, to)()：取消所有行的选中状态<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;forEach(callback)()：取消所有行的选中状态<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;contains(index)()：取消所有行的选中状态<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;selectionChanged()：取消所有行的选中状态<br />
        &ensp;&ensp;&ensp;&ensp;<font color="red">注意：该属性在C++中需要先获得TableView的对象句柄，或者在JavaScript中通过id.来使用</font><br />
    </p>
    <p id="selectionMode">
        <strong>selectionMode : int</strong><br />
        &ensp;&ensp;&ensp;&ensp;描述：设置响应用户选择的模式<br />
        &ensp;&ensp;&ensp;&ensp;可用模式：<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;SelectionMode.NoSelection：单元格不可选中<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;SelectionMode.SingleSelection：单选，且不可选择已选中的单元格<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;SelectionMode.MultiSelection：多选<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;SelectionMode.ExtendedSelection：扩展，常规为单选，支持像文件选择的操作（按住Ctrl或Shift、鼠标画框选择）<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;SelectionMode.ContiguousSelection：常规为单选，单独支持按住Shfit键选择会选中两个Item之间的所有Item<br />
    </p>
    <p id="sortIndicatorColumn">
        <strong>sortIndicatorColumn : int</strong><br />
        &ensp;&ensp;&ensp;&ensp;描述：当前排序后的列的索引，默认为0<br />
    </p>
    <p id="sortIndicatorOrder">
        <strong>sortIndicatorOrder : int</strong><br />
        &ensp;&ensp;&ensp;&ensp;描述：通过排序指示符设置排序顺序<br />
        &ensp;&ensp;&ensp;&ensp;可用排序符：<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;Qt.AscendingOrder：升序，默认<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;Qt.DescendingOrder：降序<br />
    </p>
    <p id="sortIndicatorVisible">
        <strong>sortIndicatorVisible : bool</strong><br />
        &ensp;&ensp;&ensp;&ensp;描述：是否要隐藏排序指示器，默认为false<br />
    </p>
</div>

信号
-----
<div id="signal">
    <p id="activated">
        <strong>activated(int row)</strong><br />
        &ensp;&ensp;&ensp;&ensp;触发时机：用户使用鼠标或键盘操作单元格<br />
        &ensp;&ensp;&ensp;&ensp;可使用参数：发出信号的行的索引<br />
        &ensp;&ensp;&ensp;&ensp;处理程序：OnActiveted<br />
        &ensp;&ensp;&ensp;&ensp;<font color="red">注意：当行或单元格的委托中没有阻止才可触发</font><br />
    </p>
    <p id="clicked">
        <strong>clicked(int row)</strong><br />
        &ensp;&ensp;&ensp;&ensp;触发时机：用户单击有效的行<br />
        &ensp;&ensp;&ensp;&ensp;可使用参数：发出信号的行的索引<br />
        &ensp;&ensp;&ensp;&ensp;处理程序：OnActiveted<br />
        &ensp;&ensp;&ensp;&ensp;<font color="red">注意：当行或单元格的委托中没有阻止才可触发</font><br />
    </p>
    <p id="doubleClicked">
        <strong>doubleClicked(int row)</strong><br />
        &ensp;&ensp;&ensp;&ensp;触发时机：用户双击有效的行<br />
        &ensp;&ensp;&ensp;&ensp;可使用参数：发出信号的行的索引<br />
        &ensp;&ensp;&ensp;&ensp;处理程序：OnActiveted<br />
        &ensp;&ensp;&ensp;&ensp;<font color="red">注意：当行或单元格的委托中没有阻止才可触发</font><br />
    </p>
    <p id="pressAndHold">
        <strong>pressAndHold(int row)</strong><br />
        &ensp;&ensp;&ensp;&ensp;触发时机：用户在有效的行上按下鼠标并保持<br />
        &ensp;&ensp;&ensp;&ensp;可使用参数：发出信号的行的索引<br />
        &ensp;&ensp;&ensp;&ensp;处理程序：OnActiveted<br />
        &ensp;&ensp;&ensp;&ensp;<font color="red">注意：当行或单元格的委托中没有阻止才可触发</font><br />
    </p>
</div>
方法
----
<div id="mothed">
    <p id="addColumn">
        <strong>addColumn(object column)</strong><br />
        &ensp;&ensp;&ensp;&ensp;作用：添加行<br />
        &ensp;&ensp;&ensp;&ensp;参数：参数可以是TableViewColumn实例或组件，<br />
        &ensp;&ensp;&ensp;&ensp;<font color="red">注意：作为参数的组件必须包含TableViewColumn</font><br />
        &ensp;&ensp;&ensp;&ensp;返回：成功会返回已添加的TableViewColumn，否则返回null<br />
    </p>
    <p id="getColumn">
        <strong>getColumn(int index)</strong><br />
        &ensp;&ensp;&ensp;&ensp;作用：获取行<br />
        &ensp;&ensp;&ensp;&ensp;参数：目标行索引<br />
        &ensp;&ensp;&ensp;&ensp;<font color="red">注意：作为参数的组件必须包含TableViewColumn</font><br />
        &ensp;&ensp;&ensp;&ensp;返回：成功会返回对应的TableViewColumn，否则返回null<br />
    </p>
    <p id="insertColumn">
        <strong>insertColumn(int index, object column)</strong><br />
        &ensp;&ensp;&ensp;&ensp;作用：插入行<br />
        &ensp;&ensp;&ensp;&ensp;参数：index为插入位置索引，column可以是TableViewColumn实例或组件，<br />
        &ensp;&ensp;&ensp;&ensp;<font color="red">注意：作为参数的组件必须包含TableViewColumn</font><br />
        &ensp;&ensp;&ensp;&ensp;返回：成功会返回已插入TableViewColumn，否则返回null<br />
    </p>
    <p id="moveColumn">
        <strong>moveColumn(int from, int to)</strong><br />
        &ensp;&ensp;&ensp;&ensp;作用：移动行<br />
        &ensp;&ensp;&ensp;&ensp;参数：from为原位置索引，to为目标位置索引<br />
        &ensp;&ensp;&ensp;&ensp;返回：无<br />
    </p>
    <p id="positionViewAtRow">
        <strong>positionViewAtRow(int row, PositionMode mode)</strong><br />
        &ensp;&ensp;&ensp;&ensp;作用：移动指定行到视图的指定位置<br />
        &ensp;&ensp;&ensp;&ensp;参数：row为指定行的索引<br />
        &ensp;&ensp;&ensp;&ensp;位置模式：<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;ListView.Beginning：视图垂直最顶或水平最左<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;ListView.Center：视图中心<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;ListView.End：视图垂直最底或水平最右<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;ListView.Visible：如果行单是可见的就不做任何操作，否则就将行显示到视图中<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;ListView.Contain：确保整个行是可见的，如果大于视图，则将行移动到视图顶部<br />
        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;ListView.SnapPosition：单元格不可选中<br />
    </p>
    <p id="removeColumn">
        <strong>removeColumn(int index)</strong><br />
        &ensp;&ensp;&ensp;&ensp;作用：删除行<br />
        &ensp;&ensp;&ensp;&ensp;参数：要删除的行的索引<br />
        &ensp;&ensp;&ensp;&ensp;返回：无<br />
    </p>
    <p id="resizeColumnsToContents">
        <strong>resizeColumnsToContents()</strong><br />
        &ensp;&ensp;&ensp;&ensp;作用：将所有列宽度调整为可以显示出所有内容<br />
        &ensp;&ensp;&ensp;&ensp;参数：无<br />
        &ensp;&ensp;&ensp;&ensp;返回：无<br />
    </p>
    <p id="rowAt">
        <strong>rowAt(int x, int y)</strong><br />
        &ensp;&ensp;&ensp;&ensp;作用：获取点x和点y之间的可视行<br />
        &ensp;&ensp;&ensp;&ensp;参数：x为点1，y为点2<br />
        &ensp;&ensp;&ensp;&ensp;返回：可视行的索引值，如果没有可视行则返回-1<br />
        &ensp;&ensp;&ensp;&ensp;<font color="red">注意：该函数必须在组件实例化完成后才可调用</font><br />
    </p>
</div>
Demo
---
见TableControl（后续更新）