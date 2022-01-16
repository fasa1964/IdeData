#ifndef FDATAFILE_H
#define FDATAFILE_H

#include <QObject>
#include <QMap>


#include <fdata.h>

class FDataFile : public QObject
{
    Q_OBJECT
public:
    explicit FDataFile(QObject *parent = nullptr);



public slots:

    void addData(const QString &n /*name*/, const QString &l /*login*/, const QString &p /*password*/, const QString &u /*url*/);
    bool nameExist(const QString &name);
    void loadData();
    void saveData();

    QList<QObject *> dataList();


signals:

    void errorFileData(const QString &errorMessage);


private:

    QString filename;
    QString path;

    QMap<QString, FData *> dataMap;


};

#endif // FDATAFILE_H
