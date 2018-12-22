		/* acorn_user 테이블에 dummy 데이터 넣어봄. */
		INSERT INTO acorn_user
			(id , pwd , nick , name , status , 
			    phone , email ,orgfilename,filesize,regdate )
		VALUES('ksgisong','2222','wallabe','송근철','2','010-2222-2222',
        	'sanctim@google.net','c:\asdfasdf\asdf\dsfa.jpg','300',TO_CHAR(SYSDATE, 'YYYYMMDD'));