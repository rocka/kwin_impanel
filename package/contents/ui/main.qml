/*
    SPDX-FileCopyrightText: 2022 Rocket Aaron <i@rocka.me>
    SPDX-License-Identifier: GPL-2.0-or-later
*/

import QtQuick 2.0

import org.kde.plasma.private.kimpanel 0.1 as Kimpanel

Item {
    id: root

    InputPanel { }

    Kimpanel.Kimpanel {
        id: helper
    }

    Connections {
        target: workspace
        function onCurrentDesktopChanged() {
            print(helper.spotRect)
        }
    }
}
