CREATE TABLE CUSTOMER(
USERID	VARCHAR2(10) NOT NULL,	 --ȸ���ڵ�
USERPW	VARCHAR2(20) NOT NULL,	 --��й�ȣ
USERNAME	VARCHAR2(15) NOT NULL,	 --�̸�
USERGRADE	CHAR(2) NOT NULL,	 --���
USERNICK	VARCHAR2(20) NOT NULL,	 --�г���
USERPHONE	NUMBER(11) NOT NULL,	 --����ó(��ȭ��ȣ)
USEREMAIL	VARCHAR2(30) NOT NULL,	 --�̸���
USERGOOD	NUMBER(10) DEFAULT '0',	 --������õ��
USERPHOTO	VARCHAR2(50),	 --ȸ������
USERREGDATE DATE	 --������
);

ALTER TABLE CUSTOMER ADD(
CONSTRAINT PK_CUSTOMER_USERID PRIMARY KEY(USERID));