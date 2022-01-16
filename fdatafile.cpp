#include "fdatafile.h"

#include <QDataStream>
#include <QFile>
#include <QFileDevice>
#include <QDir>

#include <QSysInfo>
#include <QDebug>

FDataFile::FDataFile(QObject *parent)
    : QObject{parent}
{

    filename = "idedata.dat";
    path = QDir::currentPath();

}

void FDataFile::addData(const QString &n, const QString &l, const QString &p, const QString &u)
{

    FData *data = new FData();
    data->setName(n);
    data->setLogin(l);
    data->setPassword(p);
    data->setUrl(u);

    dataMap.insert(n, data);

    saveData();
}

bool FDataFile::nameExist(const QString &name)
{
    if(dataMap.contains(name))
        return true;

    return false;
}

void FDataFile::loadData()
{
    QFile file(filename);

    if(!QDir::setCurrent(path))
    {
        emit errorFileData("Loading datas failed, could not change the directorie!");
        return;
    }

    if(!file.exists())
    {
        emit errorFileData("Loading datas failed, datas not exist!");
        return;
    }


    if(!file.open(QIODevice::ReadOnly))
    {
        emit errorFileData("Loading datas failed, unable to open file!\n"
                           "Please check your permission.");
        return;
    }

    QDataStream in(&file);


    int count;
    in >> count;

    for(int i = 0; i < count; i++)
    {
        QString name;
        QString login;
        QString password;
        QString url;

        in >> name >> login >> password >> url;

        FData *data = new FData();
        data->setName(name);
        data->setLogin(login);
        data->setPassword(password);
        data->setUrl(url);

        dataMap.insert(name, data);

    }

    //in >> dataMap;

    file.close();
}

void FDataFile::saveData()
{
    QFile file(filename);

    if(!file.open(QIODevice::WriteOnly))
    {
        emit errorFileData("Writing datas failed, unable to write file!\n"
                           "Please check your permission!");
        return;
    }

    QDataStream out(&file);

    int count = dataMap.size();
    out << count;

    QMapIterator<QString, FData *> it(dataMap);
    while (it.hasNext()) {
        it.next();
        out << it.value()->name() << it.value()->login() << it.value()->password() << it.value()->url();
    }
   // out << dataMap;

    file.close();
}

QList<QObject *> FDataFile::dataList()
{
    QList<QObject *> list;
    QMapIterator<QString, FData *> it(dataMap);
    while (it.hasNext()) {
        it.next();
        //list.append( new FData( it.value() ) );
        list.append( new FData( it.value()->name(), it.value()->login(), it.value()->password(), it.value()->url() ) );
    }

    return list;
}
