-- INSERT MEMBER
INSERT INTO MEMBER (
    MEM_NO,
    MEM_ID,
    MEM_PWD,
    NICKNAME,
    BIRTHDATE,
    PHONE,
    EMAIL,
    GENDER,
    ENROLL_DATE,
    MODIFY_DATE,
    STATUS,
    EGG,
    ZODIAC,
    ABO,
    MBTI
) VALUES (
    1001, -- 회원번호
    'blacklistedUser', -- 아이디
    'password123', -- 비밀번호
    'BlackUser', -- 닉네임
    TO_DATE('1990-01-01', 'YYYY-MM-DD'), -- 생년월일
    '01012345678', -- 휴대폰번호
    'blackuser@example.com', -- 이메일
    'M', -- 성별
    SYSDATE, -- 가입일자
    SYSDATE, -- 정보수정일자
    'B', -- 블랙리스트 상태
    0, -- 보유거북알
    'Aries', -- 별자리 (예: 양자리)
    'O', -- 혈액형
    'INTJ' -- MBTI
);

INSERT INTO MEMBER (
    MEM_NO,
    MEM_ID,
    MEM_PWD,
    NICKNAME,
    BIRTHDATE,
    PHONE,
    EMAIL,
    GENDER,
    ENROLL_DATE,
    MODIFY_DATE,
    STATUS,
    EGG,
    ZODIAC,
    ABO,
    MBTI
) VALUES (
    1002, -- 회원번호
    'userOne', -- 아이디
    'pass456', -- 비밀번호
    'UserOne', -- 닉네임
    TO_DATE('1985-05-15', 'YYYY-MM-DD'), -- 생년월일
    '01023456789', -- 휴대폰번호
    'userone@example.com', -- 이메일
    'F', -- 성별
    SYSDATE, -- 가입일자
    SYSDATE, -- 정보수정일자
    'A', -- 일반 상태
    10, -- 보유거북알
    'Taurus', -- 별자리
    'A', -- 혈액형
    'ENFP' -- MBTI
);

INSERT INTO MEMBER (
    MEM_NO,
    MEM_ID,
    MEM_PWD,
    NICKNAME,
    BIRTHDATE,
    PHONE,
    EMAIL,
    GENDER,
    ENROLL_DATE,
    MODIFY_DATE,
    STATUS,
    EGG,
    ZODIAC,
    ABO,
    MBTI
) VALUES (
    1003, -- 회원번호
    'userTwo', -- 아이디
    'password789', -- 비밀번호
    'UserTwo', -- 닉네임
    TO_DATE('1992-08-25', 'YYYY-MM-DD'), -- 생년월일
    '01034567890', -- 휴대폰번호
    'usertwo@example.com', -- 이메일
    'M', -- 성별
    SYSDATE, -- 가입일자
    SYSDATE, -- 정보수정일자
    'C', -- 비활성 상태
    5, -- 보유거북알
    'Leo', -- 별자리
    'B', -- 혈액형
    'ISFP' -- MBTI
);

INSERT INTO MEMBER (
    MEM_NO,
    MEM_ID,
    MEM_PWD,
    NICKNAME,
    BIRTHDATE,
    PHONE,
    EMAIL,
    GENDER,
    ENROLL_DATE,
    MODIFY_DATE,
    STATUS,
    EGG,
    ZODIAC,
    ABO,
    MBTI
) VALUES (
    1004, -- 회원번호
    'userThree', -- 아이디
    'securePass321', -- 비밀번호
    'UserThree', -- 닉네임
    TO_DATE('1998-12-30', 'YYYY-MM-DD'), -- 생년월일
    '01045678901', -- 휴대폰번호
    'userthree@example.com', -- 이메일
    'F', -- 성별
    SYSDATE, -- 가입일자
    SYSDATE, -- 정보수정일자
    'B', -- 블랙리스트 상태
    15, -- 보유거북알
    'Capricorn', -- 별자리
    'AB', -- 혈액형
    'ENTJ' -- MBTI
);

DROP TABLE ITEM; 
DROP SEQUENCE SEQ_ICA;
DROP TABLE ITEMCATEGORY; 
DROP SEQUENCE SEQ_ITEM;
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
ITEM_TAG VARCHAR2(100)
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

--ITEM 테이블 샘플 데이터
INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC1', 'Item 1', 100, 'Introduction to Item 1', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC2', 'Item 2', 200, 'Introduction to Item 2', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC3', 'Item 3', 300, 'Introduction to Item 3', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC4', 'Item 4', 400, 'Introduction to Item 4', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC1', 'Item 5', 500, 'Introduction to Item 5', SYSDATE, SYSDATE, 'Y');
 
   
INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC1', 'Item 1', 100, 'Introduction to Item 1', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC2', 'Item 2', 100, 'Introduction to Item 2', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC3', 'Item 3', 100, 'Introduction to Item 3', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC4', 'Item 4', 100, 'Introduction to Item 4', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC1', 'Item 5', 100, 'Introduction to Item 5', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC2', 'Item 6', 100, 'Introduction to Item 6', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC3', 'Item 7', 100, 'Introduction to Item 7', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC4', 'Item 8', 100, 'Introduction to Item 8', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC1', 'Item 9', 100, 'Introduction to Item 9', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC2', 'Item 10', 100, 'Introduction to Item 10', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC3', 'Item 11', 100, 'Introduction to Item 11', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC4', 'Item 12', 100, 'Introduction to Item 12', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC1', 'Item 13', 100, 'Introduction to Item 13', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC2', 'Item 14', 100, 'Introduction to Item 14', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC3', 'Item 15', 100, 'Introduction to Item 15', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC4', 'Item 16', 100, 'Introduction to Item 16', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC1', 'Item 17', 100, 'Introduction to Item 17', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC2', 'Item 18', 100, 'Introduction to Item 18', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC3', 'Item 19', 100, 'Introduction to Item 19', SYSDATE, SYSDATE, 'Y');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC4', 'Item 20', 100, 'Introduction to Item 20', SYSDATE, SYSDATE, 'Y');   
 
-- 첨부파일
-- ATTACHMENT 테이블
DROP TABLE ATTACHMENT;
CREATE TABLE ATTACHMENT(
    FILE_NO NUMBER CONSTRAINT ATTACHMENT_PK PRIMARY KEY,
    REF_BNO NUMBER CONSTRAINT ATTACHMENT_REF_BNO_NN NOT NULL,
    ORIGIN_NAME VARCHAR2(255) CONSTRAINT ATTACHMENT_ORIGIN_NAME_NN NOT NULL,
    CHANGE_NAME VARCHAR2(255) CONSTRAINT ATTACHMENT_CHANGE_NAME_NN NOT NULL,
    FILE_PATH VARCHAR2(1000) CONSTRAINT ATTACHMENT_FILE_PATH_NN NOT NULL,
    UPLOAD_DATE DATE DEFAULT SYSDATE CONSTRAINT ATTACHMENT_UPLOAD_DATE_NN NOT NULL,
    FILE_POSITION NUMBER CONSTRAINT ATTACHMENT_FILE_POSITION_NN NOT NULL,
    FILE_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT ATTACHMENT_FILE_STATUS_NN NOT NULL
);
     
-- CREATE BLACKLIST TABLE 
DROP TABLE MEMBER_BLACKLIST;
DROP SEQUENCE SEQ_BLACKLIST;

CREATE TABLE MEMBER_BLACKLIST (
    BLACKLIST_NO NUMBER NOT NULL, -- 블랙리스트 고유번호 (Primary Key)
    MEM_NO NUMBER NOT NULL, -- 회원 고유번호 (Foreign Key)
    REPORTMEM_NO NUMBER NOT NULL, -- 신고 회원 고유번호 (Foreign Key)
    BLOCK_TYPE VARCHAR2(500) NOT NULL, -- 회원 블락 사유
    BLOCK_DATE DATE DEFAULT SYSDATE NOT NULL , -- 회원 블락 설정 날짜
    BLOCK_COUNT NUMBER DEFAULT 0 NOT NULL , -- 회원 블락 횟수
    EXPIRY_DATE DATE NOT NULL, -- 블랙리스트 만료일
    BLACK_STATUS VARCHAR2(1) DEFAULT 'Y' NOT NULL, -- 블랙리스트 상태 Y 블랙 N 블랙해제
    -- Primary Key 설정
    CONSTRAINT PK_MEMBER_BLACKLIST PRIMARY KEY (BLACKLIST_NO),
    -- Foreign Key 설정
    CONSTRAINT FK_MEMBER_BLACKLIST_MEMBER FOREIGN KEY (MEM_NO)
        REFERENCES MEMBER (MEM_NO),
    -- Foreign Key 설정 
    CONSTRAINT FK_MEMBER_BLACKLIST_REPORTMEM FOREIGN KEY (REPORTMEM_NO)
        REFERENCES MEMBER (MEM_NO)
);

CREATE SEQUENCE SEQ_BLACKLIST
START WITH 1
NOCACHE;

-- blacklist 샘플
INSERT INTO MEMBER_BLACKLIST (
    BLACKLIST_NO, MEM_NO, REPORTMEM_NO, BLOCK_TYPE, BLOCK_DATE, BLOCK_COUNT, EXPIRY_DATE
) VALUES (
    SEQ_BLACKLIST.NEXTVAL, 
    1001,  
    1,  
    '불법 행위로 인한 블랙리스트 등록',  
    SYSDATE, 
    0, 
    SYSDATE + INTERVAL '3' DAY 
);
INSERT INTO MEMBER_BLACKLIST (
    BLACKLIST_NO, MEM_NO, REPORTMEM_NO, BLOCK_TYPE, BLOCK_DATE, BLOCK_COUNT, EXPIRY_DATE
) VALUES (
    SEQ_BLACKLIST.NEXTVAL,  -- BLACLIST_NO: 블랙리스트의 고유번호
    1004,  -- MEM_NO: 블랙리스트에 등록된 회원의 고유번호
    1,  -- REPORTMEM_NO: 신고한 회원의 고유번호 (예시로 1002로 설정)
    '불법 행위로 인한 블랙리스트 등록',  -- BLOCK_TYPE: 블랙리스트에 등록된 이유
    SYSDATE,  -- BLOCK_DATE: 현재 날짜로 블랙 설정 날짜
    0,  -- BLOCK_COUNT: 블락 횟수 (기본값 1)
    SYSDATE + INTERVAL '3' DAY  -- EXPIRY_DATE: 블랙리스트 만료일 (예: 30일 후 만료)
);

-- 게시글 파일 파일 기본설정
INSERT 
		  INTO ATTACHMENT 
			 (
			   FILE_NO
			 , ORIGIN_NAME
			 , CHANGE_NAME
			 , FILE_PATH
			 , FILE_POSITION
			 )
		VALUES 
			 (
			   SEQ_ATT.NEXTVAL
			 , '2024082317073982976.png'
			 , '2024082317073982976.png'
			 , '/resources/post_upfiles/'
			 , 1
			 )
             ;
             commit;
        
-- NOTICE TABLE 
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_NOTICE;

CREATE TABLE NOTICE (
    NOTICE_NO NUMBER PRIMARY KEY,
    NOTICE_HTML VARCHAR2(4000) NOT NULL,
    POST_NO NUMBER NOT NULL REFERENCES POST(POST_NUM)
);
CREATE SEQUENCE SEQ_NOTICE START WITH 1 NOCACHE;
-- 공지사항 샘플
INSERT INTO POST (POST_NUM, POST_TYPE, POST_TITLE, POST_CONTENT, POST_TAG, POST_SCOPE, POST_WRITER, POST_COUNT, POST_REGDATE, POST_UPDATE, POST_STATUS, POST_BLOCK, POST_ATTACHMENT_NO)
VALUES (SEQ_POST.NEXTVAL, 1, 'First Post', 'This is the content of the first post.', 'Tag1, Tag2', 'T', 10, 0, SYSDATE, SYSDATE, 'Y', 'N', 45);


commit;


SELECT BLACKLIST_NO
  FROM MEMBER_BLACKLIST
 WHERE MEM_NO = 2
 ;
 
