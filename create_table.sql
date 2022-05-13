DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE PRODUCT_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE STORY CASCADE CONSTRAINTS;
DROP TABLE STORY_RECOMMENT CASCADE CONSTRAINTS;
DROP TABLE CART CASCADE CONSTRAINTS;
DROP TABLE ORDERS CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP TABLE OPTION_PARENT CASCADE CONSTRAINTS;
DROP TABLE ORDER_DETAIL CASCADE CONSTRAINTS;
DROP TABLE PRODUCT_DETAIL CASCADE CONSTRAINTS;
DROP TABLE PRODUCT_IMG CASCADE CONSTRAINTS;

CREATE TABLE Member (
	M_ID	VARCHAR2(20)		NOT NULL,
	M_PW	VARCHAR2(20)		NOT NULL,
	M_NAME	VARCHAR2(20)		NOT NULL,
	M_NICKNAME	VARCHAR2(20)		NOT NULL,
    M_BIRTH CHAR(6) NOT NULL,
    M_INTRO VARCHAR2(30) NULL,
    M_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL,
	M_PHONE	VARCHAR2(20)		NOT NULL,
	M_GRADE	NUMBER		DEFAULT '1' NOT NULL,
	M_NY	VARCHAR2(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN Member.M_GRADE IS '사용자등급';
COMMENT ON COLUMN Member.M_ID IS '아이디';
COMMENT ON COLUMN Member.M_NY IS '탈퇴여부';
COMMENT ON COLUMN member.m_grade is '사용자등급';

CREATE TABLE Product_Category (
	CATEGORY_ID	NUMBER		NOT NULL,
	CATEGORY_NAME	VARCHAR2(10)		NOT NULL
);

CREATE TABLE STORY (
	B_NO	NUMBER		NOT NULL,
	B_TITLE	VARCHAR2(100)		NOT NULL,
	B_CONTENT	VARCHAR2(4000)		NOT NULL,
    B_WRITER    VARCHAR2(20)    NOT NULL,
	M_ID	VARCHAR2(20)		NOT NULL,
	B_CNT	NUMBER	DEFAULT 0	NOT NULL ,
	B_DATE	TIMESTAMP	DEFAULT SYSDATE	NOT NULL,
    P_NO    NUMBER              NOT NULL,
	B_NY	VARCHAR(1)	DEFAULT 'Y'	NOT NULL,
    B_IMG_PATH  VARCHAR2(300)   NOT NULL
);

CREATE TABLE STORY_RECOMMENT (
	R_NO	NUMBER		NOT NULL,
	B_NO	NUMBER		NOT NULL,
    R_WRITER    VARCHAR2(20)    NOT NULL,
	M_ID	VARCHAR2(20)		NOT NULL,
	R_CONTENT	VARCHAR2(100)		NOT NULL,
	R_DATE	TIMESTAMP	DEFAULT SYSDATE	NOT NULL
);

CREATE TABLE Cart (
	C_NO	NUMBER		NOT NULL,
	M_ID	VARCHAR2(20)		NOT NULL,
    P_NO    NUMBER              NOT NULL,
    P_SEQ   VARCHAR2(10)     NOT NULL,
    C_CNT   NUMBER      NOT NULL,
    C_NY    VARCHAR2(1) DEFAULT 'N' NOT NULL
);


CREATE TABLE Orders (
	O_NO	NUMBER		NOT NULL,
	M_ID	VARCHAR2(20)		NOT NULL,
	O_DATE	TIMESTAMP	DEFAULT SYSDATE	NOT NULL,
	O_NAME	VARCHAR2(20)		NOT NULL,
	O_EMAIL	VARCHAR2(50)		NOT NULL,
	O_PHONE	VARCHAR2(20)		NOT NULL,
	O_RECEIVER	VARCHAR2(20)		NOT NULL,
	O_RECEIVER_ADDRESS	VARCHAR2(300)		NOT NULL,
	O_RECEIVER_PHONE	VARCHAR2(20)		NOT NULL,
    O_TOTAL_PRICE       NUMBER              NOT NULL
);


CREATE TABLE Product (
	P_NO	NUMBER		NOT NULL,
    P_BRAND VARCHAR2(20)    NOT NULL,
	P_NAME	VARCHAR2(500)		NOT NULL,
	P_CONTENT	VARCHAR2(4000)		NOT NULL,
	P_PRICE	NUMBER		NOT NULL,
	CATEGORY_ID	NUMBER		NOT NULL
);


CREATE TABLE Option_Parent (
	OPT_NO	NUMBER		NOT NULL,
	OPT_NAME	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN Option_Parent.OPT_NO IS '1, 2';

COMMENT ON COLUMN Option_Parent.OPT_NAME IS '색상, 사이즈';


CREATE TABLE Order_Detail (
    O_D_SEQ NUMBER      NOT NULL,
	O_NO	NUMBER		NOT NULL,
    P_NO    NUMBER      NOT NULL,
    P_SEQ	VARCHAR2(10)		NOT NULL,
    O_DETAIL_CNT	NUMBER		NOT NULL
);

CREATE TABLE Product_Detail (
	P_SEQ	VARCHAR2(10)		NOT NULL,
	P_NO	NUMBER		NOT NULL,
	OPT_NO	NUMBER		NOT NULL,
	OPT_VAL	VARCHAR2(500) DEFAULT '0' NOT NULL,
	OPT_PRICE	NUMBER	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN Product_Detail.OPT_NO IS '1, 2';

CREATE TABLE Product_Img (
	PRODUCT_IMG_NO	NUMBER		NOT NULL,
	P_NO	NUMBER		NOT NULL,
	PRODUCT_IMG_NAME	VARCHAR2(3000)		NOT NULL,
	PRODUCT_IMG_SIZE	NUMBER		NOT NULL
);

ALTER TABLE MEMBER ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	M_ID
);

ALTER TABLE Product_Category ADD CONSTRAINT PK_PRODUCT_CATEGORY PRIMARY KEY (
	CATEGORY_ID
);


ALTER TABLE STORY ADD CONSTRAINT PK_STORY PRIMARY KEY (
	B_NO
);


ALTER TABLE STORY_Recomment ADD CONSTRAINT PK_STORY_RECOMMENT PRIMARY KEY (
	R_NO,
	B_NO
);

ALTER TABLE Cart ADD CONSTRAINT PK_CART PRIMARY KEY (
	C_NO
);


ALTER TABLE Orders ADD CONSTRAINT PK_ORDER PRIMARY KEY (
	O_NO
);

ALTER TABLE Product ADD CONSTRAINT PK_PRODUCT PRIMARY KEY (
	P_NO
);

ALTER TABLE Option_Parent ADD CONSTRAINT PK_OPTION_PARENT PRIMARY KEY (
	OPT_NO
);

ALTER TABLE Order_Detail ADD CONSTRAINT PK_ORDER_DETAIL PRIMARY KEY (
	O_D_SEQ
);

ALTER TABLE Product_Detail ADD CONSTRAINT PK_PRODUCT_DETAIL PRIMARY KEY (
	P_SEQ
);

ALTER TABLE Product_Img ADD CONSTRAINT PK_PRODUCT_IMG PRIMARY KEY (
	PRODUCT_IMG_NO
);


ALTER TABLE STORY ADD CONSTRAINT FK_Member_TO_STORY_1 FOREIGN KEY (
	M_ID
)
REFERENCES Member (
	M_ID
);

ALTER TABLE STORY ADD CONSTRAINT FK_PRODUCT_TO_STORY_1 FOREIGN KEY (
	P_NO
)
REFERENCES PRODUCT (
	P_NO
);


ALTER TABLE STORY_RECOMMENT ADD CONSTRAINT FK_STORY_TO_STORY_Recomment_1 FOREIGN KEY (
	B_NO
)
REFERENCES STORY (
	B_NO
) on delete cascade
;


ALTER TABLE STORY_RECOMMENT ADD CONSTRAINT FK_Member_STORY_RECOMMENT FOREIGN KEY (
	M_ID
)
REFERENCES Member (
	M_ID
);

ALTER TABLE Cart ADD CONSTRAINT FK_Member_TO_Cart_1 FOREIGN KEY (
	M_ID
)
REFERENCES Member (
	M_ID
);

ALTER TABLE Cart ADD CONSTRAINT FK_Product_TO_Cart_1 FOREIGN KEY (
	P_NO
)
REFERENCES Product (
	P_NO
);

ALTER TABLE Orders ADD CONSTRAINT FK_Member_TO_Order_1 FOREIGN KEY (
	M_ID
)
REFERENCES Member (
	M_ID
);

ALTER TABLE Product ADD CONSTRAINT FK_Prod_Cate_TO_Prod_1 FOREIGN KEY (
	CATEGORY_ID
)
REFERENCES Product_Category (
	CATEGORY_ID
);

ALTER TABLE Order_Detail ADD CONSTRAINT FK_Order_TO_Order_Detail_1 FOREIGN KEY (
	O_NO
)
REFERENCES Orders (
	O_NO
);

ALTER TABLE Order_Detail ADD CONSTRAINT FK_Product_TO_Ord_Detail_1 FOREIGN KEY (
	P_NO
)
REFERENCES Product (
	P_NO
);


ALTER TABLE Product_Detail ADD CONSTRAINT FK_Product_TO_Product_Detail_1 FOREIGN KEY (
	P_NO
)
REFERENCES Product ( 
P_NO 
) on delete cascade
;

ALTER TABLE Product_Detail ADD CONSTRAINT FK_Opt_Parent_TO_Prod_Det FOREIGN KEY (
	OPT_NO
)
REFERENCES Option_Parent (
	OPT_NO
);

ALTER TABLE Product_Img ADD CONSTRAINT FK_Product_TO_Product_Img_1 FOREIGN KEY (
	P_NO
)
REFERENCES Product (
	P_NO
);
--시퀀스
DROP SEQUENCE SEQUENCE_CART_C_NO;
DROP SEQUENCE SEQUENCE_ORDERS_O_NO;
DROP SEQUENCE SEQUENCE_ORDER_DETAIL_O_D_SEQ;
DROP SEQUENCE SEQUENCE_PROD_DETAIL_P_SEQ;
DROP SEQUENCE SEQUENCE_PRODUCT_P_NO;
DROP SEQUENCE SEQUENCE_PRODUCT_IMG_NO;
DROP SEQUENCE SEQUENCE_STORY_B_NO;
DROP SEQUENCE SEQUENCE_STORY_R_NO;


CREATE SEQUENCE SEQUENCE_STORY_B_NO
START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE;

CREATE SEQUENCE SEQUENCE_STORY_R_NO
START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE;

CREATE SEQUENCE SEQUENCE_CART_C_NO
START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE;

CREATE SEQUENCE SEQUENCE_PROD_DETAIL_P_SEQ
START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE;

CREATE SEQUENCE SEQUENCE_ORDERS_O_NO
START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE;

CREATE SEQUENCE SEQUENCE_ORDER_DETAIL_O_D_SEQ
START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE;

CREATE SEQUENCE SEQUENCE_PRODUCT_P_NO
START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE;

CREATE SEQUENCE SEQUENCE_PRODUCT_IMG_NO
START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE;

commit;