/*
    Copyright 2014-2019 Paul Colby

    This file is part of Bipolar.

    Bipolar is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Biplar is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Bipolar.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef __GPX_OPTIONS_DIALOG__
#define __GPX_OPTIONS_DIALOG__

#include <QDialog>

class GpxOptionsDialog : public QDialog {
    Q_OBJECT

public:
    GpxOptionsDialog(QWidget *parent=0, Qt::WindowFlags flags=0);

};

#endif // __GPX_OPTIONS_DIALOG__
