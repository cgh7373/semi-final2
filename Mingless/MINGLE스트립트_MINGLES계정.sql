DROP TABLE POST CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_POST;
DROP TABLE ITEM CASCADE CONSTRAINTS; 
DROP SEQUENCE SEQ_ICA;
DROP TABLE ITEMCATEGORY CASCADE CONSTRAINTS; 
DROP SEQUENCE SEQ_ITEM ;
DROP TABLE ATTACHMENT CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_ATT;

/*
-- 첨부파일
-- ATTACHMENT 테이블
CREATE TABLE ATTACHMENT(
    FILE_NO NUMBER CONSTRAINT ATTACHMENT_PK PRIMARY KEY,
    ORIGIN_NAME VARCHAR2(255) CONSTRAINT ATTACHMENT_ORIGIN_NAME_NN NOT NULL,
    CHANGE_NAME VARCHAR2(255) CONSTRAINT ATTACHMENT_CHANGE_NAME_NN NOT NULL,
    FILE_PATH VARCHAR2(1000) CONSTRAINT ATTACHMENT_FILE_PATH_NN NOT NULL,
    UPLOAD_DATE DATE DEFAULT SYSDATE CONSTRAINT ATTACHMENT_UPLOAD_DATE_NN NOT NULL,
    FILE_POSITION NUMBER CONSTRAINT ATTACHMENT_FILE_POSITION_NN NOT NULL,
    FILE_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT ATTACHMENT_FILE_STATUS_NN NOT NULL
);

COMMENT ON COLUMN ATTACHMENT.FILE_NO IS '첨부파일고유번호';
COMMENT ON COLUMN ATTACHMENT.ORIGIN_NAME IS '파일원본명';
COMMENT ON COLUMN ATTACHMENT.CHANGE_NAME IS '파일수정명';
COMMENT ON COLUMN ATTACHMENT.FILE_PATH IS '저장폴더경로';
COMMENT ON COLUMN ATTACHMENT.UPLOAD_DATE IS '업로드일';
COMMENT ON COLUMN ATTACHMENT.FILE_POSITION IS '게시글 1''/채팅 2''/아이템 3''/음악 4''/미니홈피 5';
COMMENT ON COLUMN ATTACHMENT.FILE_STATUS IS '파일있음''Y'' | 파일없음''N''';

-- ATTACHMENT 시퀀스
CREATE SEQUENCE SEQ_ATT
START WITH 1
NOCACHE;
*/

-- /resources/item_upfiles/ 기본 사진들
INSERT INTO ATTACHMENT (FILE_NO, ORIGIN_NAME, CHANGE_NAME, FILE_PATH, UPLOAD_DATE, FILE_POSITION, FILE_STATUS)
VALUES (SEQ_ATT.NEXTVAL, 'storeItem.png', 'storeItem.png', '/resources/item_upfiles/', SYSDATE, 3, 'Y');

INSERT INTO ATTACHMENT (FILE_NO, ORIGIN_NAME, CHANGE_NAME, FILE_PATH, UPLOAD_DATE, FILE_POSITION, FILE_STATUS)
VALUES (SEQ_ATT.NEXTVAL, '게시글사진.webp', '게시글사진.webp', '/resources/item_upfiles/', SYSDATE, 1, 'Y');

commit;

 -- ITEMCATEGORY 테이블
CREATE TABLE ITEMCATEGORY(
ITEM_CATEGORY VARCHAR2(30) CONSTRAINT ITEMCATEGORY_PK PRIMARY KEY,
CATEGORYNAME VARCHAR2(40) CONSTRAINT ITEMCATEGORY_NAME_NN NOT NULL
);
-- SEQ_ICA 시퀀스
CREATE SEQUENCE SEQ_ICA
START WITH 1
NOCACHE;
 
 
-- ITEM 테이블
CREATE TABLE ITEM(
ITEM_NUM NUMBER CONSTRAINT ITEM_PK PRIMARY KEY,
ITEM_CATEGORY VARCHAR2(30) CONSTRAINT ITEM_ITEM_CATEGORY_FK REFERENCES ITEMCATEGORY(ITEM_CATEGORY),
ITEM_NAME VARCHAR2(50) CONSTRAINT ITEM_NAME_NN NOT NULL,
PRICE NUMBER CONSTRAINT ITEM_PRICE_NN NOT NULL,
ITEM_INTRO VARCHAR2(4000) CONSTRAINT ITEM_INTRO_NN NOT NULL,
ITEM_DATE DATE DEFAULT SYSDATE CONSTRAINT ITEM_DATE_NN NOT NULL,
ITEM_UPDATE DATE DEFAULT SYSDATE CONSTRAINT ITEM_UPDATE_NN NOT NULL,
ITEM_STATUS CHAR(1) CONSTRAINT ITEM_STATUS_NN NOT NULL,
ATTACHMENT_NO NUMBER CONSTRAINT ITEM_ATTACHMENT_FK REFERENCES ATTACHMENT(FILE_NO)
);
-- SEQ_ITEM 시퀀스
CREATE SEQUENCE SEQ_ITEM
START WITH 1
NOCACHE;

--ITEMCATEGORY 테이블 샘플 데이터
INSERT INTO ITEMCATEGORY (ITEM_CATEGORY, CATEGORYNAME)
VALUES ('IC1', '홈피꾸미기');

INSERT INTO ITEMCATEGORY (ITEM_CATEGORY, CATEGORYNAME)
VALUES ('IC2', '내방꾸미기');

INSERT INTO ITEMCATEGORY (ITEM_CATEGORY, CATEGORYNAME)
VALUES ('IC3', '아바타꾸미기');

INSERT INTO ITEMCATEGORY (ITEM_CATEGORY, CATEGORYNAME)
VALUES ('IC4', '아이템광장');

INSERT INTO ITEMCATEGORY (ITEM_CATEGORY, CATEGORYNAME)
VALUES ('IC13', '삭제아이템');

commit;
--ITEM 테이블 샘플 데이터
INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS, ATTACHMENT_NO)
VALUES (SEQ_ITEM.NEXTVAL, 'IC1', 'Item 1', 100, 'Introduction to Item 1', SYSDATE, SYSDATE, 'Y' ,1);
 
-- CHAT 테이블

DROP TABLE CHAT CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_CHAT;

CREATE TABLE CHAT (
    CHAT_ID NUMBER NOT NULL,
    FROM_MEMNO NUMBER,
    TO_MEMNO NUMBER,
    CHAT_CONTENT VARCHAR2(4000) NOT NULL,
    CHAT_TIME DATE DEFAULT SYSDATE,
    FOREIGN KEY (FROM_MEMNO) REFERENCES MEMBER(MEM_NO),
    FOREIGN KEY (TO_MEMNO) REFERENCES MEMBER(MEM_NO)
);

COMMENT ON COLUMN CHAT.CHAT_ID IS '채팅창번호';
COMMENT ON COLUMN CHAT.FROM_MEMNO IS '채팅보낸사람';
COMMENT ON COLUMN CHAT.TO_MEMNO IS '채팅받는사람';
COMMENT ON COLUMN CHAT.CHAT_CONTENT IS '채팅내용';
COMMENT ON COLUMN CHAT.CHAT_TIME IS '채팅보낸시간';

-- POST TABLE
ALTER TABLE POST ADD POST_ATTACHMENT_NO NUMBER CONSTRAINT FK_ATTACHMENT REFERENCES ATTACHMENT(FILE_NO);


COMMENT ON COLUMN POST.POST_ATTACHMENT_NO IS '게시글첨부파일번호';

-- POST BLACKLIST TABLE 
DROP TABLE POST_BLACKLIST;
DROP SEQUENCE SEQ_POSTBLACKLIST;

CREATE TABLE POST_BLACKLIST (
    POST_BLACKLIST_NO NUMBER NOT NULL, 
    POST_NUM NUMBER NOT NULL, 
    REPORTMEM_NO NUMBER NOT NULL, 
    BLOCK_TYPE VARCHAR2(1000) NOT NULL, 
    BLOCK_DATE DATE DEFAULT SYSDATE NOT NULL ,
    BLOCK_COUNT NUMBER DEFAULT 0 NOT NULL , 
    EXPIRY_DATE DATE NOT NULL, 

    CONSTRAINT PK_POST_BLACKLIST PRIMARY KEY (POST_BLACKLIST_NO),
    CONSTRAINT FK_POST_BLACKLIST FOREIGN KEY (POST_NUM) REFERENCES POST (POST_NUM), 
    CONSTRAINT FK_POST_BLACKLIST_REPORTMEM FOREIGN KEY (REPORTMEM_NO)REFERENCES MEMBER (MEM_NO)
);

CREATE SEQUENCE SEQ_BLACKLIST_POST
START WITH 1
NOCACHE;


 -- POST_TYPE테이블
CREATE TABLE POST_TYPE(
POST_TYPE NUMBER CONSTRAINT POST_TYPE_PK PRIMARY KEY,
POST_TYPE_NAME VARCHAR2(40) CONSTRAINT POST_TYPE_NAME_NN NOT NULL
);
-- SEQ_ICA 시퀀스
CREATE SEQUENCE SEQ_PT
START WITH 1
NOCACHE;

INSERT INTO POST_TYPE VALUES(SEQ_PT.NEXTVAL , '사용자 게시글');
INSERT INTO POST_TYPE VALUES(SEQ_PT.NEXTVAL , '공지사항');

commit;
