ATTACH 'sf10.duckdb' as sf10db;

SET max_temp_directory_size = '100GB';
SET preserve_insertion_order = false;

CREATE TABLE customer (
    C_CUSTKEY    BIGINT,
    C_NAME       VARCHAR,
    C_ADDRESS    VARCHAR,
    C_CITY       VARCHAR,
    C_NATION     VARCHAR,
    C_REGION     VARCHAR,
    C_PHONE      VARCHAR,
    C_MKTSEGMENT VARCHAR,
    PRIMARY KEY (C_CUSTKEY)
);

CREATE TABLE supplier (
    S_SUPPKEY BIGINT,
    S_NAME    VARCHAR,
    S_ADDRESS VARCHAR,
    S_CITY    VARCHAR,
    S_NATION  VARCHAR,
    S_REGION  VARCHAR,
    S_PHONE   VARCHAR,
    PRIMARY KEY (S_SUPPKEY)
);

CREATE TABLE part (
    P_PARTKEY   BIGINT,
    P_NAME      VARCHAR,
    P_MFGR      VARCHAR,
    P_CATEGORY  VARCHAR,
    P_BRAND1    VARCHAR,
    P_COLOR     VARCHAR,
    P_TYPE      VARCHAR,
    P_SIZE      TINYINT,
    P_CONTAINER VARCHAR,
    PRIMARY KEY(P_PARTKEY)
);

CREATE TABLE date (
    D_DATEKEY          DATE,
    D_DATE	       VARCHAR,
    D_DAYOFWEEK        VARCHAR,
    D_MONTH            VARCHAR,
    D_YEAR             SMALLINT,
    D_YEARMONTHNUM     INTEGER,
    D_YEARMONTH        VARCHAR,
    D_DAYNUMINWEEK     TINYINT,
    D_DAYNUMINMONTH    TINYINT,
    D_DAYNUMINYEAR     SMALLINT,
    D_MONTHNUMINYEAR   TINYINT,
    D_WEEKNUMINYEAR    TINYINT,
    D_SELLINGSEASON    VARCHAR,
    D_LASTDAYINWEEKFL  BIT, 
    D_LASTDAYINMONTHFL BIT,
    D_HOLIDAYFL	       BIT,
    D_WEEKDAYFL	       BIT,
    PRIMARY KEY (D_DATEKEY)
);

CREATE TABLE lineorder (
    LO_ORDERKEY        BIGINT,
    LO_LINENUMBER      TINYINT,
    LO_CUSTKEY         BIGINT,
    LO_PARTKEY         BIGINT,
    LO_SUPPKEY         BIGINT,
    LO_ORDERDATE       DATE, 
    LO_ORDERPRIORITY   VARCHAR,
    LO_SHIPPPRIORITY   VARCHAR,
    LO_QUANTITY        TINYINT,
    LO_EXTENDEDPRICE   INTEGER,
    LO_ORDTOTALPRICE   INTEGER,
    LO_DISCOUNT	       TINYINT,
    LO_REVENUE         INTEGER,
    LO_SUPPLYCOST      INTEGER,
    LO_TAX             TINYINT,
    LO_COMMITDATE      DATE,
    LO_SHIPMODE        VARCHAR,
    PRIMARY KEY (LO_ORDERKEY, LO_LINENUMBER),
    FOREIGN KEY (LO_CUSTKEY)    REFERENCES customer(C_CUSTKEY),
    FOREIGN KEY (LO_PARTKEY)    REFERENCES part(P_PARTKEY),
    FOREIGN KEY (LO_SUPPKEY)    REFERENCES supplier(S_SUPPKEY),
    FOREIGN KEY (LO_ORDERDATE)  REFERENCES date(D_DATEKEY),
    FOREIGN KEY (LO_COMMITDATE) REFERENCES date(D_DATEKEY)
);

COPY customer FROM "~/ads_project2/ads_proj2/duckdb/benchmark/ssb/data/sf10/customer.tbl";
COPY supplier FROM "~/ads_project2/ads_proj2/duckdb/benchmark/ssb/data/sf10/supplier.tbl";
COPY part FROM "~/ads_project2/ads_proj2/duckdb/benchmark/ssb/data/sf10/part.tbl";
COPY date FROM "~/ads_project2/ads_proj2/duckdb/benchmark/ssb/data/sf10/date.tbl";
COPY lineorder FROM "~/ads_project2/ads_proj2/duckdb/benchmark/ssb/data/sf10/lineorder.tbl";
