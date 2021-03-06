/********************************************
**
** Copyright 2016 Justyna JustCode
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

pragma Singleton
import QtQuick 2.12

QtObject {
    id: style

    readonly property var availableApplicationColors:   ["#19886F", "#EC811B", "#682C90", "#C0159B", "#008000", "#0958EC", "#666666"]
    readonly property var highlightedApplicationColors: ["#28DAB2", "#FFB545", "#EF3EAD", "#FF9EB1", "#00CD00", "#84AFFF", "#A3A3A3"]

    //FF5072
    property int mainColorIndex: controller.settings.applicationColorIndex
    property color mainColor: availableApplicationColors[mainColorIndex]
    readonly property color secondaryLightColor: "white"
    readonly property color secondaryDarkColor: "#1E1E1E"

    readonly property color shadowColor: "#88000000"
}
