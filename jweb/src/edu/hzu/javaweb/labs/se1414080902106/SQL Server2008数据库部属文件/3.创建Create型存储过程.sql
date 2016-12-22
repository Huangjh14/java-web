use CMSDB
go

--������ע��(�û��������룬�ǳ�)
CREATE PROCEDURE CreateAccount(@username nvarchar(64),@password nvarchar(32),@name nvarchar(256))
AS
BEGIN
	--���
	IF @username IS NULL or @username = ''
	BEGIN
		RAISERROR(N'�û�������Ϊ�գ�',15,0)--���û����ʹ�����Ϣ
		return -1;
	END
	IF @password IS NULL or @password = ''
	BEGIN
		RAISERROR(N'���벻��Ϊ�գ�',15,0)--���û����ʹ�����Ϣ
		return -1;
	END
	IF @name IS NULL or @name = ''
	BEGIN
		RAISERROR(N'�ǳƲ���Ϊ�գ�',15,0)--���û����ʹ�����Ϣ
		return -1;
	END
	--�ж��û����Ƿ��ظ�
	IF EXISTS (
		SELECT *
		FROM Account
		WHERE Username = @username
	)
	BEGIN
		RAISERROR(N'�û����Ѵ��ڣ�',15,0)--���û����ʹ�����Ϣ
		return -1;
	END
	--��ȡ����ID
	DECLARE @id int;
	SET @id = (
		SELECT TOP(1) ID
		FROM R_AID
	)
	--�ж��Ƿ��п���ID,��û�����Ե�ǰ��¼��ΪID
	IF @id IS NULL
	BEGIN
		SET @id = (
			SELECT COUNT(*)
			FROM Account
		)
	END
	ELSE
	BEGIN
		DELETE R_AID
		WHERE ID = @id
	END
	--�����¼�¼
	INSERT INTO Account(ID,Username,Password,Name)
	VALUES (@id,@username,@password,@name)
	return 0;
END
go

--����������(�����˻�ID�����⣬����)
CREATE PROCEDURE CreatePosts(@aid int,@title nvarchar(128),@text nvarchar(max))
AS
BEGIN
	--��������
	IF NOT EXISTS (
		SELECT *
		FROM Account
		WHERE ID = @aid
	)
	BEGIN
		RAISERROR(N'���������˻������ڣ�',15,0)--���û����ʹ�����Ϣ	
		return -1;
	END
	--���
	IF @title IS NULL or @title = ''
	BEGIN
		RAISERROR(N'���ⲻ��Ϊ�գ�',15,0)--���û����ʹ�����Ϣ
		return -1;
	END	
	IF @text IS NULL or @text = ''
	BEGIN
		RAISERROR(N'���ݲ���Ϊ�գ�',15,0)--���û����ʹ�����Ϣ
		return -1;
	END	
	--��ȡ����ID
	DECLARE @id int;
	SET @id = (
		SELECT TOP(1) ID
		FROM R_PID
	)
	--�ж��Ƿ��п���ID,��û�����Ե�ǰ��¼��ΪID
	IF @id IS NULL
	BEGIN
		SET @id = (
			SELECT COUNT(*)
			FROM Posts
		)
	END
	ELSE
	BEGIN
		DELETE R_PID
		WHERE ID = @id
	END
	--�����¼�¼
	INSERT INTO Posts(ID,AID,Title,Text,CreateDateTime,ReplyCount)
	VALUES (@id,@aid,@title,@text,GETDATE(),0)
	return 0;
END
go

--����������1���ظ�(�����˻�ID����Ӧ����ID������)
CREATE PROCEDURE CreateReply1(@aid int,@pid int,@text nvarchar(max))
AS
BEGIN
	--��������
	IF NOT EXISTS (
		SELECT *
		FROM Account
		WHERE ID = @aid
	)
	BEGIN
		RAISERROR(N'�û��������޷�����ظ���',15,0)--���û����ʹ�����Ϣ	
		return -1;
	END
	IF NOT EXISTS (
		SELECT *
		FROM Posts
		WHERE ID = @pid
	)
	BEGIN
		RAISERROR(N'���Ӳ������޷�����ظ���',15,0)--���û����ʹ�����Ϣ	
		return -1;
	END
	--���
	IF @text IS NULL or @text = ''
	BEGIN
		RAISERROR(N'�ظ����ݲ���Ϊ�գ�',15,0)--���û����ʹ�����Ϣ	
		return -1;		
	END
	--��ȡ����ID
	DECLARE @id int;
	SET @id = (
		SELECT TOP(1) ID
		FROM R_R1ID
	)
	--�ж��Ƿ��п���ID,��û�����Ե�ǰ��¼��ΪID
	IF @id IS NULL
	BEGIN
		SET @id = (
			SELECT COUNT(*)
			FROM Reply1
		)
	END
	ELSE
	BEGIN
		DELETE R_R1ID
		WHERE ID = @id
	END
	--��¼1���ظ�
	INSERT INTO Reply1(ID,AID,PID,Text,CreateDateTime)
	VALUES (@id,@aid,@pid,@text,GETDATE())
	return 0;
END
go

--����������2���ظ�(�����˻�ID����Ӧ1���ظ�ID������)
CREATE PROCEDURE CreateReply2(@aid int,@rid int,@text nvarchar(max))
AS
BEGIN
	--��������
	IF NOT EXISTS (
		SELECT *
		FROM Account
		WHERE ID = @aid
	)
	BEGIN
		RAISERROR(N'�˻��������޷�����ظ���',15,0)--���û����ʹ�����Ϣ	
		return -1;
	END
	IF NOT EXISTS (
		SELECT *
		FROM Reply1
		WHERE ID = @rid
	)
	BEGIN
		RAISERROR(N'�ظ��������޷�����ظ���',15,0)--���û����ʹ�����Ϣ	
		return -1;
	END
	--���
	IF @text IS NULL or @text = ''
	BEGIN
		RAISERROR(N'�ظ����ݲ���Ϊ�գ�',15,0)--���û����ʹ�����Ϣ	
		return -1;		
	END
	--��ȡ����ID
	DECLARE @id int;
	SET @id = (
		SELECT TOP(1) ID
		FROM R_R2ID
	)
	--�ж��Ƿ��п���ID,��û�����Ե�ǰ��¼��ΪID
	IF @id IS NULL
	BEGIN
		SET @id = (
			SELECT COUNT(*)
			FROM Reply2
		)
	END
	ELSE
	BEGIN
		DELETE R_R2ID
		WHERE ID = @id
	END
	--��¼2���ظ�
	INSERT INTO Reply2(ID,AID,RID,Text,CreateDateTime)
	VALUES (@id,@aid,@rid,@text,GETDATE())
	return 0;
END
go