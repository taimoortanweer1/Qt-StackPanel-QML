#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>

#include "audiosclass.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);


    QQuickView view(QUrl("qrc:/SimulationAvionTower.qml"));
    QObject *item = (QObject*)view.rootObject();

    AudiosClass audio;
    QObject::connect(item, SIGNAL(playAudio(int)),&audio, SLOT(playfile(int)));

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
