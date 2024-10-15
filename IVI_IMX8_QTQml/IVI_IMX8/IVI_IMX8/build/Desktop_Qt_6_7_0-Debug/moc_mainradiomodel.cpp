/****************************************************************************
** Meta object code from reading C++ file 'mainradiomodel.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../RadioModel/mainradiomodel.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'mainradiomodel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {

#ifdef QT_MOC_HAS_STRINGDATA
struct qt_meta_stringdata_CLASSMainRadioModelENDCLASS_t {};
constexpr auto qt_meta_stringdata_CLASSMainRadioModelENDCLASS = QtMocHelpers::stringData(
    "MainRadioModel",
    "frequencyChanged",
    "",
    "favFrequencyChanged",
    "frequencyValConversionChanged",
    "favoriteListChanged",
    "stnNameChanged",
    "mute",
    "seekForward",
    "seekBackward",
    "setBarFrequency",
    "freq",
    "startRadio",
    "seekNextStation",
    "seekPreviousStation",
    "setIsFavorite",
    "state",
    "frequencyListCount",
    "getFrequencyList",
    "getStationList",
    "favFrequencyListCount",
    "getFavFrequencyList",
    "getFavStationList",
    "setIndexFromTuneTable",
    "index",
    "type",
    "removeFavFromList",
    "frequency",
    "favFrequency",
    "frequencyValConversion",
    "stnName"
);
#else  // !QT_MOC_HAS_STRINGDATA
#error "qtmochelpers.h not found or too old."
#endif // !QT_MOC_HAS_STRINGDATA
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_CLASSMainRadioModelENDCLASS[] = {

 // content:
      12,       // revision
       0,       // classname
       0,    0, // classinfo
      21,   14, // methods
       4,  171, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       5,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,  140,    2, 0x06,    5 /* Public */,
       3,    0,  141,    2, 0x06,    6 /* Public */,
       4,    0,  142,    2, 0x06,    7 /* Public */,
       5,    0,  143,    2, 0x06,    8 /* Public */,
       6,    0,  144,    2, 0x06,    9 /* Public */,

 // methods: name, argc, parameters, tag, flags, initial metatype offsets
       7,    0,  145,    2, 0x02,   10 /* Public */,
       8,    0,  146,    2, 0x02,   11 /* Public */,
       9,    0,  147,    2, 0x02,   12 /* Public */,
      10,    1,  148,    2, 0x02,   13 /* Public */,
      12,    0,  151,    2, 0x02,   15 /* Public */,
      13,    0,  152,    2, 0x02,   16 /* Public */,
      14,    0,  153,    2, 0x02,   17 /* Public */,
      15,    1,  154,    2, 0x02,   18 /* Public */,
      17,    0,  157,    2, 0x02,   20 /* Public */,
      18,    0,  158,    2, 0x02,   21 /* Public */,
      19,    0,  159,    2, 0x02,   22 /* Public */,
      20,    0,  160,    2, 0x02,   23 /* Public */,
      21,    0,  161,    2, 0x02,   24 /* Public */,
      22,    0,  162,    2, 0x02,   25 /* Public */,
      23,    2,  163,    2, 0x02,   26 /* Public */,
      26,    1,  168,    2, 0x02,   29 /* Public */,

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
      27, QMetaType::Double, 0x00015103, uint(0), 0,
      28, QMetaType::Bool, 0x00015103, uint(1), 0,
      29, QMetaType::QString, 0x00015001, uint(2), 0,
      30, QMetaType::QString, 0x00015103, uint(4), 0,

       0        // eod
};

Q_CONSTINIT const QMetaObject MainRadioModel::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_CLASSMainRadioModelENDCLASS.offsetsAndSizes,
    qt_meta_data_CLASSMainRadioModelENDCLASS,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_CLASSMainRadioModelENDCLASS_t,
        // property 'frequency'
        QtPrivate::TypeAndForceComplete<double, std::true_type>,
        // property 'favFrequency'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'frequencyValConversion'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'stnName'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<MainRadioModel, std::true_type>,
        // method 'frequencyChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'favFrequencyChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'frequencyValConversionChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'favoriteListChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'stnNameChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'mute'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'seekForward'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'seekBackward'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'setBarFrequency'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<double, std::false_type>,
        // method 'startRadio'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'seekNextStation'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'seekPreviousStation'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'setIsFavorite'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        // method 'frequencyListCount'
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        // method 'getFrequencyList'
        QtPrivate::TypeAndForceComplete<QStringList, std::false_type>,
        // method 'getStationList'
        QtPrivate::TypeAndForceComplete<QStringList, std::false_type>,
        // method 'favFrequencyListCount'
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        // method 'getFavFrequencyList'
        QtPrivate::TypeAndForceComplete<QStringList, std::false_type>,
        // method 'getFavStationList'
        QtPrivate::TypeAndForceComplete<QStringList, std::false_type>,
        // method 'setIndexFromTuneTable'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        QtPrivate::TypeAndForceComplete<int, std::false_type>,
        // method 'removeFavFromList'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<int, std::false_type>
    >,
    nullptr
} };

void MainRadioModel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<MainRadioModel *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->frequencyChanged(); break;
        case 1: _t->favFrequencyChanged(); break;
        case 2: _t->frequencyValConversionChanged(); break;
        case 3: _t->favoriteListChanged(); break;
        case 4: _t->stnNameChanged(); break;
        case 5: _t->mute(); break;
        case 6: _t->seekForward(); break;
        case 7: _t->seekBackward(); break;
        case 8: _t->setBarFrequency((*reinterpret_cast< std::add_pointer_t<double>>(_a[1]))); break;
        case 9: _t->startRadio(); break;
        case 10: _t->seekNextStation(); break;
        case 11: _t->seekPreviousStation(); break;
        case 12: _t->setIsFavorite((*reinterpret_cast< std::add_pointer_t<bool>>(_a[1]))); break;
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
        case 19: _t->setIndexFromTuneTable((*reinterpret_cast< std::add_pointer_t<int>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<int>>(_a[2]))); break;
        case 20: _t->removeFavFromList((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (MainRadioModel::*)();
            if (_t _q_method = &MainRadioModel::frequencyChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (MainRadioModel::*)();
            if (_t _q_method = &MainRadioModel::favFrequencyChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (MainRadioModel::*)();
            if (_t _q_method = &MainRadioModel::frequencyValConversionChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (MainRadioModel::*)();
            if (_t _q_method = &MainRadioModel::favoriteListChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (MainRadioModel::*)();
            if (_t _q_method = &MainRadioModel::stnNameChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 4;
                return;
            }
        }
    } else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<MainRadioModel *>(_o);
        (void)_t;
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
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setFrequency(*reinterpret_cast< double*>(_v)); break;
        case 1: _t->setFavFrequency(*reinterpret_cast< bool*>(_v)); break;
        case 3: _t->setStnName(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    } else if (_c == QMetaObject::BindableProperty) {
    }
}

const QMetaObject *MainRadioModel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *MainRadioModel::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_CLASSMainRadioModelENDCLASS.stringdata0))
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
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 21;
    }else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    }
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
