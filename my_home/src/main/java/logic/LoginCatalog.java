package logic;

import model.User;


public interface LoginCatalog {
	User getUser(String id);
	String getPassword(String id);
	Integer getIdCount(String id);
	void entryUser(User user);
}
