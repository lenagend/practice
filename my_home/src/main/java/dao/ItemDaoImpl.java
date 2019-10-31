package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Condition;
import model.Item;
@Repository
public class ItemDaoImpl implements ItemDao {
		@Autowired
		private SqlSession session;
	public void putItem(Item item) {
		session.insert("mapper.myMapper.putItem",item);
	}

	public List<Item> getItems(Condition c) {
	
		return session.selectList("mapper.myMapper.getItemList",c);
	}

	public Integer getItemCount() {
		
		return session.selectOne("mapper.myMapper.getItemCount");
	}

	public Item getItem(String id) {
	// TODO Auto-generated method stub
	return session.selectOne("mapper.myMapper.getItem", id);
	}
}
