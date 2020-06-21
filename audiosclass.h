#ifndef AUDIOSCLASS_H
#define AUDIOSCLASS_H

#include <QObject>
#include <QMediaPlayer>
#include <QMediaPlaylist>
class AudiosClass : public QObject
{
    Q_OBJECT
public:
    explicit AudiosClass(QObject *parent = nullptr);

    QStringList list;
    QMediaPlayer *player;

public slots:
    Q_INVOKABLE void playfile(int index);
    Q_INVOKABLE void setVolume(int value);
    Q_INVOKABLE void stopfile();
signals:

};

#endif // AUDIOSCLASS_H
