CREATE EXTERNAL TABLE ext_ssb.dates (
  d_datekey int,
  d_date text,
  d_dayofweek text,
  d_month text,
  d_year int,
  d_yearmonthnum int,
  d_yearmonth text,
  d_daynuminweek int,
  d_daynuminmonth int,
  d_daynuminyear int,
  d_monthnuminyear int,
  d_weeknuminyear int,
  d_sellingseason text,
  d_lastdayinweekfl int,
  d_lastdayinmonthfl int,
  d_holidayfl int,
  d_weekdayfl int,
  dummy text
)
LOCATION (:LOCATION)
FORMAT 'CSV' (DELIMITER ',');
