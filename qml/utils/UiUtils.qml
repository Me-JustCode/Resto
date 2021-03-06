/********************************************
**
** Copyright 2020 Justyna JustCode
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
import "."
import "../style"

QtObject {
    id: uiUtils

    function resolveControlColor(baseColor, enabled)
    {
        return enabled ? baseColor
                       : Qt.tint(baseColor, Style.disableTint);
    }

    function averageTextWidth(fontMetrics, charsCount)
    {
        var AVERAGE_WIDTH_ENLARGE = 2;
        return charsCount * AVERAGE_WIDTH_ENLARGE * fontMetrics.averageCharacterWidth;
    }
    function maxTextWidth(fontMetrics, charsCount)
    {
        return charsCount * fontMetrics.maximumCharacterWidth;
    }
}
