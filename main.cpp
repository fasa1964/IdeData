#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QLocale>
#include <QIcon>
#include <QTranslator>

#include <fdata.h>
#include <fdatafile.h>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    app.setApplicationName("IdeData");
    app.setApplicationVersion("2.0");

    app.setWindowIcon(QIcon(":/drawable/IDEDataIcon-48.png"));


    //qRegisterMetaType<FData *>();
    qRegisterMetaType<FData>("FData");
    qmlRegisterType<FDataFile>("fdatafile", 1,0, "FDataFile");


    QTranslator translator;
    const QStringList uiLanguages = QLocale::system().uiLanguages();
    for (const QString &locale : uiLanguages) {
        const QString baseName = "Ide-Data_" + QLocale(locale).name();
        if (translator.load(":/i18n/" + baseName)) {
            app.installTranslator(&translator);
            break;
        }
    }

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
