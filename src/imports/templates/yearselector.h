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

#ifndef YEARSELECTOR_H
#define YEARSELECTOR_H

#include <QDate>
#include <QQuickItem>

class YearModel;

class YearSelector : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(YearModel *model READ model NOTIFY modelChanged FINAL)
    Q_PROPERTY(int count READ count NOTIFY countChanged FINAL)
    Q_PROPERTY(QQuickItem *contentItem READ contentItem WRITE setContentItem NOTIFY contentItemChanged FINAL)
    Q_PROPERTY(QQmlComponent *delegate READ delegate WRITE setDelegate NOTIFY delegateChanged FINAL)
    Q_PROPERTY(int visibleItemCount READ visibleItemCount WRITE setVisibleItemCount RESET resetVisibleItemCount NOTIFY visibleItemCountChanged FINAL)
    Q_PROPERTY(QDate from READ from WRITE setFrom RESET resetFrom NOTIFY fromChanged FINAL)
    Q_PROPERTY(QDate to READ to WRITE setTo RESET resetTo NOTIFY toChanged FINAL)
    Q_PROPERTY(QDate selectedDate READ selectedDate WRITE setSelectedDate NOTIFY selectedDateChanged FINAL)
public:
    explicit YearSelector(QQuickItem *parent = nullptr);

    YearModel *model() const;

    int count() const;

    QQuickItem *contentItem() const;
    void setContentItem(QQuickItem *item);

    QQmlComponent *delegate() const;
    void setDelegate(QQmlComponent *delegate);

    int visibleItemCount() const;
    void setVisibleItemCount(int visibleItemCount);
    void resetVisibleItemCount();

    QDate from() const;
    void setFrom(const QDate &date);
    void resetFrom();

    QDate to() const;
    void setTo(const QDate &date);
    void resetTo();

    QDate selectedDate() const;
    void setSelectedDate(const QDate &date);

Q_SIGNALS:
    void modelChanged();
    void countChanged();
    void contentItemChanged();
    void delegateChanged();
    void visibleItemCountChanged();
    void fromChanged();
    void toChanged();
    void selectedDateChanged();

private:
    YearModel *m_model = nullptr;
    QDate m_from;
    QDate m_to;
    QQuickItem *m_contentItem = nullptr;
    QQmlComponent *m_delegate = nullptr;
    int m_visibleItemCount = 7;
    QDate m_selectedDate;
};

QML_DECLARE_TYPE(YearSelector)

#endif // YEARSELECTOR_H
