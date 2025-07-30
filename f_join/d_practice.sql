# korea_db에서 구매 금액 (amount)가 가장 높은 회원의
# member_id), name, 총 구매 금액을 조회

select
	M.member_id, M.name, SUM(P.amount) as total_amount
from
	`members` M
    Join `purchases` P
    ON M.member_id = P.member_id
GROUP BY
	M.member_id
LIMIT 1;


## baseball_league 사용 예제 (JOIN)
use baseball_league;

select * from `players`;
select * from `teams`;

# 1. 내부 조인
# : 타자인 선수와 해당 선수가 속한 팀 이름 가져오기
# - players 테이블(선수 이름)
# - teams 테이블(팀 이름)
SELECT
	P.name, T.name
fROM
	`players` P
    INNER JOIN `teams` T
    ON P.team_id = T.team_id
WHERE
	P.position = '타자';
    
# 2. 1990년 이후 창단된 선수 목록 가져오기
SELECT
	T.name, P.name
FROM
	`teams` T
    JOIN `players` P
    ON T.team_id = P.team_id
WHERE
	T.founded_year >= 1990;
    
# 3. 외부 조인
# 1) 모든 팀과 그 팀에 속한 선수 목록 가져오기
SELECT
	T.name team_name, P.name player_name
FROM
	`teams` T
    LEFT JOIN `players` P
    ON T.team_id = P.team_id;
    
# 2) 모든 선수와 해당 선수가 속한 팀 이름 가져오기
SELECT
	P.name player_name, T.name team_name
FROM
	`players` P
    LEFT JOIN `teams` T
    ON T.team_id = P.team_id;
