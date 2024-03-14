package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Paging;
import dto.SellList;
import mybatis.SqlSessionBean;

public class SellLsitDao {
	private static SellLsitDao dao = new SellLsitDao();
	private SellLsitDao() {}
	public static SellLsitDao getInstance() {
		return dao;
	}
	
	public List<SellList> list(Paging paging) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<SellList> list = mapperSession.selectList("SellList.getList",paging);
		mapperSession.close();
		return list;
	}
	
	public int count(Map<String, String> map) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.selectOne("SellList.count",map);
		mapperSession.close();
		return result;
	}
	
	public SellList read(int idx) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		SellList vo = mapperSession.selectOne("SellList.getOne",idx);
		mapperSession.close();
		return vo;
	}
	
}
