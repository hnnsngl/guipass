Window {
    visible: true
    width: 640
    height: 480

    Rectangle {
	id:comboBox
	property variant items: ["First", "Second","Third"]
	signal comboClicked;
	anchors.centerIn: parent
	width: 141
	height: 30

	Rectangle
	{
            id:chosenItem
            radius:10;
            width:100;
            height:30;
            color: "#454b4d"

            Text {
		id:chosenItemText
		anchors.centerIn: parent
		color: "black"
		text:"Choose";
		anchors.topMargin: 5
		anchors.left: parent.left
		anchors.leftMargin: 12
		font.family: "Arial"
		font.pointSize: 14;
		smooth:true
            }

            MouseArea {
		anchors.fill: parent;
		onClicked: {
                    comboBox.state = comboBox.state==="dropDown"?"":"dropDown"
		}
            }
	}

	Rectangle
	{
            id:dropDown
            width:100;
            height:0;
            clip:true;
            border.color: "black"
            anchors.bottom:  chosenItem.top;
            anchors.margins: 2;

            ListView {
		id:listView
		height:1000;
		model: comboBox.items
		currentIndex: 0
		delegate: Item{
                    width:comboBox.width;
                    height: comboBox.height;
		    Rectangle{id:highlighter; anchors.fill: parent; color: "blue"; visible: listView.currentIndex===index}
                    Text {
			text: modelData
			anchors.top: parent.top;
			anchors.left: parent.left;
			anchors.margins: 5;
			color: "black"
			elide: modelData.elideMode
                    }
                    MouseArea {
			anchors.fill: parent;
			hoverEnabled: true
			onClicked: {
                            comboBox.state = ""
                            chosenItemText.text = modelData;
                            listView.currentIndex = index;
			}
                    }
		}
            }
	}

	states: State {
            name: "dropDown";
            PropertyChanges { target: dropDown; height:30*comboBox.items.length }
	}
    }
}
