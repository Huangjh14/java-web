use CMSDB
go

--��������¼(�û���������)���ɹ������˻�ID��ʧ�ܷ���-1
CREATE PROCEDURE Login(@username nvarchar(64),@password nvarchar(32))
AS
BEGIN
	--��������
	DECLARE @aid int;
	SET @aid = (
		SELECT ID
		FROM Account
		WHERE Username = @username
	)
	IF @aid IS NULL
	BEGIN
		RAISERROR(N'�˻������ڣ�',15,0)--���û����ʹ�����Ϣ	
		return -1;
	END
	--��������Ƿ���ȷ
	IF @password = (
		SELECT Password
		FROM Account
		WHERE ID = @aid
	)
	BEGIN
		--�Բ�ѯ����ķ�ʽ���ؽ��
		SELECT ID,Name
		FROM Account
		WHERE ID = @aid
		return @aid;
	END
	RAISERROR(N'�������',15,0)--���û����ʹ�����Ϣ	
	return -1;
END