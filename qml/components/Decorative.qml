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

import QtQuick 2.12
import QtGraphicalEffects 1.0
import "../style"

Image {
    anchors {
        top: parent.top
        topMargin: -0.4*height
        right: parent.right
    }
    height: parent.height

    source: Style.decorative.image

    horizontalAlignment: Qt.AlignRight
    fillMode: Image.PreserveAspectFit

    opacity: Style.background.opacity

    Image {
        id: decorativeImage
        anchors.fill: parent

        source: Style.decorative.imageColor

        horizontalAlignment: Qt.AlignRight
        fillMode: Image.PreserveAspectFit
    }
    ColorOverlay {
        anchors.fill: parent
        source: decorativeImage

        color: Style.decorative.color
    }
}
