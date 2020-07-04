#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QTranslator>

#include <counter.hpp>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QTranslator translator;
    bool translationLoaded = translator.load(QLocale(),
            QLatin1String("hello-qt-qml"), QLatin1String("_"),
            QLatin1String(":/translations"));
    if (translationLoaded) {
        app.installTranslator(&translator);
    } else {
        qWarning() << "Translations not loaded";
    }

    qmlRegisterType<Counter>("io.rainbyte.hello", 1, 0, "Counter");

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
