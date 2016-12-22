package edu.hzu.javaweb.labs.se1414080902223;

import java.util.List;
import edu.hzu.javaweb.labs.se1414080902223.Score;

public interface IStudentDAO {
	
	public abstract Score create(Score stu) throws Exception;//��Ӽ�¼
	public abstract void remove(Score stu) throws Exception;//ɾ����¼
	public abstract Score find(Score stu) throws Exception;//��ѯ��¼
	public abstract List<Score> findAll() throws Exception; //�г���¼
	public abstract void update(Score stu) throws Exception; //�޸ļ�¼
	
}