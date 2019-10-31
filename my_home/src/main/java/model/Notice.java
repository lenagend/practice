package model;

import org.hibernate.validator.constraints.NotEmpty;

public class Notice {
	
private Integer seqno;
@NotEmpty(message="제목을 입력하세요")
private String title;
@NotEmpty(message="내용을 입력하세요")
private String content;
private String id;
private String notice_date;
public Integer getSeqno() {
	return seqno;
}
public void setSeqno(Integer seqno) {
	this.seqno = seqno;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public void setNotice_date(String notice_date) {
	this.notice_date = notice_date;
}
public String getNotice_date() {
	return notice_date;
}

}
