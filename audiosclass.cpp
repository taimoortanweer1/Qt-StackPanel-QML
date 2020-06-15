#include "audiosclass.h"
#include <QFile>
#include <QAudioOutput>
#include <QtGlobal>
#include <iostream>
#include <QMediaPlayer>
#include <QMediaPlaylist>
using namespace std;

AudiosClass::AudiosClass(QObject *parent) : QObject(parent)
{

    list.push_back("qrc:/audios/avion 1.ogg");
    list.push_back("qrc:/audios/avion 2.ogg");
    list.push_back("qrc:/audios/avion 3.ogg");
    list.push_back("qrc:/audios/avion 4.ogg");
    list.push_back("qrc:/audios/tour 1.ogg");
    list.push_back("qrc:/audios/tour 2.ogg");
    list.push_back("qrc:/audios/tour 3.ogg");
    list.push_back("qrc:/audios/center.ogg");
}

void AudiosClass::playfile(int index)
{

    QMediaPlayer *player = new QMediaPlayer;

    //player->setMedia(QUrl("qrc:/audios/avion 1.ogg"));
    player->setMedia(QUrl(list[index]));
    player->setVolume(50);
    player->play();

 }
