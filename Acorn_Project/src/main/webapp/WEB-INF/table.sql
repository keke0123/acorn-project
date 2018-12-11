CREATE TABLE acorn_board(
	num_board NUMBER PRIMARY KEY,
	id_writer VARCHAR2(100) NOT NULL,
	tag VARCHAR2(100),
	orgfilename VARCHAR2(100) NOT NULL,
	filesize NUMBER NOT NULL,
	content CLOB,
	regdate DATE
)
