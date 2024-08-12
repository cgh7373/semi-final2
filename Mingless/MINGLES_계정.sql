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
    '010-1234-5678', -- 휴대폰번호
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
    '010-2345-6789', -- 휴대폰번호
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
    '010-3456-7890', -- 휴대폰번호
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
    '010-4567-8901', -- 휴대폰번호
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

COMMIT;


-- CREATE BLACKLIST TABLE 
DROP TABLE MEMBER_BLACKLIST;

CREATE TABLE MEMBER_BLACKLIST (
    BLACLIST_NO NUMBER NOT NULL, -- 블랙리스트 고유번호 (Primary Key)
    MEM_NO NUMBER NOT NULL, -- 회원 고유번호 (Foreign Key)
    REPORTMEM_NO NUMBER NOT NULL, -- 신고 회원 고유번호 (Foreign Key)
    BLOCK_TYPE VARCHAR2(500) NOT NULL, -- 회원 블락 사유
    BLOCK_DATE DATE DEFAULT SYSDATE NOT NULL , -- 회원 블락 설정 날짜
    BLOCK_COUNT NUMBER DEFAULT 1 NOT NULL , -- 회원 블락 횟수
    EXPIRY_DATE DATE NOT NULL, -- 블랙리스트 만료일

    -- Primary Key 설정
    CONSTRAINT PK_MEMBER_BLACKLIST PRIMARY KEY (BLACLIST_NO),
    -- Foreign Key 설정
    CONSTRAINT FK_MEMBER_BLACKLIST_MEMBER FOREIGN KEY (MEM_NO)
        REFERENCES MEMBER (MEM_NO),
    -- Foreign Key 설정 
    CONSTRAINT FK_MEMBER_BLACKLIST_REPORTMEM FOREIGN KEY (REPORTMEM_NO)
        REFERENCES MEMBER (MEM_NO)
);

CREATE SEQUENCE SEQ_BLACKLIST
START WITH 2
NOCACHE;

INSERT INTO MEMBER_BLACKLIST (
    BLACLIST_NO, MEM_NO, REPORTMEM_NO, BLOCK_TYPE, BLOCK_DATE, BLOCK_COUNT, EXPIRY_DATE
) VALUES (
    1,  -- BLACLIST_NO: 블랙리스트의 고유번호
    1001,  -- MEM_NO: 블랙리스트에 등록된 회원의 고유번호
    1,  -- REPORTMEM_NO: 신고한 회원의 고유번호 (예시로 1002로 설정)
    '불법 행위로 인한 블랙리스트 등록',  -- BLOCK_TYPE: 블랙리스트에 등록된 이유
    SYSDATE,  -- BLOCK_DATE: 현재 날짜로 블랙 설정 날짜
    1,  -- BLOCK_COUNT: 블락 횟수 (기본값 1)
    SYSDATE + INTERVAL '30' DAY  -- EXPIRY_DATE: 블랙리스트 만료일 (예: 30일 후 만료)
);

INSERT INTO MEMBER_BLACKLIST (
    BLACLIST_NO, MEM_NO, REPORTMEM_NO, BLOCK_TYPE, BLOCK_DATE, BLOCK_COUNT, EXPIRY_DATE
) VALUES (
    SEQ_BLACKLIST.NEXTVAL,  -- BLACLIST_NO: 블랙리스트의 고유번호
    1004,  -- MEM_NO: 블랙리스트에 등록된 회원의 고유번호
    1,  -- REPORTMEM_NO: 신고한 회원의 고유번호 (예시로 1002로 설정)
    '불법 행위로 인한 블랙리스트 등록',  -- BLOCK_TYPE: 블랙리스트에 등록된 이유
    SYSDATE,  -- BLOCK_DATE: 현재 날짜로 블랙 설정 날짜
    1,  -- BLOCK_COUNT: 블락 횟수 (기본값 1)
    SYSDATE + INTERVAL '30' DAY  -- EXPIRY_DATE: 블랙리스트 만료일 (예: 30일 후 만료)
);

COMMIT;

SELECT
        m.MEM_ID,
        m.NICKNAME,
        b.BLOCK_TYPE,
        b.BLOCK_COUNT,
        r.MEM_ID,
        b.BLOCK_DATE
  FROM
        MEMBER_BLACKLIST b
  JOIN
        MEMBER m ON b.MEM_NO = m.MEM_NO  -- 내부조인
  JOIN
        MEMBER r ON b.REPORTMEM_NO = r.MEM_NO  -- 신고자 회원 정보와 조인
  ORDER
     BY
        b.BLOCK_DATE DESC;
        
SELECT
		        m.MEM_ID AS "MEM_ID",
		        m.NICKNAME AS "NICKNAME",
		        b.BLOCK_TYPE AS "BLOCK_TYPE",
		        b.BLOCK_COUNT AS "BLOCK_COUNT",
		        r.MEM_ID "REPORT_ID",
		        b.BLOCK_DATE "BLOCK_DATE"
		  FROM
		        MEMBER_BLACKLIST b
		  JOIN
		        MEMBER m ON b.MEM_NO = m.MEM_NO 
		  JOIN
		        MEMBER r ON b.REPORTMEM_NO = r.MEM_NO  
		  ORDER
		     BY
		        b.BLOCK_DATE DESC
                ;
                
                commit
                ;
                
UPDATE MEMBER 
   SET STATUS = 'N'
   WHERE STATUS = 'C';
   
SELECT COUNT(MEM_NO)
  FROM MEMBER
 WHERE EXTRACT(MONTH FROM ENROLL_DATE) = 8
   AND STATUS != 'N';
 
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
ITEM_STATUS CHAR(1) CONSTRAINT ITEM_STATUS_NN NOT NULL
);
-- SEQ_ITEM 시퀀스
CREATE SEQUENCE SEQ_ITEM
START WITH 1
NOCACHE;

--ITEMCATEGORY 테이블 샘플 데이터
INSERT INTO ITEMCATEGORY (ITEM_CATEGORY, CATEGORYNAME)
VALUES ('IC1', 'Category 1');

INSERT INTO ITEMCATEGORY (ITEM_CATEGORY, CATEGORYNAME)
VALUES ('IC2', 'Category 2');

INSERT INTO ITEMCATEGORY (ITEM_CATEGORY, CATEGORYNAME)
VALUES ('IC3', 'Category 3');

INSERT INTO ITEMCATEGORY (ITEM_CATEGORY, CATEGORYNAME)
VALUES ('IC4', 'Category 4');

INSERT INTO ITEMCATEGORY (ITEM_CATEGORY, CATEGORYNAME)
VALUES ('IC5', 'Category 5');
--ITEM 테이블 샘플 데이터
INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC1', 'Item 1', 100, 'Introduction to Item 1', SYSDATE, SYSDATE, 'A');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC2', 'Item 2', 200, 'Introduction to Item 2', SYSDATE, SYSDATE, 'A');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC3', 'Item 3', 300, 'Introduction to Item 3', SYSDATE, SYSDATE, 'A');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC4', 'Item 4', 400, 'Introduction to Item 4', SYSDATE, SYSDATE, 'A');

INSERT INTO ITEM (ITEM_NUM, ITEM_CATEGORY, ITEM_NAME, PRICE, ITEM_INTRO, ITEM_DATE, ITEM_UPDATE, ITEM_STATUS)
VALUES (SEQ_ITEM.NEXTVAL, 'IC5', 'Item 5', 500, 'Introduction to Item 5', SYSDATE, SYSDATE, 'A');
 
 