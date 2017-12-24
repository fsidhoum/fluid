/*
 * This file is part of Fluid.
 *
 * Copyright (C) 2017 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 *
 * $BEGIN_LICENSE:MPL2$
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * $END_LICENSE$
 */

import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import Fluid.Controls 1.0 as FluidControls
import Fluid.Templates 1.0 as FluidTemplates

/*!
    \qmltype YearSelector
    \inqmlmodule Fluid.Controls
    \ingroup fluidcontrols

    \brief Tumbler to select a year between \a from and \a to

    The YearSelector is used to select a year between minDate and maxDate.
    It's part of the DatePicker but can be used also standalone.

    \code
    import QtQuick 2.0
    import Fluid.Controls 1.0 as FluidControls

    Item {
        width: 600
        height: 600

        FluidControls.YearSelector {
            anchors.fill: parent
            from: new Date(1976, 0, 1)
            to: new Date(2150, 11, 31)

            onSelectedDateChanged: {
                console.log(selectedDate)
            }
        }
    }
    \endcode

    For more information you can read the
    \l{https://material.io/guidelines/components/pickers.html}{Material Design guidelines}.
*/
FluidTemplates.YearSelector {
    id: control

    onSelectedDateChanged: control.contentItem.currentIndex = selectedDate.getFullYear() - from.getFullYear()

    delegate: FluidControls.SubheadingLabel {
        text: model.year
        color: ListView.view.currentIndex === index ? control.Material.accent : control.Material.primaryTextColor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.bold: ListView.view.currentIndex === index
        font.pixelSize: ListView.view.currentIndex === index ? 24 : 16
        width: parent.width
        height: control.contentItem.height / control.visibleItemCount
    }

    contentItem: ListView {
        width: parent.width
        height: parent.height
        clip: true
        model: control.model
        delegate: control.delegate
        highlightRangeMode: ListView.StrictlyEnforceRange
        highlightMoveDuration: 0
        preferredHighlightBegin: height / 2 - height / control.visibleItemCount / 2
        preferredHighlightEnd: height / 2 + height / control.visibleItemCount / 2
        onCurrentIndexChanged: {
            var year = model.get(currentIndex);
            var month = control.selectedDate.getMonth();
            var day = control.selectedDate.getDay();

            if (selectedDate.getFullYear() !== year)
                control.selectedDate = new Date(model.get(currentIndex), month, day);
        }

        Component.onCompleted: currentIndex = selectedDate.getFullYear() - from.getFullYear()
    }
}
