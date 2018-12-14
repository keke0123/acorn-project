-- 송현철 형님 sql 문장
-- keyword를 통해서 nick name id 를 검색후
-- id 값으로 fallow 된 id 값의 count 를 받아온후 join 시켜서 결과값 출력
SELECT a.nick, a.name, a.id, b.count_follow
FROM (
    SELECT id_follow, count(id_follow) AS count_follow
    FROM acorn_follow
    GROUP BY id_follow
    ) b, (
					SELECT nick, name, id
					FROM acorn_user
					WHERE nick LIKE '%유저%' OR name LIKE '%유저%'
					) a
WHERE b.id_follow = a.id;

-- main 페이지 follow 한 사람들의 board 와 board 의 comment 값 시간 순서에 따라 받기(tag 는 따로 받아야 될듯하다)
SELECT b.orgfilename, b.content, b.regdate, b.num_board, b.id_writer, t.tag
FROM (	SELECT b.orgfilename, b.content, b.regdate, b.num_board, b.id_writer
		FROM(
				SELECT id_follow
				FROM acorn_follow
				WHERE id_follower='user1'
			) a, acorn_board b
		WHERE a.id_follow=b.id_writer
	) b, acorn_tag t
WHERE b.num_board = t.num_board
ORDER BY b.regdate;

-- main 페이지 follow 한 사람들의 board 와 board 의 comment 값 시간 순서에 따라 받기
SELECT b.orgfilename, b.content, b.regdate, b.num_board, b.id_writer
FROM(
		SELECT id_follow
		FROM acorn_follow
		WHERE id_follower='user1'
	) a, acorn_board b
WHERE a.id_follow=b.id_writer
ORDER BY b.regdate;
