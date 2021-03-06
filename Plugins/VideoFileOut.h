/*
 * 生成本地视频文件的类，提供了相应的接口，
 * 成员变量类名主要用于消息队列获取数据，
 * 实现类都要继承该抽象类
 */

#ifndef _VIDEO_FILE_OUT_H
#define _VIDEO_FILE_OUT_H

#include "DataBufferPointer.h"
#include <QThread>

class VideoFileOut : public QThread
{
public:
    VideoFileOut() :
        class_name("VideoFileOut"),
        shut_down(true)
    {
        DataBufferPointer::GetInstance().GetEncodeData()->RegistCustomer(ClassName());
    }

public:
    virtual bool Initial() = 0;

    void ShutDown()
    {
        shut_down = false;
    }

protected:
    std::string ClassName()
    {
        return class_name;
    }

protected:
    bool shut_down;

private:
    const std::string class_name;
};

#endif // _VIDEO_FILE_OUT_H
