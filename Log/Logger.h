﻿#ifndef _LOGGER_H
#define _LOGGER_H

#include <QThread>
#include <QDateTime>

class QFile;

namespace Logger
{
    enum LogLevel
    {
        INFO,
        WARNING,
        ERRORINFOR
    };

    class Log : public QThread
    {
    public:
        static Log& GetInstance();

        void ShutDown()
        {
            m_shut_down = false;
        }

    protected:
        std::string ClassName()
        {
            return m_class_name;
        }

        void run();

    private:
        Log(const Log&) = delete;
        Log& operator=(const Log&) = delete;

        Log();
        ~Log();

    private:
        void WriteLog
            (
                const int& level,
                const std::string& class_name,
                const std::string& message,
                const std::string& time
            );

    private:
        bool m_shut_down;
        QFile* p_file_log;
        std::string m_class_name;
    };
}

#endif // _LOGGER_H
