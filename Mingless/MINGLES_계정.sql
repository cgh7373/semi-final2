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
    1001, -- ȸ����ȣ
    'blacklistedUser', -- ���̵�
    'password123', -- ��й�ȣ
    'BlackUser', -- �г���
    TO_DATE('1990-01-01', 'YYYY-MM-DD'), -- �������
    '010-1234-5678', -- �޴�����ȣ
    'blackuser@example.com', -- �̸���
    'M', -- ����
    SYSDATE, -- ��������
    SYSDATE, -- ������������
    'B', -- ������Ʈ ����
    0, -- �����źϾ�
    'Aries', -- ���ڸ� (��: ���ڸ�)
    'O', -- ������
    'INTJ' -- MBTI
);

DROP TABLE MEMBER_BLACKLIST;

CREATE TABLE MEMBER_BLACKLIST (
    BLACLIST_NO NUMBER NOT NULL, -- ������Ʈ ������ȣ (Primary Key)
    MEM_NO NUMBER NOT NULL, -- ȸ�� ������ȣ (Foreign Key)
    REPORTMEM_NO NUMBER NOT NULL, -- �Ű� ȸ�� ������ȣ (Foreign Key)
    BLOCK_TYPE VARCHAR2(500) NOT NULL, -- ȸ�� ��� ����
    BLOCK_DATE DATE DEFAULT SYSDATE NOT NULL , -- ȸ�� ��� ���� ��¥
    BLOCK_COUNT NUMBER DEFAULT 1 NOT NULL , -- ȸ�� ��� Ƚ��
    EXPIRY_DATE DATE NOT NULL, -- ������Ʈ ������

    -- Primary Key ����
    CONSTRAINT PK_MEMBER_BLACKLIST PRIMARY KEY (BLACLIST_NO),
    -- Foreign Key ����
    CONSTRAINT FK_MEMBER_BLACKLIST_MEMBER FOREIGN KEY (MEM_NO)
        REFERENCES MEMBER (MEM_NO),
    -- Foreign Key ���� 
    CONSTRAINT FK_MEMBER_BLACKLIST_REPORTMEM FOREIGN KEY (REPORTMEM_NO)
        REFERENCES MEMBER (MEM_NO)
);

INSERT INTO MEMBER_BLACKLIST (
    BLACLIST_NO, MEM_NO, REPORTMEM_NO, BLOCK_TYPE, BLOCK_DATE, BLOCK_COUNT, EXPIRY_DATE
) VALUES (
    1,  -- BLACLIST_NO: ������Ʈ�� ������ȣ
    1001,  -- MEM_NO: ������Ʈ�� ��ϵ� ȸ���� ������ȣ
    1,  -- REPORTMEM_NO: �Ű��� ȸ���� ������ȣ (���÷� 1002�� ����)
    '�ҹ� ������ ���� ������Ʈ ���',  -- BLOCK_TYPE: ������Ʈ�� ��ϵ� ����
    SYSDATE,  -- BLOCK_DATE: ���� ��¥�� �� ���� ��¥
    1,  -- BLOCK_COUNT: ��� Ƚ�� (�⺻�� 1)
    SYSDATE + INTERVAL '30' DAY  -- EXPIRY_DATE: ������Ʈ ������ (��: 30�� �� ����)
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
        MEMBER m ON b.MEM_NO = m.MEM_NO  -- ��������
  JOIN
        MEMBER r ON b.REPORTMEM_NO = r.MEM_NO  -- �Ű��� ȸ�� ������ ����
  ORDER
     BY
        b.BLOCK_DATE DESC;