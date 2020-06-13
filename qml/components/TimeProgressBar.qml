/********************************************
**
** Copyright 2016 JustCode Justyna Kulinska
**
** This file is part of Resto.
**
** Resto is free software; you can redistribute it and/or modify
** it under the terms of the GNU General Public License as published by
** the Free Software Foundation; either version 2 of the License, or
** any later version.
**
** Resto is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
** GNU General Public License for more details.
**
** You should have received a copy of the GNU General Public License
** along with Resto; if not, write to the Free Software
** Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
**
********************************************/

import QtQuick 2.12
import QtQuick.Layouts 1.3
import "../style"
import "helpers"

Item {
    property int minValue: 0
    property int maxValue: 100
    property int value: 0

    implicitHeight: text.font.pixelSize*1.4
    implicitWidth: 200

    signal timeValueChanged(var newValue)

    QtObject {
        id: d

        property bool isExcess: value > maxValue
        property real valuePercent: isExcess ? maxValue/value : value/maxValue

        function formatTime(timeSecs) {
            var hours, mins, secs
            secs = timeSecs%60
            mins = (Math.floor(timeSecs/60))%60
            hours = Math.floor( (Math.floor(timeSecs/60))/60 )

            var hoursStr, minsStr, secsStr
            secsStr = secs > 9 ? secs : '0' + secs
            minsStr = mins > 9 ? mins : '0' + mins
            hoursStr = hours > 9 ? hours : '0' + hours

            return hoursStr + ':' + minsStr + ':' + secsStr
        }

        function deFormatTime(timeStr)
        {
            var splitted = timeStr.split(':')

            var hours = parseInt(splitted[0])
            var mins = parseInt(splitted[1])
            var secs = parseInt(splitted[2])

            return hours * 60 * 60 + mins * 60 + secs
        }
    }

    Rectangle {
        id: background
        anchors.fill: parent

        color: Style.timeBar.backgroundColor
        border.color: Style.timeBar.color
        border.width: 1
    }
    Rectangle {
        id: progress
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }

        gradient: BarGradient { color: Style.timeBar.color }

        width: d.valuePercent * parent.width
    }
    Rectangle {
        id: excess
        anchors {
            left: progress.right
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
        visible: d.isExcess

        gradient: BarGradient { color: Style.timeBar.secondaryColor }
    }

    RowLayout {
        anchors.fill: parent
        spacing: 1

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Label {
                id: text
                anchors.fill: parent
                visible: !textEditableInput.visible
                fontStyle: Style.timeBar.font

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight

                elide: Text.ElideRight

                text: d.formatTime(value)

                BarTextGradient { //TODO
                    source: parent
                    value: d.valuePercent
                }
            }

            LabelInput {
                id: textEditableInput
                anchors.fill: parent
                visible: false

                cursorVisible: true

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight

                fontStyle: Style.spinBox.font
                color: "red"

                inputMask: "99:99:99"

                onAccepted:
                {
                    timeValueChanged(d.deFormatTime(textEditableInput.text))
                    visible = false
                }

                onFocusChanged:
                {
                    if(!focus)
                    {
                        visible = false
                    }
                }
            }

            MouseArea {
                anchors.fill: parent
                propagateComposedEvents: true
                onPressAndHold:
                {
                    textEditableInput.visible = !textEditableInput.visible
                    if(textEditableInput.visible)
                    {
                        textEditableInput.text = text.text.replace(/ /g, '')
                        textEditableInput.focus = true
                    }
                    else
                    {
                        timeValueChanged(d.deFormatTime(textEditableInput.text))
                    }
                }

                onClicked:
                {
                    textEditableInput.visible = false
                }
            }
        }

        Label {
            Layout.fillHeight: true
            Layout.preferredHeight: 0
            Layout.preferredWidth: implicitWidth
            fontStyle: Style.timeBar.font

            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft

            text: "/"

            BarTextGradient { //TODO
                source: parent
                value: d.valuePercent
            }
        }

        Label {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: 0
            Layout.preferredWidth: 0
            fontStyle: Style.timeBar.font

            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft

            elide: Text.ElideRight

            text: d.formatTime(maxValue)

            BarTextGradient { //TODO
                source: parent
                value: d.valuePercent
            }
        }
    }
}

