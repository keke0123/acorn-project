ALTER TABLE acorn_user
MODIFY(
	phone VARCHAR2(100) NULL,
	email VARCHAR2(100) NULL,
	orgfilename VARCHAR2(100) NULL,
	filesize NUMBER NULL
);

--
ALTER TABLE acorn_board
DROP COLUMN tag;

ALTER TABLE acorn_follow
ADD(regdate DATE);

ALTER TABLE acorn_bookmark
ADD(regdate DATE);

--
ALTER TABLE acorn_board
DROP primary key;

ALTER TABLE acorn_comment
DROP primary key;

----------------------------
-- 사진 여러개를 한 게시물에 올릴수 있게 하기 위해 사진파일의 테이블을 새로 만들기로 함
ALTER TABLE acorn_board DROP COLUMN orgfilename;
ALTER TABLE acorn_board DROP COLUMN filesize;
-- 사진을 저장할 테이블
CREATE TABLE acorn_picture(
	num_board NUMBER NOT NULL, -- 게시판 번호
	orgfilename VARCHAR2(100) NOT NULL, -- 저장된 파일명
	filesize NUMBER NOT NULL -- 파일사이즈
);

-------------------------------
-- google uid 값을 저장할 컬럼 추가
ALTER TABLE acorn_user add(google_id VARCHAR2(100));
