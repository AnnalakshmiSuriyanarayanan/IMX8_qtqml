/****************************************************************************
** Meta object code from reading C++ file 'mainradiomodel.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../IVI_IMX8/RadioModel/mainradiomodel.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'mainradiomodel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_MainRadioModel_t {
    QByteArrayData data[31];
    char stringdata0[452];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_MainRadioModel_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_MainRadioModel_t qt_meta_stringdata_MainRadioModel = {
    {
QT_MOC_LITERAL(0, 0, 14), // "MainRadioModel"
QT_MOC_LITERAL(1, 15, 16), // "frequencyChanged"
QT_MOC_LITERAL(2, 32, 0), // ""
QT_MOC_LITERAL(3, 33, 19), // "favFrequencyChanged"
QT_MOC_LITERAL(4, 53, 29), // "frequencyValConversionChanged"
QT_MOC_LITERAL(5, 83, 19), // "favoriteListChanged"
QT_MOC_LITERAL(6, 103, 14), // "stnNameChanged"
QT_MOC_LITERAL(7, 118, 4), // "mute"
QT_MOC_LITERAL(8, 123, 11), // "seekForward"
QT_MOC_LITERAL(9, 135, 12), // "seekBackward"
QT_MOC_LITERAL(10, 148, 15), // "setBarFrequency"
QT_MOC_LITERAL(11, 164, 4), // "freq"
QT_MOC_LITERAL(12, 169, 10), // "startRadio"
QT_MOC_LITERAL(13, 180, 15), // "seekNextStation"
QT_MOC_LITERAL(14, 196, 19), // "seekPreviousStation"
QT_MOC_LITERAL(15, 216, 13), // "setIsFavorite"
QT_MOC_LITERAL(16, 230, 5), // "state"
QT_MOC_LITERAL(17, 236, 18), // "frequencyListCount"
QT_MOC_LITERAL(18, 255, 16), // "getFrequencyList"
QT_MOC_LITERAL(19, 272, 14), // "getStationList"
QT_MOC_LITERAL(20, 287, 21), // "favFrequencyListCount"
QT_MOC_LITERAL(21, 309, 19), // "getFavFrequencyList"
QT_MOC_LITERAL(22, 329, 17), // "getFavStationList"
QT_MOC_LITERAL(23, 347, 21), // "setIndexFromTuneTable"
QT_MOC_LITERAL(24, 369, 5), // "index"
QT_MOC_LITERAL(25, 375, 4), // "type"
QT_MOC_LITERAL(26, 380, 17), // "removeFavFromList"
QT_MOC_LITERAL(27, 398, 9), // "frequency"
QT_MOC_LITERAL(28, 408, 12), // "favFrequency"
QT_MOC_LITERAL(29, 421, 22), // "frequencyValConversion"
QT_MOC_LITERAL(30, 444, 7) // "stnName"

    },
    "MainRadioModel\0frequencyChanged\0\0"
    "favFrequencyChanged\0frequencyValConversionChanged\0"
    "favoriteListChanged\0stnNameChanged\0"
    "mute\0seekForward\0seekBackward\0"
    "setBarFrequency\0freq\0startRadio\0"
    "seekNextStation\0seekPreviousStation\0"
    "setIsFavorite\0state\0frequencyListCount\0"
    "getFrequencyList\0getStationList\0"
    "favFrequencyListCount\0getFavFrequencyList\0"
    "getFavStationList\0setIndexFromTuneTable\0"
    "index\0type\0removeFavFromList\0frequency\0"
    "favFrequency\0frequencyValConversion\0"
    "stnName"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_MainRadioModel[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      21,   14, // methods
       4,  150, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       5,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,  119,    2, 0x06 /* Public */,
       3,    0,  120,    2, 0x06 /* Public */,
       4,    0,  121,    2, 0x06 /* Public */,
       5,    0,  122,    2, 0x06 /* Public */,
       6,    0,  123,    2, 0x06 /* Public */,

 // methods: name, argc, parameters, tag, flags
       7,    0,  124,    2, 0x02 /* Public */,
       8,    0,  125,    2, 0x02 /* Public */,
       9,    0,  126,    2, 0x02 /* Public */,
      10,    1,  127,    2, 0x02 /* Public */,
      12,    0,  130,    2, 0x02 /* Public */,
      13,    0,  131,    2, 0x02 /* Public */,
      14,    0,  132,    2, 0x02 /* Public */,
      15,    1,  133,    2, 0x02 /* Public */,
      17,    0,  136,    2, 0x02 /* Public */,
      18,    0,  137,    2, 0x02 /* Public */,
      19,    0,  138,    2, 0x02 /* Public */,
      20,    0,  139,    2, 0x02 /* Public */,
      21,    0,  140,    2, 0x02 /* Public */,
      22,    0,  141,    2, 0x02 /* Public */,
      23,    2,  142,    2, 0x02 /* Public */,
      26,    1,  147,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Double,   11,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Bool,   16,
    QMetaType::Int,
    QMetaType::QStringList,
    QMetaType::QStringList,
    QMetaType::Int,
    QMetaType::QStringList,
    QMetaType::QStringList,
    QMetaType::Void, QMetaType::Int, QMetaType::Int,   24,   25,
    QMetaType::Void, QMetaType::Int,   24,

 // properties: name, type, flags
      27, QMetaType::Double, 0x00495103,
      28, QMetaType::Bool, 0x00495103,
      29, QMetaType::QString, 0x00495001,
      30, QMetaType::QString, 0x00495103,

 // properties: notify_signal_id
       0,
       1,
       2,
       4,

       0        // eod
};

void MainRadioModel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<MainRadioModel *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->frequencyChanged(); break;
        case 1: _t->favFrequencyChanged(); break;
        case 2: _t->frequencyValConversionChanged(); break;
        case 3: _t->favoriteListChanged(); break;
        case 4: _t->stnNameChanged(); break;
        case 5: _t->mute(); break;
        case 6: _t->seekForward(); break;
        case 7: _t->seekBackward(); break;
        case 8: _t->setBarFrequency((*reinterpret_cast< double(*)>(_a[1]))); break;
        case 9: _t->startRadio(); break;
        case 10: _t->seekNextStation(); break;
        case 11: _t->seekPreviousStation(); break;
        case 12: _t->setIsFavorite((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 13: { int _r = _t->frequencyListCount();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 14: { QStringList _r = _t->getFrequencyList();
            if (_a[0]) *reinterpret_cast< QStringList*>(_a[0]) = std::move(_r); }  break;
        case 15: { QStringList _r = _t->getStationList();
            if (_a[0]) *reinterpret_cast< QStringList*>(_a[0]) = std::move(_r); }  break;
        case 16: { int _r = _t->favFrequencyListCount();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 17: { QStringList _r = _t->getFavFrequencyList();
            if (_a[0]) *reinterpret_cast< QStringList*>(_a[0]) = std::move(_r); }  break;
        case 18: { QStringList _r = _t->getFavStationList();
            if (_a[0]) *reinterpret_cast< QStringList*>(_a[0]) = std::move(_r); }  break;
        case 19: _t->setIndexFromTuneTable((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2]))); break;
        case 20: _t->removeFavFromList((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (MainRadioModel::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&MainRadioModel::frequencyChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (MainRadioModel::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&MainRadioModel::favFrequencyChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (MainRadioModel::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&MainRadioModel::frequencyValConversionChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (MainRadioModel::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&MainRadioModel::favoriteListChanged)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (MainRadioModel::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&MainRadioModel::stnNameChanged)) {
                *result = 4;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<MainRadioModel *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< double*>(_v) = _t->frequency(); break;
        case 1: *reinterpret_cast< bool*>(_v) = _t->favFrequency(); break;
        case 2: *reinterpret_cast< QString*>(_v) = _t->frequencyValConversion(); break;
        case 3: *reinterpret_cast< QString*>(_v) = _t->stnName(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<MainRadioModel *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setFrequency(*reinterpret_cast< double*>(_v)); break;
        case 1: _t->setFavFrequency(*reinterpret_cast< bool*>(_v)); break;
        case 3: _t->setStnName(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject MainRadioModel::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_MainRadioModel.data,
    qt_meta_data_MainRadioModel,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *MainRadioModel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *MainRadioModel::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_MainRadioModel.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int MainRadioModel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 21)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 21;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 21)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 21;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 4;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void MainRadioModel::frequencyChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void MainRadioModel::favFrequencyChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void MainRadioModel::frequencyValConversionChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void MainRadioModel::favoriteListChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void MainRadioModel::stnNameChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
