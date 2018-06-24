#include "Quote.h"
#include "TapAPIError.h"
#include "QuoteConfig.h"
//#include <Windows.h>
#include <iostream>
#include <string.h>

using namespace std;

Quote::Quote(void):
	m_pAPI(NULL),
	m_bIsAPIReady(false)
{
}


Quote::~Quote(void)
{
}


void Quote::SetAPI(ITapQuoteAPI *pAPI)
{
	m_pAPI = pAPI;
}


void Quote::RunTest()
{
	if(NULL == m_pAPI) {
		cout << "Error: m_pAPI is NULL." << endl;
		return;
	}

	TAPIINT32 iErr = TAPIERROR_SUCCEED;


	//设定服务器IP、端口
	iErr = m_pAPI->SetHostAddress(DEFAULT_IP, DEFAULT_PORT);
	if(TAPIERROR_SUCCEED != iErr) {
		cout << "SetHostAddress Error:" << iErr <<endl;
		return;
	}

	//登录服务器
	TapAPIQuoteLoginAuth stLoginAuth;
	memset(&stLoginAuth, 0, sizeof(stLoginAuth));
	APIStrncpy(stLoginAuth.UserNo, DEFAULT_USERNAME);
	cout << "DEFAULT_IP:" << DEFAULT_IP <<endl;
	APIStrncpy(stLoginAuth.Password, DEFAULT_PASSWORD);
	stLoginAuth.ISModifyPassword = APIYNFLAG_NO;
	stLoginAuth.ISDDA = APIYNFLAG_NO;
	iErr = m_pAPI->Login(&stLoginAuth);
	if(TAPIERROR_SUCCEED != iErr) {
		cout << "Login Error:" << iErr <<endl;
		return;
	}


	//等待APIReady
	m_Event.WaitEvent();
	if (!m_bIsAPIReady){
		return;
	}

	//订阅行情
	TapAPIContract stContract;
	memset(&stContract, 0, sizeof(stContract));
	APIStrncpy(stContract.Commodity.ExchangeNo, DEFAULT_EXCHANGE_NO);
	stContract.Commodity.CommodityType = DEFAULT_COMMODITY_TYPE;
	APIStrncpy(stContract.Commodity.CommodityNo, DEFAULT_COMMODITY_NO);
	APIStrncpy(stContract.ContractNo1, DEFAULT_CONTRACT_NO);
	stContract.CallOrPutFlag1 = TAPI_CALLPUT_FLAG_NONE;
	stContract.CallOrPutFlag2 = TAPI_CALLPUT_FLAG_NONE;
	m_uiSessionID = 0;
	
	//订阅品种信息
	// iErr = m_pAPI->QryCommodity(&m_uiSessionID);
	// if(TAPIERROR_SUCCEED != iErr) {
		// cout << "QryCommodity Error:" << iErr <<endl;
		// return;
	// }
	
	//订阅合约信息
	// TapAPICommodity stCommodity;
	// memset(&stCommodity, 0, sizeof(stCommodity));
	// //APIStrncpy(stCommodity.ExchangeNo, DEFAULT_EXCHANGE_NO);
	// iErr = m_pAPI->QryContract(&m_uiSessionID,&stCommodity);
	// if(TAPIERROR_SUCCEED != iErr) {
		// cout << "QryContract Error:" << iErr <<endl;
		// return;
	// }

	//订阅行情信息
	iErr = m_pAPI->SubscribeQuote(&m_uiSessionID, &stContract);
	if(TAPIERROR_SUCCEED != iErr) {
		cout << "SubscribeQuote Error:" << iErr <<endl;
		return;
	}
	
	
	
	
    while(true) {
        m_Event.WaitEvent();
    }
}



void TAP_CDECL Quote::OnRspLogin(TAPIINT32 errorCode, const TapAPIQuotLoginRspInfo *info)
{
	if(TAPIERROR_SUCCEED == errorCode) {
		cout << "登录成功，等待API初始化..."<< errorCode << endl;
		m_bIsAPIReady = true;

	} else {
		cout << "登录失败，错误码:" << errorCode << endl;
		m_Event.SignalEvent();
	}
}

void TAP_CDECL Quote::OnAPIReady()
{
	cout << "API初始化完成" << endl;
	m_Event.SignalEvent();
}

void TAP_CDECL Quote::OnDisconnect(TAPIINT32 reasonCode)
{
	cout << "API断开,断开原因:"<<reasonCode << endl;
}

void TAP_CDECL Quote::OnRspChangePassword(TAPIUINT32 sessionID, TAPIINT32 errorCode)
{
	cout << __FUNCTION__ << " is called." << endl;
}

void TAP_CDECL Quote::OnRspQryExchange(TAPIUINT32 sessionID, TAPIINT32 errorCode, TAPIYNFLAG isLast, const TapAPIExchangeInfo *info)
{
	cout << __FUNCTION__ << " is called." << endl;
}

void TAP_CDECL Quote::OnRspQryCommodity(TAPIUINT32 sessionID, TAPIINT32 errorCode, TAPIYNFLAG isLast, const TapAPIQuoteCommodityInfo *info)
{
	cout << __FUNCTION__ << " is called." << endl;
	if (TAPIERROR_SUCCEED == errorCode)
	{
		cout << "品种信息订阅成功 ";
		if (NULL != info)
		{
			cout
				<< info->Commodity.ExchangeNo << " "
				<< info->Commodity.CommodityType << " "
				<< info->Commodity.CommodityNo << " "
				// ...
				<<endl;
		}

	} else{
		cout << "品种信息订阅失败，错误码：" << errorCode <<endl;
	}
}

void TAP_CDECL Quote::OnRspQryContract(TAPIUINT32 sessionID, TAPIINT32 errorCode, TAPIYNFLAG isLast, const TapAPIQuoteContractInfo *info)
{
	cout << __FUNCTION__ << " is called." << endl;
	if (TAPIERROR_SUCCEED == errorCode)
	{
		cout << "合约订阅成功 ";
		if (NULL != info)
		{
			cout
				<< info->Contract.ContractNo1 << " "
				<< info->Contract.ContractNo2 << " "
				<< info->Contract.StrikePrice1 << " "
				<< info->Contract.StrikePrice2 << " "
				// ...
				<<endl;
		}

	} else{
		cout << "合约订阅失败，错误码：" << errorCode <<endl;
	}
}

void TAP_CDECL Quote::OnRtnContract(const TapAPIQuoteContractInfo *info)
{
	cout << __FUNCTION__ << " is called." << endl;
}

void TAP_CDECL Quote::OnRspSubscribeQuote(TAPIUINT32 sessionID, TAPIINT32 errorCode, TAPIYNFLAG isLast, const TapAPIQuoteWhole *info)
{
	if (TAPIERROR_SUCCEED == errorCode)
	{
		cout << "行情订阅成功 ";
		if (NULL != info)
		{
			cout << info->DateTimeStamp
				<< "卖价0档" << info->QAskPrice[0]
				<< "买价0档" << info->QBidPrice[0]
				<< "卖价1档" << info->QAskPrice[1]
				<< "买价1档" << info->QBidPrice[1]
				<< "卖量0档" << info->QAskQty[0]
				<< "买量0档" << info->QBidQty[0]
				<< "卖量1档" << info->QAskQty[1]
				<< "买量1档" << info->QBidQty[1]
				
				<< "隐含卖价" << info->QImpliedAskPrice
				<< "隐含买价" << info->QImpliedBidPrice
				<< "隐含卖量" << info->QImpliedAskQty
				<< "隐含买量" << info->QImpliedBidQty
				
				<< "涨幅" << info->QChangeRate << " "
				<< "涨速" << info->QChangeSpeed << " "
				<< "涨跌值" << info->QChangeValue << " "
				<< "最高价" << info->QClosingPrice << " "
				<< "内盘量" << info->QInsideQty << " "
				<< "最新价" << info->QLastPrice << " "
				<< "最新成交量" << info->QLastQty << " "
				<< "委卖总量" << info->QTotalAskQty << " "
				<< "委买总量" << info->QTotalBidQty << " "
				<< "当日总成交量" << info->QTotalQty << " "
				<< "交易状态" << info->TradingState << " "
				<< "最低价" << info->QLowPrice<< " "
				<< "持仓量" << info->QPositionQty<< " "
				<< "结算价" << info->QSettlePrice<< " "
				<< "昨结算价" << info->QPreSettlePrice<< " "
				// << info->UnderlyContract << " "
				<< " "<< info->QPositionQty
				//...
				<<endl;
		}

	} else{
		cout << "行情订阅失败，错误码：" << errorCode <<endl;
	}
}

void TAP_CDECL Quote::OnRspUnSubscribeQuote(TAPIUINT32 sessionID, TAPIINT32 errorCode, TAPIYNFLAG isLast, const TapAPIContract *info)
{
	cout << __FUNCTION__ << " is called." << endl;
}

void TAP_CDECL Quote::OnRtnQuote(const TapAPIQuoteWhole *info)
{
	if (NULL != info)
	{
		cout << "行情更新:"
			<< info->DateTimeStamp << " "
			<< info->Contract.Commodity.ExchangeNo << " "
			<< info->Contract.Commodity.CommodityType << " "
			<< info->Contract.Commodity.CommodityNo << " "
			<< info->Contract.ContractNo1 << " "
			<< info->QLastPrice
			<< "最新成交量" << info->QLastQty << " "
			<< "当日总成交量" << info->QTotalQty << " "
			<< "持仓量" << info->QPositionQty<< " "
			// ...
			<< "卖价0档" << info->QAskPrice[0]
			<< "买价0档" << info->QBidPrice[0]
			<< "卖量0档" << info->QAskQty[0]
			<< "买量0档" << info->QBidQty[0]
			<<endl;
	}
}
