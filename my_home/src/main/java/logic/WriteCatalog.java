package logic;

import java.util.List;

import model.Bbs;
import model.Condition;
import model.Notice;
import model.Writing;

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


Integer getMaxWritingId();
void insertWriting(Writing writing);	
List<Writing> getWriting(Condition c);
Integer selectMaxGroupId();
void updateOrderNoReply(Writing writing);


Integer selectReplyPage(Integer seqno);
Integer selectImageCount();

Writing getImageWriting(Integer id);
void deleteWriting(Integer id);


void updateWriting(Writing writing);

}
