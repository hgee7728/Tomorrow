--MEMBER
INSERT INTO MEMBER VALUES ('admin001', 'admin001', '관리자', '관리자', '000000', null, sysdate, '010-0000-0000', '0', default);
INSERT INTO MEMBER VALUES ('test001', 'test123', '김민준', '민준123', '970714', 'test001 한 줄 소개', sysdate, '010-4528-4792', '1', default);
INSERT INTO MEMBER VALUES ('test002', 'test123', '이서연', '서연123', '941109', 'test002 한 줄 소개', sysdate, '010-6298-1087', '1', default);
INSERT INTO MEMBER VALUES ('test003', 'test123', '박도윤', '도윤123', '000726', 'test003 한 줄 소개', sysdate, '010-728-2153', '1', default);
INSERT INTO MEMBER VALUES ('test004', 'test123', '정지우', '지우123', '020103', 'test004 한 줄 소개', sysdate, '010-1853-7767', '1', default);
INSERT INTO MEMBER VALUES ('test005', 'test123', '최민서', '민서123', '921018', 'test005 한 줄 소개', sysdate, '011-8103-3924', '1', default);

--CART
INSERT INTO CART VALUES (SEQUENCE_CART_C_NO.nextval, 'test001', 1, '3, 6', 1 , default);
INSERT INTO CART VALUES (SEQUENCE_CART_C_NO.nextval, 'test001', 2, '8, 10', 3,  default);
INSERT INTO CART VALUES (SEQUENCE_CART_C_NO.nextval, 'test001', 3, '15, 20', 2, default);
INSERT INTO CART VALUES (SEQUENCE_CART_C_NO.nextval, 'test001', 4, '22, 25', 5, default);

INSERT INTO CART VALUES (SEQUENCE_CART_C_NO.nextval, 'test003', 1, '3, 6', 1, 'Y');
INSERT INTO CART VALUES (SEQUENCE_CART_C_NO.nextval, 'test003', 2, '8, 10', 3, 'Y');
INSERT INTO CART VALUES (SEQUENCE_CART_C_NO.nextval, 'test003', 3, '15, 20', 2, 'Y');
INSERT INTO CART VALUES (SEQUENCE_CART_C_NO.nextval, 'test003', 4, '22, 25', 5, 'Y');

--ORDERS
INSERT INTO ORDERS VALUES(SEQUENCE_ORDERS_O_NO.nextval, 'test002', sysdate, '이서연', 'test001@naver.com', '010-6298-1087', '이서연', '경기도 군포시 오금동 871-1 삼익소월아파트 373-1803', '010-6298-1087', 92900+30000 +39800+50000);
INSERT INTO ORDERS VALUES(SEQUENCE_ORDERS_O_NO.nextval, 'test004', sysdate, '정지우', 'test004@gmail.com', '010-1853-7767', '신하준', '전주시 덕진구 송천동 신일ⓐ 104/1507', '010-8049-1783', 92900+30000 +39800+50000 +1739000+400000);
INSERT INTO ORDERS VALUES(SEQUENCE_ORDERS_O_NO.nextval, 'test005', sysdate, '최민서', 'test005@yahoo.com', '011-8103-3924', '최민서', '고양시 일산구 백석동 1316번지 현대밀라트1차 B동515호', '011-8103-3924', 39800+50000 +1739000+400000 +19900);
INSERT INTO ORDERS VALUES(SEQUENCE_ORDERS_O_NO.nextval, 'test001', sysdate, '김민준', 'test001@nate.com', '010-4528-4792', '주채원', '서울시 송파구 방이동212-8 코오롱아파트105-405', '010-3319-7841', 19900);

--ORDER_DETAIL
INSERT INTO ORDER_DETAIL VALUES(SEQUENCE_ORDER_DETAIL_O_D_SEQ.nextval, 1, 1, '3, 6', 1);
INSERT INTO ORDER_DETAIL VALUES(SEQUENCE_ORDER_DETAIL_O_D_SEQ.nextval, 1, 2, '8, 10', 3);

INSERT INTO ORDER_DETAIL VALUES(SEQUENCE_ORDER_DETAIL_O_D_SEQ.nextval, 2, 1, '3, 6', 1);
INSERT INTO ORDER_DETAIL VALUES(SEQUENCE_ORDER_DETAIL_O_D_SEQ.nextval, 2, 2, '8, 10', 3);
INSERT INTO ORDER_DETAIL VALUES(SEQUENCE_ORDER_DETAIL_O_D_SEQ.nextval, 2, 3, '15, 20', 2);

INSERT INTO ORDER_DETAIL VALUES(SEQUENCE_ORDER_DETAIL_O_D_SEQ.nextval, 3, 2, '8, 10', 3);
INSERT INTO ORDER_DETAIL VALUES(SEQUENCE_ORDER_DETAIL_O_D_SEQ.nextval, 3, 3, '15, 20', 2);
INSERT INTO ORDER_DETAIL VALUES(SEQUENCE_ORDER_DETAIL_O_D_SEQ.nextval, 3, 4, '22, 25', 5);

INSERT INTO ORDER_DETAIL VALUES(SEQUENCE_ORDER_DETAIL_O_D_SEQ.nextval, 4, 4, '22, 25', 5);

commit;
--SELECT CART
SELECT * FROM CART WHERE C_NY = 'N' AND M_ID = 'test001';