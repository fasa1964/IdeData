#include "fdata.h"

FData::FData(QObject *parent)
    : QObject{parent}
{

}

FData::FData(const QString &n, const QString &l, const QString &p, const QString &u ,QObject *parent) : QObject (parent)
{
    setName(n);
    setLogin(l);
    setPassword(p);
    setUrl(u);
}

FData::FData(const FData &other, QObject *parent) : QObject (parent)
{
    m_name = other.name();
    m_login = other.login();
    m_password = other.password();
    m_url = other.url();
}

FData::~FData()
{

}

const QString &FData::name() const
{
    return m_name;
}

void FData::setName(const QString &newName)
{
    m_name = newName;
}

const QString &FData::login() const
{
    return m_login;
}

void FData::setLogin(const QString &newLogin)
{
    m_login = newLogin;
}

const QString &FData::password() const
{
    return m_password;
}

void FData::setPassword(const QString &newPassword)
{
    m_password = newPassword;
}

const QString &FData::url() const
{
    return m_url;
}

void FData::setUrl(const QString &newUrl)
{
    m_url = newUrl;
}

QDataStream &operator<<(QDataStream &out, const FData &dat)
{
    out << dat.name() << dat.login() << dat.password() << dat.url();
    return out;
}

QDataStream &operator>>(QDataStream &in, FData &dat)
{
    QString n;
    QString l;
    QString p;
    QString u;

    in >> n >> l >> p >> u;

    dat.setName(n);
    dat.setLogin(l);
    dat.setPassword(p);
    dat.setUrl(u);

    return in;
}


