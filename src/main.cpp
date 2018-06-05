#include <iostream>
#include <libconfig.h++>
#include <string.h>
#include <stdio.h>

#include "TapQuoteAPI.h"
#include "TapAPIError.h"
#include "./Demo/TapQuoteAPI/Quote.h"
#include "./Demo/TapQuoteAPI/QuoteConfig.h"



using namespace std;

void ShowBuf(char* buf,int len)
{
    printf("===================\n");
        for(int i=0; i < len; ++i)
    {
        if(i%32==0){
            printf("\n");
        }
        printf("0x%x(%c) ", buf[i], buf[i]);
    }
    printf("===================\n");
}

int main()
{
    libconfig::Config mConfig;
    string strConfPath = "/root/learngit/conf/configAll.cfg";
    try
    {
        mConfig.readFile(strConfPath.c_str());
    }
    catch(libconfig::FileIOException &e)
    {
        cout<<"read file [ "<<strConfPath<< " ] FileIOException"<<endl;
        return -1;
    }
    catch(libconfig::ParseException &e)
    {
        cout<<"read file [ "<<strConfPath<< " ],ParaseException: "<<e.getError()<<",line:"<<e.getLine()<<endl;
        return -1;
    }
    catch(...)
    {
        cout<<"read file ["<<strConfPath<< " ] unknown exception"<<endl;
        return -1;
    }
    try
    {
        const char *account_id;
        mConfig.lookupValue("account.id", account_id);
        cout<<"Account.id:"<<account_id<<endl;
    }
    catch(...)
    {
    cout<<"Get Account from failed"<<endl;
    }

    //取得API的版本信息
    cout << GetTapQuoteAPIVersion() << endl;

    //创建API实例
    TAPIINT32 iResult = TAPIERROR_SUCCEED;
    TapAPIApplicationInfo stAppInfo;
    strcpy(stAppInfo.AuthCode, DEFAULT_AUTHCODE);
	strcpy(stAppInfo.KeyOperationLogPath, "\\log");

    ITapQuoteAPI *pAPI = CreateTapQuoteAPI(&stAppInfo, iResult);
    if (NULL == pAPI){
            cout << "创建API实例失败，错误码：" << iResult <<endl;
            return -1;
    }

    //设定ITapQuoteAPINotify的实现类，用于异步消息的接收
    Quote objQuote;
    pAPI->SetAPINotify(&objQuote);


    //启动测试，订阅行情
    objQuote.SetAPI(pAPI);
    objQuote.RunTest();

    return 0;
}
