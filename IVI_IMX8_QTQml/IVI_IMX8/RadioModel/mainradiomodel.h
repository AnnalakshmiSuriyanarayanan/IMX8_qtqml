#ifndef MAINRADIOMODEL_H
#define MAINRADIOMODEL_H

#include <QObject>
#include <QMap>
#include <QVector>
#include <QList>
#include <QVariantList>
#include <QDebug>

#define TEST 0

class MainRadioModel : public QObject
{

    Q_PROPERTY(double frequency READ frequency WRITE setFrequency NOTIFY frequencyChanged)
    Q_PROPERTY(bool favFrequency READ favFrequency WRITE setFavFrequency NOTIFY favFrequencyChanged)
    Q_PROPERTY(QString frequencyValConversion READ frequencyValConversion NOTIFY frequencyValConversionChanged)
    Q_PROPERTY(QString stnName READ stnName WRITE setStnName NOTIFY stnNameChanged)

    Q_OBJECT
public:
    explicit MainRadioModel(QObject *parent = nullptr);
    Q_INVOKABLE void mute();
    void set_freq(float freq);
    Q_INVOKABLE void seekForward();
    Q_INVOKABLE void seekBackward();
    Q_INVOKABLE void setBarFrequency(double freq);
    Q_INVOKABLE void startRadio();
    Q_INVOKABLE void seekNextStation();
    Q_INVOKABLE void seekPreviousStation();
    Q_INVOKABLE void setIsFavorite(bool state);
    Q_INVOKABLE int frequencyListCount();
    Q_INVOKABLE QStringList getFrequencyList();
    Q_INVOKABLE QStringList getStationList();
    Q_INVOKABLE int favFrequencyListCount();
    Q_INVOKABLE QStringList getFavFrequencyList();
    Q_INVOKABLE QStringList getFavStationList();
    Q_INVOKABLE void setIndexFromTuneTable(int index,int type);
    Q_INVOKABLE void removeFavFromList(int index);

    struct Radio
    {
        double frequency;
        bool isFavorite;
        int index;
        QString stationName;
    }radw;
    struct FavStation
    {
        double frequency;
        bool isFavorite;
        QString stationName;
        bool operator<(const FavStation& a) const
        {
            return frequency < a.frequency;
        }
    }favSTN;

    double frequency();
    void setFrequency(double freq);

    bool favFrequency();
    void setFavFrequency(bool frequency);

    QString stnName();
    void setStnName(QString stn);

    QVector<FavStation> favStnVector;
    const double MIN_FREQUENCY = 87.5;
    const double MAX_FREQUENCY = 108;

    QString frequencyValConversion();

    enum TableType {
        PRESETTABLE = 0,
        FAVORITETABLE
    };

private:
    QVector<Radio> radioVector {
        {91.7,false,0,"Aahaa FM"},
        {92.7,false,1,"Big FM"},
        {93.5,false,2,"Suryan FM"},
        {94.3,false,3,"Radio One"},
        {98.3,false,4,"Radio Mirchi"},
        {101.4,false,5,"AIR FM Rainbow"},
        {101.6,false,6,"All India Radio"},
        {102.3,false,7,"AIR FM - Gold"},
        {104.8,false,8,"Chennai Live"},
        {106.4,false,9,"Hello FM"}
    };
    double m_frequency;
    int m_frequencyIndex = 0;
    int m_currentIndex;
    bool m_favFrequency;
    QString m_frequencyValConversion;
    QString m_stationName;

signals:
    void frequencyChanged();
    void favFrequencyChanged();
    void frequencyValConversionChanged();
    void favoriteListChanged();
    void stnNameChanged();
};

#endif // MAINRADIOMODEL_H
