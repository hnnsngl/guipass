import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.1

ApplicationWindow {
    id: window
    visible: true
    title: "Guipass"
    
    Material.theme: Material.Dark
    Material.accent: '#ff0000'
    Material.primary: '#101010'
    
    header: ToolBar {
        Material.foreground: "white"
	
        RowLayout {
            spacing: 20
            anchors.fill: parent
	    
            ToolButton {
                icon.source: stackView.depth > 1 ? "images/back.png" : "images/drawer.png"
                onClicked: {
                    if (stackView.depth > 1) {
                        stackView.pop()
                        listView.currentIndex = -1
                    } else {
                        drawer.open()
                    }
                }
            }
 
            ToolButton {
                icon.source: "images/menu.png"
                onClicked: optionsMenu.open()
		
                Menu {
                    id: optionsMenu
                    x: parent.width - width
                    transformOrigin: Menu.TopRight
		    
                    MenuItem {
                        text: "About"
                        onTriggered: aboutDialog.open()
                    }
                }
            }
        }
    }
    
    StackView {
        id: stackView
        anchors.fill: parent
        
        initialItem: Pane {
            id: pane
            
            Image {
                id: logo
                width: pane.availableWidth / 2
                height: pane.availableHeight / 2
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -50
                fillMode: Image.PreserveAspectFit
                source: "images/gopass-logo.png"
            }
        }
    }

    Dialog {
        id: aboutDialog
        modal: true
        focus: true
        title: "About"
        x: (window.width - width) / 2
        y: window.height / 6
        width: Math.min(window.width, window.height) / 3 * 2
        
        Label {
            width: aboutDialog.availableWidth
            text: "This tries to provide a portable GUI for Gopass. Gopass is \"The slightly more awesome standard unix password manager for teams https://www.gopass.pw/\""
            wrapMode: Label.Wrap
            font.pixelSize: 12
        }
    }
}
