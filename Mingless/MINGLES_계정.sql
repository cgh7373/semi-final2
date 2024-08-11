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