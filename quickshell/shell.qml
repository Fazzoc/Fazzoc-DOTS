import Quickshell
import Quickshell.Io
import QtQuick

PanelWindow {
  margins {
    top: 10
    bottom: 10
    right: 10
    left: 10
  }

  anchors {
    top:true
    left:true
    right:true
  }

  implicitHeight: 30

  Text {
    id: clock
    anchors.centerIn: parent
    
    Process {
      id: dateProc

      command: ["date"]
      running: true

      stdout: StdioCollector {
        onStreamFinished: clock.text = text
      }
    }

      Timer {
        interval: 1000
        running: true
        repeat: true

        onTriggered: dateProc.running = true
      }
    }
  }