#ifndef AUDIOSCLASS_H
#define AUDIOSCLASS_H

#include <QObject>

class AudiosClass : public QObject
{
    Q_OBJECT
public:
    explicit AudiosClass(QObject *parent = nullptr);

    QStringList list;

public slots:
    void playfile(int index);

signals:

};

#endif // AUDIOSCLASS_H
