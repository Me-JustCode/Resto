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
import QtQuick.Window 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import Resto.Types 1.0
import "components"
import "dialogs"
import "style"

ApplicationWindow {
    visible: true

    minimumWidth: controller.settings.defaultWindowSize.width
    minimumHeight: controller.settings.defaultWindowSize.height

    function showBreakDialog() {
        dialogsManager.showBreakDialog()
    }
    function showSettingsDialog() {
        dialogsManager.showSettingsDialog()
    }
    function showAboutDialog() {
        dialogsManager.showAboutDialog()
    }

    QtObject {
        id: d

        property bool geometryInitialized: false

        function initializeGeometry() {
            width = controller.settings.windowSize.width
            height = controller.settings.windowSize.height
            x = controller.settings.windowPosition.x >= 0 ?
                        controller.settings.windowPosition.x : (Screen.width - width)/2
            y = controller.settings.windowPosition.y >= 0 ?
                        controller.settings.windowPosition.y : (Screen.height - height)/2

            geometryInitialized = true;
        }

        function saveCurrentWidth() {
            if (geometryInitialized) {
                controller.settings.windowSize.width = width;
            }
        }
        function saveCurrentHeight() {
            if (geometryInitialized) {
                controller.settings.windowSize.height = height;
            }
        }
        function saveCurrentX() {
            if (geometryInitialized) {
                controller.settings.windowPosition.x = x;
            }
        }
        function saveCurrentY() {
            if (geometryInitialized) {
                controller.settings.windowPosition.y = y;
            }
        }


    }

    // load and save main window position and size
    Component.onCompleted: {
        d.initializeGeometry();

        // check if update available
        controller.updater.checkUpdateAvailable();
    }

    onWidthChanged: {
        d.saveCurrentWidth()
    }
    onHeightChanged: {
        d.saveCurrentHeight()
    }

    onXChanged: {
        d.saveCurrentX()
    }
    onYChanged: {
        d.saveCurrentY()
    }
    // ----------------------------------------------

    // logic
    DialogsManager {
        id: dialogsManager

        overlayItem: overlay
    }
    ConnectionsManager {
        dialogsManager: dialogsManager
    }

    MainContent {
        id: mainContent
        anchors.fill: parent
    }

    Overlay {
        id: overlay
    }
}

