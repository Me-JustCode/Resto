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

#ifndef CYCLESCONTROLLER_H
#define CYCLESCONTROLLER_H

#include <QObject>

#include "settingscontroller.h"

class CyclesController final : public QObject
{
    Q_OBJECT
    Q_ENUMS(State)

    Q_PROPERTY(int maxCycleIntervals READ maxCycleIntervals CONSTANT)
    Q_PROPERTY(int currentInterval READ currentInterval WRITE setCurrentInterval NOTIFY currentIntervalChanged)
    Q_PROPERTY(bool isCycleFinished READ isCycleFinished NOTIFY isCycleFinishedChanged)

public:
    CyclesController(SettingsController &settingsController, QObject *parent = 0);

    int maxCycleIntervals() const;

    int currentInterval() const;
    bool isCycleFinished() const;

signals:
    void currentIntervalChanged(int currentInterval) const;
    void isCycleFinishedChanged(bool isCycleFinished) const;

public slots:
    void setCurrentInterval(int currentInterval);
    void resetCurrentInterval();
    void incrementCurrentInterval();

private:
    static const int sc_maxCycleIntervals = 10;
    SettingsController &m_settingsController;

    int m_currentInterval = 0;
};

#endif // CYCLESCONTROLLER_H
