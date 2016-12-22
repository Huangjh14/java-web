use CMSDB
go

--����������Reply2���¼������
CREATE TRIGGER Insert_Reply2
ON Reply2
AFTER INSERT
AS
BEGIN
	--��ȡ��Reply2��¼����������ID
	DECLARE @pid int
	SET @pid = (
		SELECT PID
		FROM Reply1
		WHERE ID = (
			SELECT RID
			FROM inserted
		)
	)
	--�������Ӽ�¼�ۼӻظ���
	UPDATE Posts
	SET ReplyCount = ReplyCount + 1
	WHERE ID = @pid
END
go

--����������Reply1���¼������
CREATE TRIGGER Insert_Reply1
ON Reply1
AFTER INSERT
AS
BEGIN
	--��ȡ��Reply1��¼����������ID
	DECLARE @pid int
	SET @pid = (
		SELECT PID
		FROM inserted
	)
	--�������Ӽ�¼�ۼӻظ���
	UPDATE Posts
	SET ReplyCount = ReplyCount + 1
	WHERE ID = @pid
END
go

--������ɾ��Reply2���¼������
CREATE TRIGGER Delete_Reply2
ON Reply2
INSTEAD OF DELETE
AS
BEGIN
	--����ɾ��ÿ��2���ظ�
	DELETE Reply2
	WHERE ID in (
		SELECT ID
		FROM deleted
	)
	--��¼����ID
	INSERT INTO R_R2ID(ID)
		SELECT id
		FROM deleted
END
go

--������ɾ��Reply1���¼������
CREATE TRIGGER Delete_Reply1
ON Reply1
INSTEAD OF DELETE
AS
BEGIN
	--ɾ���Դ�1���ظ����еĻظ�
	DELETE Reply2
	WHERE RID in (
		SELECT ID
		FROM deleted
	)
	--END
	--����ɾ��1���ظ�
	DELETE Reply1
	WHERE ID in (
		SELECT ID
		FROM deleted
	)
	--��¼����ID
	INSERT INTO R_R1ID(ID)
		SELECT ID
		FROM deleted
END
go

--������ɾ��Posts���¼������
CREATE TRIGGER Delete_Posts
ON Posts
INSTEAD OF DELETE
AS
BEGIN
	--ɾ���Դ����ӽ��еĻظ�
	DELETE Reply1
	WHERE PID in (
		SELECT ID
		FROM deleted
	)
	--END
	--����ɾ������
	DELETE Posts
	WHERE ID in (
		SELECT ID
		FROM deleted
	)
	--��¼����ID
	INSERT INTO R_PID(ID)
		SELECT ID
		FROM deleted
END
go

--������ɾ��Account���¼������
CREATE TRIGGER Delete_Account
ON Account
INSTEAD OF DELETE
AS
BEGIN
	--ɾ�����˻�����������
	DELETE Posts
	WHERE AID in (
		SELECT ID
		FROM deleted
	)
	--ɾ�����˻�������1���ظ�
	DELETE Reply1
	WHERE AID in (
		SELECT ID
		FROM deleted
	)
	--ɾ�����˻�������2���ظ�
	DELETE Reply2
	WHERE AID in (
		SELECT ID
		FROM deleted
	)
	--����ɾ���˻�
	DELETE Account
	WHERE ID in (
		SELECT ID
		FROM deleted
	)
	--��¼����ID
	INSERT INTO R_AID(ID)
		SELECT ID
		FROM deleted
END
go