#ifndef FDATA_H
#define FDATA_H

#include <QObject>
#include <QString>

class FData : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY dataHasChanged )
    Q_PROPERTY(QString login READ login WRITE setLogin NOTIFY dataHasChanged)
    Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY dataHasChanged )
    Q_PROPERTY(QString url READ url WRITE setUrl NOTIFY dataHasChanged)

public:
    FData(QObject *parent = nullptr);
    FData(const QString &n, const QString &l, const QString &p, const QString &u, QObject *parent = nullptr);
    FData(const FData &other, QObject *parent = nullptr);
    ~FData();

    const QString &name() const;
    void setName(const QString &newName);

    const QString &login() const;
    void setLogin(const QString &newLogin);

    const QString &password() const;
    void setPassword(const QString &newPassword);

    const QString &url() const;
    void setUrl(const QString &newUrl);

signals:

    void dataHasChanged();

private:

    QString m_name;
    QString m_login;
    QString m_password;
    QString m_url;

};

Q_DECLARE_METATYPE(FData)

QDataStream &operator<<(QDataStream &out, const FData &dat);
QDataStream &operator>>(QDataStream &in, FData &dat);




#endif // FDATA_H
