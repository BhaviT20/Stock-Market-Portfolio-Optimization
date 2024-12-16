use data;
create table stock1 (
Date date null,
Ticker varchar(20) null,
Open decimal(10,2) null,
High decimal(10,2) null,
Low decimal(10,2) null,
Close decimal(10,2) null,
Volume int(10) null,
Adjusted_close decimal(10,2) null,
Dividend_Amount decimal(10,2) null,
Stock_Split decimal(10,2) null,
Moving_Average_10_days decimal(10,2) null,
RSI_14_days decimal(10,2) null,
MACD decimal(10,2) null,
Bollinger_Bands_Upper decimal(10,2) null,
Bollinger_Bands_Lower decimal(10,2) null,
52_Week_High decimal(10,2) null,
52_Week_Low decimal(10,2) null,
Beta decimal(10,2) null,
Market_Cap decimal(20,2) null,
PE_Ratio decimal(10,2) null
);
select * from stock1;

load data local infile "C:/Users/Kusuma/Downloads/stockdata.csv" into table stock1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
show global variables like 'local_infile';
set global local_infile=1;
select * from stock1;

----- Q1 Average Daily Trading Volume------
select ticker,avg(volume) from stock1 group by ticker;
select date,volume from stock1;
select Date, volume from stock1 order by date asc;


----- Q2 Most Volatile Stocks------
select distinct ticker,avg(beta) from stock1 group by ticker;


----- Q3 Stocks with Highest Dividend and Lowest Dividend------
select ticker,sum(dividend_amount) from stock1 group by ticker;


----- Q4 Highest and Lowest P/E Ratios-------
select ticker,max(pe_ratio),min(pe_ratio) from stock1 group by ticker;



----- Q5 Stocks with Highest Market Cap------
select ticker,avg(market_cap) from stock1 group by ticker;


----- Q6 Stocks with Strong Buy Signals and stocks with Strong Selling Signal---------
select date,ticker,macd as macd,rsi_14_days as rsi,case when macd>0 and rsi_14_days<30 then 'buy' when macd<0 and rsi_14_days>=80 
then'sell' else'neutral'end as buy_sell from stock1 order by date;




