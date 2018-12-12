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