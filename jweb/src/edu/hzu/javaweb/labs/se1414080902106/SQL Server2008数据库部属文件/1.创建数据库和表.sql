--�������ݿ�
CREATE DATABASE CMSDB;
go

use CMSDB;

--�����˻���
CREATE TABLE Account(
	ID int PRIMARY KEY,
	Username nvarchar(64) UNIQUE not null,	--�û���
	Password nvarchar(32) not null,			--����
	Name nvarchar(256) not null				--�ǳ�
)
go

--�������ӱ�
CREATE TABLE Posts(
	ID int PRIMARY KEY,
	AID int not null,					--�����˻�ID
	Title nvarchar(128) not null,		--����
	Text nvarchar(max) not null,		--����
	CreateDateTime datetime not null,	--����ʱ��
	ReplyCount int not null,			--�ظ���
	FOREIGN KEY(AID) REFERENCES Account(ID)
)
go

--����1���ظ���
CREATE TABLE Reply1(
	ID int PRIMARY KEY,
	AID int not null,					--�����˻�ID
	PID int not null,					--���ظ�����ID
	Text nvarchar(max) not null,		--����
	CreateDateTime datetime not null,	--����ʱ��
	FOREIGN KEY(AID) REFERENCES Account(ID),
	FOREIGN KEY(PID) REFERENCES Posts(ID)
)
go

--����2���ظ���
CREATE TABLE Reply2(
	ID int PRIMARY KEY,
	AID int not null,					--�����˻�ID
	RID int not null,					--���ظ���1���ظ���ID
	Text nvarchar(max) not null,		--����
	CreateDateTime datetime not null,	--����ʱ��
	FOREIGN KEY(AID) REFERENCES Account(ID),
	FOREIGN KEY(RID) REFERENCES Reply1(ID)
)
go

--�����˻���Ŀ���ID��
CREATE TABLE R_AID(
	ID int PRIMARY KEY
)
--�������ӱ�Ŀ���ID��
CREATE TABLE R_PID(
	ID int PRIMARY KEY
)
--����1���ظ���Ŀ���ID��
CREATE TABLE R_R1ID(
	ID int PRIMARY KEY
)
--����2���ظ���Ŀ���ID��
CREATE TABLE R_R2ID(
	ID int PRIMARY KEY
)
