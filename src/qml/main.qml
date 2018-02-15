import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Controls 2.1

Window
{
    id: window
    function randomNumber(old) {
      if (old === undefined) {
        return Math.floor(Math.random() * 10) + 1;
      }
      var random = Math.floor(Math.random() * 10) + 1;
      while (random == old) {
        random = Math.floor(Math.random() * 10) + 1;
      }
      return random
    }
    Timer {
        id: timer
    }
    function delay(delayTime, cb) {
        timer.interval = delayTime;
        timer.repeat = false;
        timer.triggered.connect(cb);
        timer.start();
    }
    visible: true
    width: 320
    height: 450

    Rectangle {
      id: rec
                anchors.horizontalCenter: parent.horizontalCenter
        anchors.fill: parent
        color: "steelblue"
        Column {
            anchors.fill: parent
            padding: 1.0
            spacing: 5
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                width: rec.width - 10; 
                anchors.margins: 5
                spacing: 5

                Rectangle { 
                  width: (rec.width/2)-35; height: 50; radius: 20.0
                            color: "#42a51c" 
                  Label {
                      id: a
                      anchors.centerIn: parent
                      text: window.randomNumber()
                  }

                }
                Rectangle { 
                  width: 50 ; height: 50
                  color: "steelblue"
                  Label {
                      anchors.centerIn: parent
                      text: "+"
                  }

                }
                Rectangle {
                  width: (rec.width/2)-35; height: 50; radius: 20.0
                            color: "#42a51c" 
                  Label {
                      id: b
                      anchors.centerIn: parent
                      text: a.text
                  }
                }
            }
            Row {
              height: 100
              anchors.horizontalCenter: parent.horizontalCenter
              spacing: 4
              TextField {
                  id: input
                  anchors.verticalCenter: parent.verticalCenter
//                   anchors.horizontalCenter: parent.horizontalCenter
                  width: rec.width - 35; height: 100
                  placeholderText: qsTr("Enter sum")
                  horizontalAlignment: TextInput.AlignHCenter
                  background: Rectangle {
                    id: fieldBackground
                    color: "white"
                    radius: 2
                    implicitWidth: 100
                    implicitHeight: 24
                    border.color: "#333"
                    border.width: 1
                  }

                  onAccepted: {
                    var won = (parseInt(input.text) == parseInt(a.text) + parseInt(b.text))
                    if (won) {
                      input.text = qsTr("Win!")
                      fieldBackground.color = "green"
                    }
                    else {
                      input.text = qsTr("Lost!")
                      fieldBackground.color = "red"
                    }
                    window.delay(1000, function() {
                      if (won) {
                        a.text = window.randomNumber(a.text)
  //                     b.text = window.randomNumber()
                      }
                      input.text = ""
                      fieldBackground.color = "white"
                    })
                  }
              }
              Button { 
                text: "<"
                anchors.verticalCenter: parent.verticalCenter
                width: 20
                height: 98
                onClicked: {
                  input.text = input.text.substring(0, input.text.length-1)
                }
              }
            }
            Grid {
                columns: 3
                spacing: 4
                
                anchors.horizontalCenter: parent.horizontalCenter
                width: rec.width - 10; 

                Button { 
                  text: "1"
                  width: parent.width/3 - 3; 
                  onClicked: {
                    input.text = input.text + "1"
                  }
                }
                Button { 
                  text: "2"
                  width: parent.width/3 - 3; 
                  onClicked: {
                    input.text = input.text + "2"
                  }
                }
                Button { 
                  text: "3"
                  width: parent.width/3 - 3; 
                  onClicked: {
                    input.text = input.text + "3"
                  }
                }
                Button { 
                  text: "4"
                  width: parent.width/3 - 3; 
                  onClicked: {
                    input.text = input.text + "4"
                  }
                }
                Button { 
                  text: "5"
                  width: parent.width/3 - 3; 
                  onClicked: {
                    input.text = input.text + "5"
                  }
                }
                Button { 
                  text: "6"
                  width: parent.width/3 - 3; 
                  onClicked: {
                    input.text = input.text + "6"
                  }
                }
                Button { 
                  text: "7"
                  width: parent.width/3 - 3; 
                  onClicked: {
                    input.text = input.text + "7"
                  }
                }
                Button { 
                  text: "8"
                  width: parent.width/3 - 3; 
                  onClicked: {
                    input.text = input.text + "8"
                  }
                }
                Button { 
                  text: "9"
                  width: parent.width/3 - 3; 
                  onClicked: {
                    input.text = input.text + "9"
                  }
                }
                Button { 
                  text: ""
                  width: parent.width/3 - 3; 
                }
                Button { 
                  text: "0"
                  width: parent.width/3 - 3; 
                  onClicked: {
                    if (input.text.length != 0) {
                      input.text = input.text + "0"
                    }
                  }
                }
                Button { 
                  text: ""
                  width: parent.width/3 - 3; 
                }
            }
            Button { 
              text: "Validate"
              anchors.horizontalCenter: parent.horizontalCenter
              width: rec.width - 10
              onClicked: {
                input.accepted()
              }
            }
        }
    }
}
