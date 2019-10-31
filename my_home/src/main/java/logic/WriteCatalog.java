package logic;

import java.util.List;

import model.Bbs;
import model.Condition;
import model.Notice;

public interface WriteCatalog {
Integer getMaxBbsId();
void putBbs(Bbs bbs);

List<Bbs> readBbs(Condition c);
Integer getBbsCount();
Bbs getBbsDetail(Integer id);

Integer getMaxNoticeId();
void putNotice(Notice notice);

List<Notice> readNotice(Condition c);
Integer getNoticeCount();
Notice getNoticeDetail(Integer id);

}
