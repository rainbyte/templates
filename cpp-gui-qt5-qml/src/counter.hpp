#ifndef COUNTER_HPP
#define COUNTER_HPP

#include <QObject>

class Counter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int count READ count NOTIFY countChanged)
public:
    explicit Counter(QObject *parent = nullptr);
    ~Counter() {};
    int count();
    Q_INVOKABLE void increaseCount();

signals:
    void countChanged();

private:
    int m_count = 0;
    void setCount(int count);
};

#endif // COUNTER_HPP
