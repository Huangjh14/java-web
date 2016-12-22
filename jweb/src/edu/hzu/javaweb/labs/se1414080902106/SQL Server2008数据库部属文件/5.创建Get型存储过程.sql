use CMSDB
go

--��������ȡ����(����ID)
CREATE PROCEDURE GetPosts(@id int)
AS
BEGIN
	--��������
	IF NOT EXISTS (
		SELECT *
		FROM Posts
		WHERE ID = @id
	)
	BEGIN
		RAISERROR(N'���Ӳ������޷���ȡ��',15,0)--���û����ʹ�����Ϣ	
		return -1;
	END
	--��ѯ����
	SELECT Posts.*,Name
	FROM Posts,Account
	WHERE Posts.ID = @id and Posts.AID = Account.ID
	return 0;
END
go

--��������ȡ1���ظ�(�ظ�ID)
CREATE PROCEDURE GetReply1(@id int)
AS
BEGIN
	--��������
	IF NOT EXISTS (
		SELECT *
		FROM Reply1
		WHERE ID = @id
	)
	BEGIN
		RAISERROR(N'�ظ��������޷���ȡ��',15,0)--���û����ʹ�����Ϣ	
		return -1;
	END
	--��ѯ1���ظ�
	SELECT *
	FROM Reply1
	WHERE ID = @id
	return 0;
END
go

--��������ȡ2���ظ�(�ظ�ID)
CREATE PROCEDURE GetReply2(@id int)
AS
BEGIN
	--��������
	IF NOT EXISTS (
		SELECT *
		FROM Reply2
		WHERE ID = @id
	)
	BEGIN
		RAISERROR(N'�ظ��������޷���ȡ��',15,0)--���û����ʹ�����Ϣ	
		return -1;
	END
	--��ѯ2���ظ�
	SELECT *
	FROM Reply2
	WHERE ID = @id
	return 0;
END
go

--��������ȡ�������ӵı��⡢���ߺʹ���ʱ�䣬������ʱ�����������
CREATE PROCEDURE GetAllPosts
AS
BEGIN
	SELECT Posts.ID,Title,Account.ID,Name,CreateDateTime,ReplyCount
	FROM Posts,Account
	WHERE Posts.AID = Account.ID
	ORDER BY CreateDateTime DESC
END
go

--��������ȡĳ���˻����������ӣ�������ʱ�����������
CREATE PROCEDURE GetSomePosts(@aid int)
AS
BEGIN
	--��������
	IF NOT EXISTS (
		SELECT *
		FROM Account
		WHERE ID = @aid
	)
	BEGIN
		RAISERROR(N'�˻������ڣ�',15,0)--���û����ʹ�����Ϣ
		return -1;
	END
	--��ȡ����
	SELECT ID,Title,CreateDateTime,ReplyCount
	FROM Posts
	WHERE AID = @aid
	return 0;
END
go

--��������ȡĳ�����ӵ����лظ������ݡ����ߺʹ���ʱ��(����ID)��������ʱ����絽������
CREATE PROCEDURE GetSomeReply1(@pid int)
AS
BEGIN
	--��������
	IF NOT EXISTS (
		SELECT *
		FROM Posts
		WHERE ID = @pid
	)
	BEGIN
		RAISERROR(N'���Ӳ����ڣ�',15,0)--���û����ʹ�����Ϣ	
		return -1;
	END
	--��ȡ�ظ�
	SELECT Reply1.ID,Text,Account.ID,Name,CreateDateTime
	FROM Reply1,Account
	WHERE PID = @pid and AID = Account.ID
	ORDER BY CreateDateTime ASC
	return 0;
END
go

--��������ȡĳ��1���ظ������лظ������ݡ����ߺʹ���ʱ��(1���ظ�ID)��������ʱ����絽������
CREATE PROCEDURE GetSomeReply2(@rid int)
AS
BEGIN
	--��������
	IF NOT EXISTS (
		SELECT *
		FROM Reply1
		WHERE ID = @rid
	)
	BEGIN
		RAISERROR(N'�ظ������ڣ�',15,0)--���û����ʹ�����Ϣ	
		return -1;
	END
	--��ȡ�ظ�
	SELECT Reply2.ID,Text,Account.ID,Name,CreateDateTime
	FROM Reply2,Account
	WHERE RID = @rid and AID = Account.ID
	ORDER BY CreateDateTime ASC
	return 0;
END
go

--��������ȡ�˻���Ϣ
CREATE PROCEDURE GetAccount(@id int)
AS
BEGIN
	--��������
	IF NOT EXISTS (
		SELECT *
		FROM Account
		WHERE ID = @id
	)
	BEGIN
		RAISERROR(N'�˻������ڣ�',15,0)--���û����ʹ�����Ϣ
		return -1;
	END
	--��ȡ��Ϣ
	SELECT Name
	FROM Account
	WHERE ID = @id
	return 0;
END
go