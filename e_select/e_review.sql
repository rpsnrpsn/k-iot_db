USE `baseball_league`;
SELECT * FROM `players`;
SELECT * FROM `teams`;

# 1. 1990년 이후에 태어난 선수 목록 가져오기
SELECT * FROM `players`
WHERE 
	year(birth_date) >= 1990;


# 2. 외야수인 선수 중 1995년 이전에 태어난 선수 목록 가져오기
SELECT * FROM `players`
WHERE 
	position = '외야수' and year(birth_date) <= 1995;

# 3. 선수들을 생년월일 순으로 정렬해서 가져오기
SELECT * FROM `players`
ORDER BY
	birth_date;

# 4. 팀별로 창단 연도 순으로 팀 목록 가져오기
SELECT * FROM `teams`
order by
	founded_year;

# 5. 중복을 제거한 팀 이름 목록 가져오기
SELECT DISTINCT name
FROM `teams`;

# 6. 중복을 제거한 포지션 목록 가져오기
SELECT DISTINCT position
from `players`;

# 7. 각 포지션별 선수 수가 2명 이상인 포지션 가져오기
SELECT position, count(*) player_count
FROM `players`
GROUP BY
	position
HAVING
	player_count >= 2; # alias 별칭 값으로 조건 처리 가능 (그룹화 시)