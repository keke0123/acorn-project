
-- acorn_user table
-- acorn_user(id, pwd, nick, name, status, phone, email, orgfilename, filesize, regdate)
INSERT INTO acorn_user values('user1', '12345', '유저1', '유저일', '나는 유저1이다', '010-1274-1337', 'user1@gmail.com', '/resources/images/thumb_image1.png', 100, SYSDATE);
INSERT INTO acorn_user values('user2', '12345', '유저2', '유저이', '나는 유저2이다', '010-4536-2345', 'user2@gmail.com', '/resources/images/thumb_image2.png', 100, SYSDATE);
INSERT INTO acorn_user values('user3', '12345', '유저3', '유저삼', '나는 유저3이다', '010-2363-2321', 'user3@gmail.com', '/resources/images/thumb_image3.png', 100, SYSDATE);
INSERT INTO acorn_user values('user4', '12345', '유저4', '유저사', '나는 유저4이다', '010-8753-1267', 'user4@gmail.com', '/resources/images/thumb_image4.png', 100, SYSDATE);
INSERT INTO acorn_user values('user5', '12345', '유저5', '유저오', '나는 유저5이다', '010-2113-1121', 'user5@gmail.com', '/resources/images/thumb_image5.png', 100, SYSDATE);

-- acorn_board table
-- acorn_board(num_board, id_writer, orgfilename, filesize, content, regdate)
INSERT INTO acorn_board values(1, 'user1', '/resources/images/1.jpg', 100, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur, saepe! Facere delectus aperiam impedit vel temporibus earum et, ipsam soluta qui non dolor veniam assumenda doloribus facilis quidem ab quasi.',  SYSDATE);
INSERT INTO acorn_board values(2, 'user2', '/resources/images/2.jpg', 100, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur, saepe! Facere delectus aperiam impedit vel temporibus earum et, ipsam soluta qui non dolor veniam assumenda doloribus facilis quidem ab quasi.',  SYSDATE);
INSERT INTO acorn_board values(3, 'user2', '/resources/images/3.jpg', 100, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur, saepe! Facere delectus aperiam impedit vel temporibus earum et, ipsam soluta qui non dolor veniam assumenda doloribus facilis quidem ab quasi.',  SYSDATE);
INSERT INTO acorn_board values(4, 'user3', '/resources/images/4.jpg', 100, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur, saepe! Facere delectus aperiam impedit vel temporibus earum et, ipsam soluta qui non dolor veniam assumenda doloribus facilis quidem ab quasi.',  SYSDATE);
INSERT INTO acorn_board values(5, 'user3', '/resources/images/5.jpg', 100, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur, saepe! Facere delectus aperiam impedit vel temporibus earum et, ipsam soluta qui non dolor veniam assumenda doloribus facilis quidem ab quasi.',  SYSDATE);
-- num_board 는 test 를 위해 임의로 숫자를 넣었지만 원래는 num_board_seq.NEXTVAL 넣어야 한다.

-- acorn_comment
-- acorn_comment(num_board, id_writer, content, id_target, ref_group, comment_group, deleted, regdate)
-- 1번 board 에 달린 코멘트
INSERT INTO acorn_comment values(1, 'user1', '나 오늘 사진빨 잘받는듯', 'user1', 101, 101, 'n', SYSDATE);
INSERT INTO acorn_comment values(1, 'user2', 'ㅇㅈ', 'user1', 102, 101, 'n', SYSDATE);
INSERT INTO acorn_comment values(1, 'user3', '어딜 봐서 ㅇㅈ 이지?', 'user2', 103, 101, 'n', SYSDATE);
INSERT INTO acorn_comment values(1, 'user3', '저거 다 사진빨이다', 'user1', 104, 104, 'n', SYSDATE);
INSERT INTO acorn_comment values(1, 'user4', '알지 ㅋㅋㅋ', 'user1', 105, 104, 'n', SYSDATE);
INSERT INTO acorn_comment values(1, 'user1', '어이없네ㅋㅋㅋ', 'user1', 106, 106, 'n', SYSDATE);
INSERT INTO acorn_comment values(1, 'user5', '북마크 했어요', 'user1', 107, 107, 'n', SYSDATE);
-- ref_group 도 역시 test 를 위해 임의로 숫자를 넣었지만 원래는 num_board_seq.NEXTVAL 넣어야 한다.

-- acorn_follow
-- acorn_follow(id_follow, id_follower, regdate)
INSERT INTO acorn_follow values('user1', 'user2', SYSDATE);
INSERT INTO acorn_follow values('user1', 'user3', SYSDATE);
INSERT INTO acorn_follow values('user1', 'user4', SYSDATE);
INSERT INTO acorn_follow values('user2', 'user1', SYSDATE);
INSERT INTO acorn_follow values('user2', 'user4', SYSDATE);
INSERT INTO acorn_follow values('user2', 'user5', SYSDATE);
INSERT INTO acorn_follow values('user3', 'user1', SYSDATE);
INSERT INTO acorn_follow values('user5', 'user4', SYSDATE);

-- acorn_tag
-- acorn_tag(num_board, tag)
INSERT INTO acorn_tag values(1,'브런치');
INSERT INTO acorn_tag values(1,'유럽');
INSERT INTO acorn_tag values(1,'현대도시여성');
INSERT INTO acorn_tag values(2,'커피');
INSERT INTO acorn_tag values(2,'유럽');
INSERT INTO acorn_tag values(2,'여유');
INSERT INTO acorn_tag values(3,'카메라');
INSERT INTO acorn_tag values(3,'유럽');

-- acorn_like
-- acorn_like(num_board, id_like)
INSERT INTO acorn_like values(1, 'user1');
INSERT INTO acorn_like values(1, 'user2');
INSERT INTO acorn_like values(1, 'user5');
INSERT INTO acorn_like values(101, 'user2');
INSERT INTO acorn_like values(101, 'user5');
INSERT INTO acorn_like values(107, 'user1');

-- acorn_bookmark
-- acorn_bookmark(num_board, id_bookmark, regdate)
INSERT INTO acorn_bookmark values(1, 'user2', SYSDATE);
INSERT INTO acorn_bookmark values(1, 'user5', SYSDATE);
INSERT INTO acorn_bookmark values(2, 'user1', SYSDATE);
INSERT INTO acorn_bookmark values(3, 'user1', SYSDATE);
INSERT INTO acorn_bookmark values(5, 'user1', SYSDATE);


