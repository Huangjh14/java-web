use CMSDB
go

--������ɾ��2���ظ�(�ظ�ID)
CREATE PROCEDURE DeleteReply2(@id int)
AS
BEGIN
	--��������
	IF NOT EXISTS (
		SELECT *
		FROM Reply2
		WHERE ID = @id
	)
	BEGIN
		RAISERROR(N'��ɾ���Ļظ������ڣ�',15,0)--���û����ʹ�����Ϣ
		return -1;
	END
	--ɾ����2���ظ�
	DELETE Reply2
	WHERE ID = @id
	return 0;
END
go

--������ɾ��1���ظ�(�ظ�ID)
CREATE PROCEDURE DeleteReply1(@id int)
AS
BEGIN
	--��������
	IF NOT EXISTS (
		SELECT *
		FROM Reply1
		WHERE ID = @id
	)
	BEGIN
		RAISERROR(N'��ɾ���Ļظ������ڣ�',15,0)--���û����ʹ�����Ϣ
		return -1;
	END
	--ɾ���ûظ�
	DELETE Reply1
	WHERE ID = @id
	return 0;
END
go

--������ɾ������(����ID)
CREATE PROCEDURE DeletePosts(@id int)
AS
BEGIN
	--��������
	IF NOT EXISTS (
		SELECT *
		FROM Posts
		WHERE ID = @id
	)
	BEGIN
		RAISERROR(N'��ɾ�������Ӳ����ڣ�',15,0)--���û����ʹ�����Ϣ
		return -1;
	END
	--ɾ��������
	DELETE Posts
	WHERE ID = @id
	return 0;
END
go

--������ע��(�û���)
CREATE PROCEDURE DeleteAccount(@username nvarchar(64))
AS
BEGIN
	DECLARE @id int
	--��������
	IF NOT EXISTS (
		SELECT *
		FROM Account
		WHERE Username = @username
	)
	BEGIN
		RAISERROR(N'��ע�����˻������ڣ�',15,0)--���û����ʹ�����Ϣ	
		return -1;
	END
	--��ȡID
	SET @id = (
		SELECT ID
		FROM Account
		WHERE Username = @username
	)
	--ɾ���˻�
	DELETE Account
	WHERE Username = @username
	return 0;
END
go