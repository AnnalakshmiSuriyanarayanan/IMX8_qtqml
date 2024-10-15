#include "mainradiomodel.h"
#include <iostream>
#include <unistd.h>
#include <fcntl.h>
#include <bits/stdc++.h>
#include <QMap>
#include <QDebug>
#include <QVector>
#include <algorithm>

#if TEST
#include <linux/i2c-dev.h>
#include <sys/ioctl.h>
#endif

#define I2C_DEVICE "/dev/i2c-19"
#define I2C_ADDRESS 0x60


MainRadioModel::MainRadioModel(QObject *parent)
    : QObject{parent},
    m_frequency(radioVector.at(0).frequency),
    m_currentIndex(0),
    m_favFrequency(false),
    m_frequencyValConversion(QString::number(m_frequency,'f',1)+"0"),
    m_stationName(radioVector.at(0).stationName)
{
    startRadio();
}

//switch off radio
void MainRadioModel::mute()
{
#if TEST
    unsigned char data[4] = {0};
    std::cout<<"Mute pressed";
    data[0] = 0x00;

    data[1] = 0x00;
    data[2] = 0x00;
    data[3] = 0x00;

    if (ioctl(i2c_file, I2C_SLAVE, I2C_ADDRESS) < 0) {
        perror("Failed to set I2C slave address");
        return;
    }

    if (write(i2c_file, data, sizeof(data)) != sizeof(data)) {
        perror("Failed to write to I2C device");
        return;
    }

    std::cout << "Radio Muted" << std::endl;
#endif
}

//Set Frequency to the Board
void MainRadioModel::set_freq(float freq)
{
#if TEST
    int freq14bit = (int)(4 * (freq * 1000000 + 225000) / 32768);
    unsigned char data[4] = {0};
    data[0] = freq14bit >> 8;
    data[1] = freq14bit & 0xFF;
    data[2] = 0xB0;
    data[3] = 0x10;

    if (ioctl(i2c_file, I2C_SLAVE, I2C_ADDRESS) < 0) {
        perror("Failed to set I2C slave address");
        return;
    } else {
        std::cout<<"I2c slave address set successfully";
    }

    if (write(i2c_file, data, sizeof(data)) != sizeof(data)) {
        perror("Failed to write to I2C device");
        return;
    } else {
#endif
        setFrequency(freq);
        std::cout << "Frequency set to: " << freq << " MHz" << std::endl;
#if TEST
        std::cout<<"Success writing to i2c device";
    }
#endif
}

//Seek in forward direction by 0.1
void MainRadioModel::seekForward()
{
    qDebug()<<"Frequency seek up by 0.1";
    bool isPresent = false;
    bool hasStn = false;
    int size = radioVector.size()-1;
    if(m_frequency >= MAX_FREQUENCY)
        m_frequency = MIN_FREQUENCY;
    else
        m_frequency += 0.1;
    for(auto vectorit = radioVector.begin();vectorit != radioVector.end();vectorit++) {
        if(QString::compare((QString::number(vectorit->frequency,'f',1)),(QString::number(m_frequency,'f',1)))==0){
            m_currentIndex += 1;
            if(m_currentIndex == size)
                m_currentIndex = 0;
            hasStn = true;
            setStnName(vectorit->stationName);
        }
    }
    if(!favStnVector.isEmpty()){
        for(auto itr = favStnVector.begin();itr != favStnVector.end();itr++) {
            qDebug()<<"Print the frequencies "<<QString::number(itr->frequency,'f',1)<<QString::number(m_frequency,'f',1);
            if(QString::compare((QString::number(itr->frequency,'f',1)),(QString::number(m_frequency,'f',1)))==0){
                setFavFrequency(true);
                isPresent = true;
                break;
            }
        }
    }
    if(!hasStn)
        setStnName("unknown");
    if(!isPresent)
        setFavFrequency(isPresent);
    set_freq(m_frequency);
}

//Seek in backward direction by 0.1
void MainRadioModel::seekBackward()
{
    qDebug()<<"Frequency seek down by 0.1"<<m_frequency;
    bool isPresent = false;
    bool hasStn = false;
    int size = radioVector.size()-1;
    if(m_frequency <= MIN_FREQUENCY)
        m_frequency = MAX_FREQUENCY;
    else
        m_frequency -= 0.1;
    for(auto vectorit = radioVector.begin();vectorit != radioVector.end();vectorit++) {
        if(QString::compare((QString::number(vectorit->frequency,'f',1)),(QString::number(m_frequency,'f',1)))==0){
            m_currentIndex -= 1;
            if(m_currentIndex == -1)
                m_currentIndex = size;
            hasStn = true;
            setStnName(vectorit->stationName);
        }
    }
    if(!favStnVector.isEmpty()){
        for(auto itr = favStnVector.begin();itr != favStnVector.end();itr++) {
            if(QString::compare((QString::number(itr->frequency,'f',1)),(QString::number(m_frequency,'f',1)))==0){
                setFavFrequency(true);
                isPresent = true;
                break;
            }
        }
    }
    if(!hasStn)
        setStnName("unknown");
    if(!isPresent)
        setFavFrequency(isPresent);
    set_freq(m_frequency);
}

//Frequency set through bar
void MainRadioModel::setBarFrequency(double freq)
{
    qDebug()<<"Frequency set through bar"<<freq;
    bool hasStn = false;
    bool isPresent = false;
    for(auto vectorit = radioVector.begin();vectorit != radioVector.end();vectorit++) {
        if(vectorit->frequency>freq){
            m_currentIndex = vectorit->index;
            if(QString::compare((QString::number(vectorit->frequency,'f',1)),(QString::number(freq,'f',1)))==0) {
                setStnName(radioVector.at(vectorit->index).stationName);
                hasStn = true;
            }
            break;
        }
    }
    if(!favStnVector.isEmpty()){
        for(auto itr = favStnVector.begin();itr != favStnVector.end();itr++) {
            if(QString::compare((QString::number(itr->frequency,'f',1)),(QString::number(m_frequency,'f',1)))==0){
                setFavFrequency(true);
                isPresent = true;
                break;
            }
        }
    }
    if(!hasStn)
        setStnName("unknown");
    if(!isPresent)
        setFavFrequency(isPresent);
    set_freq(freq);
}

void MainRadioModel::startRadio()
{
    qDebug()<<"Radio started";
#if TEST
    i2c_file = open(I2C_DEVICE, O_RDWR);
    if (i2c_file < 0) {
        perror("Failed to open I2C device");
        return;
    } else {
        std::cout<<"Success opening device";
    }
#endif
}

void MainRadioModel::seekNextStation()
{

    int size = radioVector.size()-1;
    if(m_currentIndex != size)
        m_currentIndex += 1;
    else
        m_currentIndex = 0;
    qDebug()<<"index"<<m_currentIndex<<"Size "<<size;
    bool favStatus = radioVector.at(m_currentIndex).isFavorite;
    setFavFrequency(favStatus);
    set_freq(radioVector.at(m_currentIndex).frequency);
    setStnName(radioVector.at(m_currentIndex).stationName);
}

void MainRadioModel::seekPreviousStation()
{
    int size = radioVector.size()-1;
    if(m_currentIndex <= 0)
        m_currentIndex = size;
    else
        m_currentIndex-=1;
    qDebug()<<"index"<<m_currentIndex<<"Size "<<size;
    bool favStatus = radioVector.at(m_currentIndex).isFavorite;
    setFavFrequency(favStatus);
    set_freq(radioVector.at(m_currentIndex).frequency);
    setStnName(radioVector.at(m_currentIndex).stationName);
}

void MainRadioModel::setIsFavorite(bool state)
{
    bool ispresent = false;
    QString freq = QString::number(m_frequency,'f',1);
    for(auto vectorit = radioVector.begin();vectorit != radioVector.end();vectorit++) {
        QString staticFreq = QString::number(vectorit->frequency,'f',1);
        qDebug()<<"Frequency"<<vectorit->frequency<<m_frequency<<freq;
        // if(vectorit->frequency == m_frequency)
        if(QString::compare(freq,staticFreq)== 0)
        {
            qDebug()<<"Frequency present in list";
            ispresent = true;
            vectorit->isFavorite = state;
            favSTN.isFavorite = vectorit->isFavorite;
            favSTN.frequency = vectorit->frequency;
            favSTN.stationName = vectorit->stationName;
            break;
        }
    }
    if(!ispresent) {
        qDebug()<<"Frequency not present in list";
        favSTN.isFavorite = state;
        favSTN.frequency = m_frequency;
        favSTN.stationName = "unknown";
    }

    if(state == true){
        setFavFrequency(favSTN.isFavorite);
        favStnVector.push_back(favSTN);
    } else {
        setFavFrequency(favSTN.isFavorite);
        int indexValue = 0;
        for(auto itr = favStnVector.begin();itr != favStnVector.end();itr++) {
            qDebug()<<"Index to be Sorted"<<indexValue;
            QString staticFreq = QString::number(itr->frequency,'f',1);
            if(QString::compare(freq,staticFreq)== 0){
                qDebug()<<"Index to be removed"<<indexValue;
                favStnVector.remove(indexValue);
                break;
            } else {
                indexValue+=1;
            }
        }
    }
    std::sort(favStnVector.begin(),favStnVector.end());
    emit favoriteListChanged();
    if(!favStnVector.isEmpty()){
        for(auto itr = favStnVector.begin();itr != favStnVector.end();itr++) {
            qDebug()<<itr->frequency<<"\t"<<itr->isFavorite<<"\t"<<itr->stationName<<"\n";
        }
    } else {
        qDebug()<<"No favorite stations available";
    }
}

int MainRadioModel::frequencyListCount()
{
    return radioVector.size();
}

QStringList MainRadioModel::getFrequencyList()
{
    QStringList freqList;
    for(auto vectorit = radioVector.begin();vectorit != radioVector.end();vectorit++) {
        freqList.append(QString::number(vectorit->frequency));
    }
    return freqList;
}

QStringList MainRadioModel::getStationList()
{
    QStringList stnList;
    for(auto vectorit = radioVector.begin();vectorit != radioVector.end();vectorit++) {
        stnList.append(vectorit->stationName);
    }
    return stnList;
}

int MainRadioModel::favFrequencyListCount()
{
    return favStnVector.size();
}

QStringList MainRadioModel::getFavFrequencyList()
{
    QStringList favfreqList;
    favfreqList.clear();
    if(!favStnVector.isEmpty()){
        for(auto itr = favStnVector.begin();itr != favStnVector.end();itr++){
            favfreqList.append(QString::number(itr->frequency));
        }
    }
    return favfreqList;
}

QStringList MainRadioModel::getFavStationList()
{
    QStringList favStnList;
    favStnList.clear();
    if(!favStnVector.isEmpty()){
        for(auto itr = favStnVector.begin();itr != favStnVector.end();itr++)
                favStnList.append(itr->stationName);        
    }
    return favStnList;
}

QString MainRadioModel::frequencyValConversion()
{
    return m_frequencyValConversion;
}

void MainRadioModel::setIndexFromTuneTable(int index,int type)
{
    double value = m_frequency;
    if(type == PRESETTABLE) {
        value = radioVector.at(index).frequency;
        m_currentIndex = radioVector.at(index).index;
        bool favStatus = radioVector.at(m_currentIndex).isFavorite;
        setStnName(radioVector.at(m_currentIndex).stationName);
        setFavFrequency(favStatus);
        // set_freq(radioVector.at(index).frequency);
    } else if(type == FAVORITETABLE){
        value = favStnVector.at(index).frequency;
        for(auto itr = radioVector.begin();itr!=radioVector.end();itr++){
            if(QString::compare((QString::number(itr->frequency,'f',1)),(QString::number(value,'f',1)))==0){
                m_currentIndex = itr->index;
            }
        }
        setStnName(favStnVector.at(index).stationName);
        setFavFrequency(true);
    }
    set_freq(value);
}

void MainRadioModel::removeFavFromList(int index)
{
    int ind = index;
    if(!favStnVector.isEmpty()) {
        favStnVector.remove(ind);
        // setFavFrequency(false);
        for(auto vectorit = radioVector.begin();vectorit != radioVector.end();vectorit++) {
            if(QString::compare((QString::number(vectorit->frequency,'f',1)),(QString::number(m_frequency,'f',1)))==0){
                vectorit->isFavorite = false;
            }
        }
        emit favoriteListChanged();
    }
}

double MainRadioModel::frequency()
{
    return m_frequency;
}

void MainRadioModel::setFrequency(double freq)
{
    m_frequency = freq;
    m_frequencyValConversion = QString::number(m_frequency,'f',1);
    qDebug()<<"The frequency is "<<m_frequency<<m_frequencyValConversion;
    emit frequencyChanged();
    emit frequencyValConversionChanged();
}

bool MainRadioModel::favFrequency()
{
    return m_favFrequency;
}

void MainRadioModel::setFavFrequency(bool frequency)
{
    m_favFrequency = frequency;
    emit favFrequencyChanged();
}

QString MainRadioModel::stnName()
{
    return m_stationName;
}

void MainRadioModel::setStnName(QString stn)
{
    m_stationName = stn;
    emit stnNameChanged();
}
