package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.Paging;
import dto.SellList;
import mybatis.SqlSessionBean;

public class SalePageDao {
	private static final Logger logger = LoggerFactory.getLogger(SalePageDao.class);
	private static SalePageDao dao = new SalePageDao();
	private SalePageDao() {}
	public static SalePageDao getInstance() {
		return dao;
	}
	
	public List<SellList> list(Paging paging) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<SellList> list = mapperSession.selectList("sale-page.getList",paging);
		mapperSession.close();
		return list;
	}
	
	
	public int count(Map<String, String> map) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.selectOne("sale-page.count",map);
		mapperSession.close();
		return result;
	}
	
	public SellList read(int idx) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		SellList vo = mapperSession.selectOne("sale-page.getOne",idx);
		mapperSession.close();
		return vo;
	}

	public int write(SellList sellList) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.insert("sale-page.insert",sellList);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	
	public int update(SellList sellList) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.update("sale-page.update",sellList);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	
	public int delete(int idx) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.update("sale-page.delete",idx);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
}

