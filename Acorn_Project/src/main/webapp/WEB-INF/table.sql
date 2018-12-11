CREATE TABLE acorn_user(
	id VARCHAR2(100) PRIMARY KEY, -- 아이디
	pwd VARCHAR2(100) NOT NULL, -- 비번
	nick VARCHAR2(100) NOT NULL, -- 닉네임
	name VARCHAR2(100) NOT NULL, -- 이름
	status VARCHAR2(100), -- 상태글
	phone VARCHAR2(100)NOT NULL, -- 전화번호
	email VARCHAR2(100) NOT NULL, -- 이메일
	orgfilename VARCHAR2(100) NOT NULL, -- 썸네일 사진 파일명
	filesize NUMBER NOT NULL, -- 파일사이즈
	regdate DATE -- 등록일
)

CREATE TABLE acorn_board(
	num_board NUMBER PRIMARY KEY, -- 게시물 번호
	id_writer VARCHAR2(100) NOT NULL, -- 작성자 아이디
	tag VARCHAR2(100), -- 해쉬태그
	orgfilename VARCHAR2(100) NOT NULL, -- 저장된 파일명
	filesize NUMBER NOT NULL, -- 파일사이즈
	content CLOB, -- 글내용
	regdate DATE -- 등록날짜
)

CREATE TABLE acorn_comment(
	num_board NUMBER PRIMARY KEY, -- 게시글 고유번호
	id_writer VARCHAR2(100) NOT NULL, -- 작성자 아이디
	content CLOB, -- 글내용
	id_target VARCHAR2(100) NOT NULL, -- 타겟 아이디
	ref_group NUMBER NOT NULL, -- 댓글 번호
	comment_group NUMBER NOT NULL, -- 댓글 그룹 번호
	deleted VARCHAR2(1), -- 삭제여부
	regdate DATE -- 등록날짜
)

CREATE SEQUENCE num_board_seq; -- num_board 와 ref_group 에 사용

CREATE TABLE acorn_follow(
	id_follow VARCHAR2(100), -- 팔로우 당한사람 아이디
	id_follower VARCHAR2(100) -- 팔로우 하는사람 아이디
)

CREATE TABLE acorn_tag(
	num_board VARCHAR2(100), -- 게시물 번호
	tag VARCHAR2(100) -- 해쉬태그
)

CREATE TABLE acorn_like(
	num_board VARCHAR2(100), -- 게시물 번호
	id_like VARCHAR2(100) -- 좋아요 한 사람 아이디
)

CREATE TABLE acorn_bookmark(
	num_board NUMBER, -- 게시물 번호
	id_bookmark VARCHAR2(100) -- 북마크한 사람 아이디
)
