#include <counter.hpp>

Counter::Counter(QObject *parent) : QObject(parent)
{
    Q_UNUSED(parent)
}

int
Counter::count()
{
    return m_count;
}

void
Counter::setCount(int count)
{
    if (m_count != count) {
        m_count = count;
        emit countChanged();
    }
}

void
Counter::increaseCount()
{
    setCount(m_count + 1);
}