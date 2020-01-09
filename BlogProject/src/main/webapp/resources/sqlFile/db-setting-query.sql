--------------------------------------------------------
--  파일이 생성됨 - 화요일-1월-07-2020   
--------------------------------------------------------
DROP SEQUENCE "COMM_SEQ";
DROP SEQUENCE "POST_SEQ";
DROP SEQUENCE "PROP_SEQ";
DROP SEQUENCE "USER_SEQ";
DROP TABLE "BLOG_POST" cascade constraints;
DROP TABLE "BLOG_PROP" cascade constraints;
DROP TABLE "BLOG_USER" cascade constraints;
DROP TABLE "POST_COMM" cascade constraints;
--------------------------------------------------------
--  DDL for Sequence COMM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "COMM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence POST_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "POST_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PROP_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PROP_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence USER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "USER_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table BLOG_POST
--------------------------------------------------------

  CREATE TABLE "BLOG_POST" 
   (	"POST_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"POST_TITLE" VARCHAR2(400), 
	"POST_CON" VARCHAR2(4000), 
	"POST_CATE" NUMBER, 
	"POST_DATE" DATE DEFAULT SYSDATE, 
	"POST_HIT" NUMBER DEFAULT 0, 
	"DEL_YN" NUMBER DEFAULT 1
   ) ;
--------------------------------------------------------
--  DDL for Table BLOG_PROP
--------------------------------------------------------

  CREATE TABLE "BLOG_PROP" 
   (	"PROP_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"BLOG_NAME" VARCHAR2(200), 
	"PROP_COMMENT" VARCHAR2(400) DEFAULT 'hello!', 
	"DEL_YN" NUMBER DEFAULT 1, 
	"MENU1" VARCHAR2(200), 
	"MENU2" VARCHAR2(200), 
	"MENU3" VARCHAR2(200), 
	"MENU4" VARCHAR2(200), 
	"MENU5" VARCHAR2(200)
   ) ;
--------------------------------------------------------
--  DDL for Table BLOG_USER
--------------------------------------------------------

  CREATE TABLE "BLOG_USER" 
   (	"USER_NO" NUMBER, 
	"USER_ID" VARCHAR2(400), 
	"USER_PW" VARCHAR2(400), 
	"USER_EMAIL" VARCHAR2(400), 
	"USER_FB_ADD" VARCHAR2(1000), 
	"USER_INSTA_ADD" VARCHAR2(1000), 
	"USER_GIT_ADD" VARCHAR2(1000), 
	"USER_DEL_YN" NUMBER DEFAULT 1, 
	"USER_DATE" DATE DEFAULT SYSDATE, 
	"BLOG_EDIT" NUMBER DEFAULT 0
   ) ;
--------------------------------------------------------
--  DDL for Table POST_COMM
--------------------------------------------------------

  CREATE TABLE "POST_COMM" 
   (	"COMM_NO" NUMBER, 
	"POST_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"COMM_CON" VARCHAR2(1000), 
	"COMM_DATE" DATE DEFAULT SYSDATE, 
	"DEL_YN" NUMBER DEFAULT 1
   ) ;
REM INSERTING into BLOG_POST
SET DEFINE OFF;
Insert into BLOG_POST (POST_NO,USER_NO,POST_TITLE,POST_CON,POST_CATE,POST_DATE,POST_HIT,DEL_YN) values (9,2,'제발 성공해줘','보여주냐??',4,to_date('19/12/31','RR/MM/DD'),0,0);
Insert into BLOG_POST (POST_NO,USER_NO,POST_TITLE,POST_CON,POST_CATE,POST_DATE,POST_HIT,DEL_YN) values (10,2,'작성 성공했냐??','<span style="font-size:48px"><strong>몰라</strong></span>',5,to_date('19/12/31','RR/MM/DD'),0,0);
Insert into BLOG_POST (POST_NO,USER_NO,POST_TITLE,POST_CON,POST_CATE,POST_DATE,POST_HIT,DEL_YN) values (11,2,'스타일 수정 테스트','<span style="color:#f1c40f"><span style="font-size:48px"><strong>킈재야 하~위~</strong></span></span>',2,to_date('19/12/31','RR/MM/DD'),0,0);
Insert into BLOG_POST (POST_NO,USER_NO,POST_TITLE,POST_CON,POST_CATE,POST_DATE,POST_HIT,DEL_YN) values (19,2,'asdf','asdf',2,to_date('20/01/06','RR/MM/DD'),0,0);
Insert into BLOG_POST (POST_NO,USER_NO,POST_TITLE,POST_CON,POST_CATE,POST_DATE,POST_HIT,DEL_YN) values (21,21,'ㅁㄴㅇㄹ','ㅁㄴㅇㄹ',1,to_date('20/01/06','RR/MM/DD'),0,0);
Insert into BLOG_POST (POST_NO,USER_NO,POST_TITLE,POST_CON,POST_CATE,POST_DATE,POST_HIT,DEL_YN) values (22,2,'asdf','<img alt="" src="resources/upload/20200106175233006749di_flow.png" style="float:left" />',1,to_date('20/01/06','RR/MM/DD'),0,0);
Insert into BLOG_POST (POST_NO,USER_NO,POST_TITLE,POST_CON,POST_CATE,POST_DATE,POST_HIT,DEL_YN) values (16,19,'별것도 아닌거 때문에','<span style="font-size:72px">오류나서... 화가 나네요 ㅎㅎ</span><br />
<span style="color:#e74c3c"><span style="font-size:36px">지금은 고침 나이스~</span></span>',2,to_date('20/01/03','RR/MM/DD'),0,0);
Insert into BLOG_POST (POST_NO,USER_NO,POST_TITLE,POST_CON,POST_CATE,POST_DATE,POST_HIT,DEL_YN) values (17,2,'asdf','asdf',4,to_date('20/01/03','RR/MM/DD'),0,1);
Insert into BLOG_POST (POST_NO,USER_NO,POST_TITLE,POST_CON,POST_CATE,POST_DATE,POST_HIT,DEL_YN) values (1,2,'테스트 글쓰기 1번','내용은 없따',1,to_date('19/12/30','RR/MM/DD'),0,0);
Insert into BLOG_POST (POST_NO,USER_NO,POST_TITLE,POST_CON,POST_CATE,POST_DATE,POST_HIT,DEL_YN) values (2,2,'테스트 글쓰기 2번','내용은 없따',2,to_date('19/12/30','RR/MM/DD'),0,0);
Insert into BLOG_POST (POST_NO,USER_NO,POST_TITLE,POST_CON,POST_CATE,POST_DATE,POST_HIT,DEL_YN) values (3,2,'테스트 글쓰기 3번','내용은 없따',3,to_date('19/12/30','RR/MM/DD'),0,0);
Insert into BLOG_POST (POST_NO,USER_NO,POST_TITLE,POST_CON,POST_CATE,POST_DATE,POST_HIT,DEL_YN) values (4,2,'테스트 글쓰기 4번','내용은 없따',4,to_date('19/12/30','RR/MM/DD'),0,0);
Insert into BLOG_POST (POST_NO,USER_NO,POST_TITLE,POST_CON,POST_CATE,POST_DATE,POST_HIT,DEL_YN) values (5,2,'테스트 글쓰기 5번','내용은 없따',5,to_date('19/12/30','RR/MM/DD'),0,0);
Insert into BLOG_POST (POST_NO,USER_NO,POST_TITLE,POST_CON,POST_CATE,POST_DATE,POST_HIT,DEL_YN) values (6,2,'테스트 글쓰기 6번','내용은 없따',1,to_date('19/12/30','RR/MM/DD'),0,0);
Insert into BLOG_POST (POST_NO,USER_NO,POST_TITLE,POST_CON,POST_CATE,POST_DATE,POST_HIT,DEL_YN) values (7,2,'테스트 글쓰기 입니다. 확인확인','내용도 최대한 길게 많이 작성바랍니다아아아아아아아아아아아아아아아아아아앙아아아아아아아아아아아아아',3,to_date('19/12/30','RR/MM/DD'),0,0);
Insert into BLOG_POST (POST_NO,USER_NO,POST_TITLE,POST_CON,POST_CATE,POST_DATE,POST_HIT,DEL_YN) values (15,19,'Hello World!!','<span style="font-size:22px"><span style="color:#3498db">System</span>.<span style="color:#3498db">out</span>.<span style="color:#f39c12">println</span>(&quot;Hello World!!&quot;);</span>',1,to_date('20/01/03','RR/MM/DD'),0,0);
Insert into BLOG_POST (POST_NO,USER_NO,POST_TITLE,POST_CON,POST_CATE,POST_DATE,POST_HIT,DEL_YN) values (20,21,'ㅁㄴㅇㄹ','ㅁㄴㅇㄹ',2,to_date('20/01/06','RR/MM/DD'),0,0);
Insert into BLOG_POST (POST_NO,USER_NO,POST_TITLE,POST_CON,POST_CATE,POST_DATE,POST_HIT,DEL_YN) values (12,20,'ㅁㄴㅇㄹ','1234',2,to_date('19/12/31','RR/MM/DD'),0,0);
Insert into BLOG_POST (POST_NO,USER_NO,POST_TITLE,POST_CON,POST_CATE,POST_DATE,POST_HIT,DEL_YN) values (13,20,'aaaaa','aaaaaaa',1,to_date('19/12/31','RR/MM/DD'),0,0);
Insert into BLOG_POST (POST_NO,USER_NO,POST_TITLE,POST_CON,POST_CATE,POST_DATE,POST_HIT,DEL_YN) values (14,16,'회원 탈퇴 확인','탈퇴 및 글 리스트 전부 종속삭제',1,to_date('20/01/02','RR/MM/DD'),0,0);
Insert into BLOG_POST (POST_NO,USER_NO,POST_TITLE,POST_CON,POST_CATE,POST_DATE,POST_HIT,DEL_YN) values (18,2,'글 작성작성','작성 테스트',3,to_date('20/01/06','RR/MM/DD'),0,0);
REM INSERTING into BLOG_PROP
SET DEFINE OFF;
Insert into BLOG_PROP (PROP_NO,USER_NO,BLOG_NAME,PROP_COMMENT,DEL_YN,MENU1,MENU2,MENU3,MENU4,MENU5) values (19,20,'내 블로그','내 블로그입니다',1,'Hi',null,null,null,null);
Insert into BLOG_PROP (PROP_NO,USER_NO,BLOG_NAME,PROP_COMMENT,DEL_YN,MENU1,MENU2,MENU3,MENU4,MENU5) values (18,19,'hyeho''s BLOG','OKOKOK',1,'Java','HTML/CSS',null,null,null);
Insert into BLOG_PROP (PROP_NO,USER_NO,BLOG_NAME,PROP_COMMENT,DEL_YN,MENU1,MENU2,MENU3,MENU4,MENU5) values (1,1,'ADMIN','This blog is Admin''s Blog.',1,'Hello','I am','Admin',null,null);
Insert into BLOG_PROP (PROP_NO,USER_NO,BLOG_NAME,PROP_COMMENT,DEL_YN,MENU1,MENU2,MENU3,MENU4,MENU5) values (2,2,'HAHAHAHAHA','ㅋㅋ루ㅋㅋ',1,'메뉴1','TEST MENU2','TEST MENU3','TEST MENU4','TEST MENU5');
Insert into BLOG_PROP (PROP_NO,USER_NO,BLOG_NAME,PROP_COMMENT,DEL_YN,MENU1,MENU2,MENU3,MENU4,MENU5) values (20,21,'블로그 생성','1234',1,'ㅁㄴㅇㄹ',null,null,null,null);
Insert into BLOG_PROP (PROP_NO,USER_NO,BLOG_NAME,PROP_COMMENT,DEL_YN,MENU1,MENU2,MENU3,MENU4,MENU5) values (3,8,'zzfnzz','zzzzasf',1,'asdf','qwer','zxcv','tyui','ghjk');
Insert into BLOG_PROP (PROP_NO,USER_NO,BLOG_NAME,PROP_COMMENT,DEL_YN,MENU1,MENU2,MENU3,MENU4,MENU5) values (4,6,'블로그 생성 테스트','제발 한번에 성공좀 해라',1,'조오치','제발','킈재야','힘을줘','null');
Insert into BLOG_PROP (PROP_NO,USER_NO,BLOG_NAME,PROP_COMMENT,DEL_YN,MENU1,MENU2,MENU3,MENU4,MENU5) values (5,3,'asdf''s blog','박킈재님 빨리 개발좀 하세요;;',1,'일번','이번','삼번','사번',null);
Insert into BLOG_PROP (PROP_NO,USER_NO,BLOG_NAME,PROP_COMMENT,DEL_YN,MENU1,MENU2,MENU3,MENU4,MENU5) values (6,4,'AAAA''s Blog','Welcome!!!',1,'a','b','c','d',null);
Insert into BLOG_PROP (PROP_NO,USER_NO,BLOG_NAME,PROP_COMMENT,DEL_YN,MENU1,MENU2,MENU3,MENU4,MENU5) values (7,7,'12345678910','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',1,'AAAAAAAA','BBBBBBB',null,null,null);
Insert into BLOG_PROP (PROP_NO,USER_NO,BLOG_NAME,PROP_COMMENT,DEL_YN,MENU1,MENU2,MENU3,MENU4,MENU5) values (8,9,'wwww','aweaweaweaweaweaweawe',1,null,null,null,null,null);
Insert into BLOG_PROP (PROP_NO,USER_NO,BLOG_NAME,PROP_COMMENT,DEL_YN,MENU1,MENU2,MENU3,MENU4,MENU5) values (9,10,'eeee','123412341234',1,null,null,null,null,null);
Insert into BLOG_PROP (PROP_NO,USER_NO,BLOG_NAME,PROP_COMMENT,DEL_YN,MENU1,MENU2,MENU3,MENU4,MENU5) values (10,11,'rrrr','123412341234',1,null,null,null,null,null);
Insert into BLOG_PROP (PROP_NO,USER_NO,BLOG_NAME,PROP_COMMENT,DEL_YN,MENU1,MENU2,MENU3,MENU4,MENU5) values (11,12,'ssss','ssssssssssssssssss',1,null,null,null,null,null);
Insert into BLOG_PROP (PROP_NO,USER_NO,BLOG_NAME,PROP_COMMENT,DEL_YN,MENU1,MENU2,MENU3,MENU4,MENU5) values (12,13,'dddd','123412341234',1,null,null,null,null,null);
Insert into BLOG_PROP (PROP_NO,USER_NO,BLOG_NAME,PROP_COMMENT,DEL_YN,MENU1,MENU2,MENU3,MENU4,MENU5) values (13,14,'ffff','12341234',1,null,null,null,null,null);
Insert into BLOG_PROP (PROP_NO,USER_NO,BLOG_NAME,PROP_COMMENT,DEL_YN,MENU1,MENU2,MENU3,MENU4,MENU5) values (14,15,'zzzz','12341234',1,null,null,null,null,null);
Insert into BLOG_PROP (PROP_NO,USER_NO,BLOG_NAME,PROP_COMMENT,DEL_YN,MENU1,MENU2,MENU3,MENU4,MENU5) values (15,16,'xxxx','12341234',1,'1234',null,null,null,null);
Insert into BLOG_PROP (PROP_NO,USER_NO,BLOG_NAME,PROP_COMMENT,DEL_YN,MENU1,MENU2,MENU3,MENU4,MENU5) values (16,17,'cccc','12341234',1,null,null,null,null,null);
Insert into BLOG_PROP (PROP_NO,USER_NO,BLOG_NAME,PROP_COMMENT,DEL_YN,MENU1,MENU2,MENU3,MENU4,MENU5) values (17,18,'최초 설정','킈재야 일좀해라;;',1,'킈킈','킈킈킈','킈킈킈킈',null,null);
REM INSERTING into BLOG_USER
SET DEFINE OFF;
Insert into BLOG_USER (USER_NO,USER_ID,USER_PW,USER_EMAIL,USER_FB_ADD,USER_INSTA_ADD,USER_GIT_ADD,USER_DEL_YN,USER_DATE,BLOG_EDIT) values (20,'uuuu','m/RvEY2EIPPWJOafzDHF3Q==',null,null,null,null,1,to_date('19/12/31','RR/MM/DD'),1);
Insert into BLOG_USER (USER_NO,USER_ID,USER_PW,USER_EMAIL,USER_FB_ADD,USER_INSTA_ADD,USER_GIT_ADD,USER_DEL_YN,USER_DATE,BLOG_EDIT) values (6,'qwer','m/RvEY2EIPPWJOafzDHF3Q==','@@','..','aa',null,1,to_date('19/12/20','RR/MM/DD'),1);
Insert into BLOG_USER (USER_NO,USER_ID,USER_PW,USER_EMAIL,USER_FB_ADD,USER_INSTA_ADD,USER_GIT_ADD,USER_DEL_YN,USER_DATE,BLOG_EDIT) values (7,'1234','m/RvEY2EIPPWJOafzDHF3Q==','1234@1234','1234.com',null,null,1,to_date('19/12/20','RR/MM/DD'),1);
Insert into BLOG_USER (USER_NO,USER_ID,USER_PW,USER_EMAIL,USER_FB_ADD,USER_INSTA_ADD,USER_GIT_ADD,USER_DEL_YN,USER_DATE,BLOG_EDIT) values (19,'hyeho','m/RvEY2EIPPWJOafzDHF3Q==','hyeho331@gmail.com',null,null,null,1,to_date('19/12/30','RR/MM/DD'),1);
Insert into BLOG_USER (USER_NO,USER_ID,USER_PW,USER_EMAIL,USER_FB_ADD,USER_INSTA_ADD,USER_GIT_ADD,USER_DEL_YN,USER_DATE,BLOG_EDIT) values (1,'admin','m/RvEY2EIPPWJOafzDHF3Q==',null,null,null,null,1,to_date('19/12/18','RR/MM/DD'),1);
Insert into BLOG_USER (USER_NO,USER_ID,USER_PW,USER_EMAIL,USER_FB_ADD,USER_INSTA_ADD,USER_GIT_ADD,USER_DEL_YN,USER_DATE,BLOG_EDIT) values (21,'qqqq','m/RvEY2EIPPWJOafzDHF3Q==','asdf',null,null,null,0,to_date('20/01/06','RR/MM/DD'),1);
Insert into BLOG_USER (USER_NO,USER_ID,USER_PW,USER_EMAIL,USER_FB_ADD,USER_INSTA_ADD,USER_GIT_ADD,USER_DEL_YN,USER_DATE,BLOG_EDIT) values (2,'test','m/RvEY2EIPPWJOafzDHF3Q==','12341234',null,null,null,1,to_date('19/12/18','RR/MM/DD'),1);
Insert into BLOG_USER (USER_NO,USER_ID,USER_PW,USER_EMAIL,USER_FB_ADD,USER_INSTA_ADD,USER_GIT_ADD,USER_DEL_YN,USER_DATE,BLOG_EDIT) values (3,'asdf','m/RvEY2EIPPWJOafzDHF3Q==',null,null,null,null,1,to_date('19/12/20','RR/MM/DD'),1);
Insert into BLOG_USER (USER_NO,USER_ID,USER_PW,USER_EMAIL,USER_FB_ADD,USER_INSTA_ADD,USER_GIT_ADD,USER_DEL_YN,USER_DATE,BLOG_EDIT) values (4,'aaaa','m/RvEY2EIPPWJOafzDHF3Q==','asdf','asdf','asdf',null,1,to_date('19/12/20','RR/MM/DD'),1);
Insert into BLOG_USER (USER_NO,USER_ID,USER_PW,USER_EMAIL,USER_FB_ADD,USER_INSTA_ADD,USER_GIT_ADD,USER_DEL_YN,USER_DATE,BLOG_EDIT) values (8,'zxcv','m/RvEY2EIPPWJOafzDHF3Q==','test@gmail.com','aaaa.cc','asdf.asdf','qwer.qwer',1,to_date('19/12/20','RR/MM/DD'),1);
Insert into BLOG_USER (USER_NO,USER_ID,USER_PW,USER_EMAIL,USER_FB_ADD,USER_INSTA_ADD,USER_GIT_ADD,USER_DEL_YN,USER_DATE,BLOG_EDIT) values (9,'wwww','m/RvEY2EIPPWJOafzDHF3Q==',null,null,null,null,1,to_date('19/12/27','RR/MM/DD'),1);
Insert into BLOG_USER (USER_NO,USER_ID,USER_PW,USER_EMAIL,USER_FB_ADD,USER_INSTA_ADD,USER_GIT_ADD,USER_DEL_YN,USER_DATE,BLOG_EDIT) values (10,'eeee','m/RvEY2EIPPWJOafzDHF3Q==',null,null,null,null,1,to_date('19/12/27','RR/MM/DD'),1);
Insert into BLOG_USER (USER_NO,USER_ID,USER_PW,USER_EMAIL,USER_FB_ADD,USER_INSTA_ADD,USER_GIT_ADD,USER_DEL_YN,USER_DATE,BLOG_EDIT) values (11,'rrrr','m/RvEY2EIPPWJOafzDHF3Q==',null,null,null,null,0,to_date('19/12/27','RR/MM/DD'),1);
Insert into BLOG_USER (USER_NO,USER_ID,USER_PW,USER_EMAIL,USER_FB_ADD,USER_INSTA_ADD,USER_GIT_ADD,USER_DEL_YN,USER_DATE,BLOG_EDIT) values (12,'ssss','m/RvEY2EIPPWJOafzDHF3Q==',null,null,null,null,1,to_date('19/12/27','RR/MM/DD'),1);
Insert into BLOG_USER (USER_NO,USER_ID,USER_PW,USER_EMAIL,USER_FB_ADD,USER_INSTA_ADD,USER_GIT_ADD,USER_DEL_YN,USER_DATE,BLOG_EDIT) values (13,'dddd','m/RvEY2EIPPWJOafzDHF3Q==',null,null,null,null,1,to_date('19/12/27','RR/MM/DD'),1);
Insert into BLOG_USER (USER_NO,USER_ID,USER_PW,USER_EMAIL,USER_FB_ADD,USER_INSTA_ADD,USER_GIT_ADD,USER_DEL_YN,USER_DATE,BLOG_EDIT) values (14,'ffff','m/RvEY2EIPPWJOafzDHF3Q==',null,null,null,null,1,to_date('19/12/27','RR/MM/DD'),1);
Insert into BLOG_USER (USER_NO,USER_ID,USER_PW,USER_EMAIL,USER_FB_ADD,USER_INSTA_ADD,USER_GIT_ADD,USER_DEL_YN,USER_DATE,BLOG_EDIT) values (15,'zzzz','m/RvEY2EIPPWJOafzDHF3Q==',null,null,null,null,1,to_date('19/12/27','RR/MM/DD'),1);
Insert into BLOG_USER (USER_NO,USER_ID,USER_PW,USER_EMAIL,USER_FB_ADD,USER_INSTA_ADD,USER_GIT_ADD,USER_DEL_YN,USER_DATE,BLOG_EDIT) values (16,'xxxx','m/RvEY2EIPPWJOafzDHF3Q==',null,null,null,null,0,to_date('19/12/27','RR/MM/DD'),1);
Insert into BLOG_USER (USER_NO,USER_ID,USER_PW,USER_EMAIL,USER_FB_ADD,USER_INSTA_ADD,USER_GIT_ADD,USER_DEL_YN,USER_DATE,BLOG_EDIT) values (17,'cccc','m/RvEY2EIPPWJOafzDHF3Q==',null,null,null,null,1,to_date('19/12/27','RR/MM/DD'),1);
Insert into BLOG_USER (USER_NO,USER_ID,USER_PW,USER_EMAIL,USER_FB_ADD,USER_INSTA_ADD,USER_GIT_ADD,USER_DEL_YN,USER_DATE,BLOG_EDIT) values (18,'gggg','m/RvEY2EIPPWJOafzDHF3Q==',null,null,null,null,1,to_date('19/12/27','RR/MM/DD'),1);
REM INSERTING into POST_COMM
SET DEFINE OFF;
Insert into POST_COMM (COMM_NO,POST_NO,USER_NO,COMM_CON,COMM_DATE,DEL_YN) values (1,9,2,'댓글 내용 가져오기 테스트용 댓글',to_date('20/01/02','RR/MM/DD'),1);
Insert into POST_COMM (COMM_NO,POST_NO,USER_NO,COMM_CON,COMM_DATE,DEL_YN) values (2,9,2,'댓글 내용 가져오기 테스트용 댓글',to_date('20/01/02','RR/MM/DD'),1);
Insert into POST_COMM (COMM_NO,POST_NO,USER_NO,COMM_CON,COMM_DATE,DEL_YN) values (3,9,2,'댓글 내용 가져오기 테스트용 댓글',to_date('20/01/02','RR/MM/DD'),1);
Insert into POST_COMM (COMM_NO,POST_NO,USER_NO,COMM_CON,COMM_DATE,DEL_YN) values (4,9,2,'댓글 내용 가져오기 테스트!!!',to_date('20/01/02','RR/MM/DD'),0);
Insert into POST_COMM (COMM_NO,POST_NO,USER_NO,COMM_CON,COMM_DATE,DEL_YN) values (5,9,1,'댓글 추가',to_date('20/01/02','RR/MM/DD'),1);
Insert into POST_COMM (COMM_NO,POST_NO,USER_NO,COMM_CON,COMM_DATE,DEL_YN) values (6,7,1,'엄청난 댓글 추가 후후',to_date('20/01/02','RR/MM/DD'),1);
Insert into POST_COMM (COMM_NO,POST_NO,USER_NO,COMM_CON,COMM_DATE,DEL_YN) values (7,9,1,'추추가가',to_date('20/01/02','RR/MM/DD'),1);
Insert into POST_COMM (COMM_NO,POST_NO,USER_NO,COMM_CON,COMM_DATE,DEL_YN) values (19,18,2,'RUN',to_date('20/01/06','RR/MM/DD'),1);
Insert into POST_COMM (COMM_NO,POST_NO,USER_NO,COMM_CON,COMM_DATE,DEL_YN) values (8,9,1,'삭제 테스트용',to_date('20/01/02','RR/MM/DD'),0);
Insert into POST_COMM (COMM_NO,POST_NO,USER_NO,COMM_CON,COMM_DATE,DEL_YN) values (9,9,1,'댓글 삭제용',to_date('20/01/02','RR/MM/DD'),0);
Insert into POST_COMM (COMM_NO,POST_NO,USER_NO,COMM_CON,COMM_DATE,DEL_YN) values (10,6,1,'조용히 하세요',to_date('20/01/02','RR/MM/DD'),1);
Insert into POST_COMM (COMM_NO,POST_NO,USER_NO,COMM_CON,COMM_DATE,DEL_YN) values (13,15,19,'작성작성',to_date('20/01/03','RR/MM/DD'),1);
Insert into POST_COMM (COMM_NO,POST_NO,USER_NO,COMM_CON,COMM_DATE,DEL_YN) values (14,9,19,'대에에에에에에에에ㅔ에에에에에에에에에에에에에에에에에에에에에에에엣 글',to_date('20/01/03','RR/MM/DD'),0);
Insert into POST_COMM (COMM_NO,POST_NO,USER_NO,COMM_CON,COMM_DATE,DEL_YN) values (16,17,2,'asdf',to_date('20/01/03','RR/MM/DD'),1);
Insert into POST_COMM (COMM_NO,POST_NO,USER_NO,COMM_CON,COMM_DATE,DEL_YN) values (17,17,2,'Hi!',to_date('20/01/03','RR/MM/DD'),1);
Insert into POST_COMM (COMM_NO,POST_NO,USER_NO,COMM_CON,COMM_DATE,DEL_YN) values (11,15,19,'좋은 글이네요',to_date('20/01/03','RR/MM/DD'),1);
Insert into POST_COMM (COMM_NO,POST_NO,USER_NO,COMM_CON,COMM_DATE,DEL_YN) values (12,15,2,'aaaaaaaaaaaaaa',to_date('20/01/03','RR/MM/DD'),0);
Insert into POST_COMM (COMM_NO,POST_NO,USER_NO,COMM_CON,COMM_DATE,DEL_YN) values (15,7,2,'ASDF',to_date('20/01/03','RR/MM/DD'),1);
Insert into POST_COMM (COMM_NO,POST_NO,USER_NO,COMM_CON,COMM_DATE,DEL_YN) values (20,19,2,'ㅁㄴㅇㄹ',to_date('20/01/06','RR/MM/DD'),0);
Insert into POST_COMM (COMM_NO,POST_NO,USER_NO,COMM_CON,COMM_DATE,DEL_YN) values (18,17,2,'ㅁㄴㅇㄹ
ㅁㄴㅇㄹ
ㅁㄴㅇㄹ
ㅁㄴㅇㄹ',to_date('20/01/06','RR/MM/DD'),1);
--------------------------------------------------------
--  DDL for Index BLOG_POST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_POST_PK" ON "BLOG_POST" ("POST_NO") 
  ;
--------------------------------------------------------
--  DDL for Index BLOG_PROP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_PROP_PK" ON "BLOG_PROP" ("PROP_NO") 
  ;
--------------------------------------------------------
--  DDL for Index BLOG_USER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_USER_PK" ON "BLOG_USER" ("USER_NO") 
  ;
--------------------------------------------------------
--  DDL for Index POST_COMM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "POST_COMM_PK" ON "POST_COMM" ("COMM_NO") 
  ;
--------------------------------------------------------
--  Constraints for Table BLOG_POST
--------------------------------------------------------

  ALTER TABLE "BLOG_POST" MODIFY ("POST_NO" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POST" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POST" MODIFY ("POST_TITLE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POST" MODIFY ("POST_CON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POST" MODIFY ("POST_CATE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POST" ADD CONSTRAINT "BLOG_POST_PK" PRIMARY KEY ("POST_NO") ENABLE;
  ALTER TABLE "BLOG_POST" MODIFY ("POST_DATE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POST" MODIFY ("POST_HIT" NOT NULL ENABLE);
  ALTER TABLE "BLOG_POST" MODIFY ("DEL_YN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BLOG_PROP
--------------------------------------------------------

  ALTER TABLE "BLOG_PROP" MODIFY ("PROP_NO" NOT NULL ENABLE);
  ALTER TABLE "BLOG_PROP" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "BLOG_PROP" MODIFY ("BLOG_NAME" NOT NULL ENABLE);
  ALTER TABLE "BLOG_PROP" MODIFY ("PROP_COMMENT" NOT NULL ENABLE);
  ALTER TABLE "BLOG_PROP" ADD CONSTRAINT "BLOG_PROP_PK" PRIMARY KEY ("PROP_NO") ENABLE;
  ALTER TABLE "BLOG_PROP" MODIFY ("DEL_YN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BLOG_USER
--------------------------------------------------------

  ALTER TABLE "BLOG_USER" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "BLOG_USER" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "BLOG_USER" MODIFY ("USER_PW" NOT NULL ENABLE);
  ALTER TABLE "BLOG_USER" MODIFY ("USER_DEL_YN" NOT NULL ENABLE);
  ALTER TABLE "BLOG_USER" MODIFY ("USER_DATE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_USER" ADD CONSTRAINT "BLOG_USER_PK" PRIMARY KEY ("USER_NO") ENABLE;
  ALTER TABLE "BLOG_USER" MODIFY ("BLOG_EDIT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table POST_COMM
--------------------------------------------------------

  ALTER TABLE "POST_COMM" MODIFY ("COMM_NO" NOT NULL ENABLE);
  ALTER TABLE "POST_COMM" MODIFY ("POST_NO" NOT NULL ENABLE);
  ALTER TABLE "POST_COMM" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "POST_COMM" MODIFY ("COMM_CON" NOT NULL ENABLE);
  ALTER TABLE "POST_COMM" MODIFY ("COMM_DATE" NOT NULL ENABLE);
  ALTER TABLE "POST_COMM" MODIFY ("DEL_YN" NOT NULL ENABLE);
  ALTER TABLE "POST_COMM" ADD CONSTRAINT "POST_COMM_PK" PRIMARY KEY ("COMM_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BLOG_POST
--------------------------------------------------------

  ALTER TABLE "BLOG_POST" ADD CONSTRAINT "BLOG_POST_FK1" FOREIGN KEY ("USER_NO")
	  REFERENCES "BLOG_USER" ("USER_NO") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BLOG_PROP
--------------------------------------------------------

  ALTER TABLE "BLOG_PROP" ADD CONSTRAINT "BLOG_PROP_FK1" FOREIGN KEY ("USER_NO")
	  REFERENCES "BLOG_USER" ("USER_NO") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table POST_COMM
--------------------------------------------------------

  ALTER TABLE "POST_COMM" ADD CONSTRAINT "POST_COMM_FK1" FOREIGN KEY ("POST_NO")
	  REFERENCES "BLOG_POST" ("POST_NO") ENABLE;
  ALTER TABLE "POST_COMM" ADD CONSTRAINT "POST_COMM_FK2" FOREIGN KEY ("USER_NO")
	  REFERENCES "BLOG_USER" ("USER_NO") ON DELETE CASCADE ENABLE;
