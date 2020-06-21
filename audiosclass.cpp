#include "audiosclass.h"
#include <QFile>
#include <QAudioOutput>
#include <QtGlobal>
#include <iostream>

using namespace std;

AudiosClass::AudiosClass(QObject *parent) : QObject(parent)
{

    player = new QMediaPlayer;
    player->setVolume(50);

    list.push_back("qrc:/audios/tour 1.ogg");
    list.push_back("qrc:/audios/avion 1.ogg");


    list.push_back("qrc:/audios/tour 2.ogg");
    list.push_back("qrc:/audios/avion 2.ogg");


    list.push_back("qrc:/audios/tour 3.ogg");
    list.push_back("qrc:/audios/avion 3.ogg");

    list.push_back("qrc:/audios/avion 4.ogg");
    list.push_back("qrc:/audios/center.ogg");

}

void AudiosClass::playfile(int index)
{

    player->setMedia(QUrl(list[index]));

    cout << "------------------current index-------------- " << index << endl;
    player->play();

 }
void AudiosClass::stopfile()
{

    player->stop();

 }
void AudiosClass::setVolume(int value)
{
    cout << "current volume" << value << endl;
    player->setVolume(value);
}
