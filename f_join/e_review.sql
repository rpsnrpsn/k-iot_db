use `korea_db`;

# 1) from + join
# : 회원 + 구매내역이 합쳐진 하나의 가상 테이블 생성(구매 정보가 있는 회원만 조회)
select *
from `members` M
	join `purchases` P
    on M.member_id = P.member_id;
    
# 2) from + join + where
# : 조인된 결과에서 여성 회원들만 필터링
# - where은 그룹핑 전에 작동, 개별 행(row)에 대해 조건 적용
select *
from `members` M
	join `purchases` P
    on M.member_id = P.member_id
where
	M.gender = 'Female';
    
# 3) from + join + where (+ group by)
# : 필터링된 여성 회원 데이터를 지역 코드를 기준으로 그룹화
select 
	M.area_code '지역 코드', sum(P.amount) '총 판매금액', count(distinct M.member_id) '회원 수'
from `members` M
	join `purchases` P
    on M.member_id = P.member_id
where
	M.gender = 'Female'
group by
	M.area_code;
    
# 4) 남은 데이터에서 having 조건 부여 (그룹화 된 데이터에 조건식 사용)
select 
	M.area_code '지역 코드', sum(P.amount) '총 판매금액', count(distinct M.member_id) '회원 수'
from `members` M
	join `purchases` P
    on M.member_id = P.member_id
where
	M.gender = 'Female'
group by
	M.area_code
having
	sum(P.amount) >= 30000;
    
# + 추가 조건 order by, limit
select 
	M.area_code '지역 코드', sum(P.amount) '총 판매금액', count(distinct M.member_id) '회원 수'
from `members` M
	join `purchases` P
    on M.member_id = P.member_id
where
	M.gender = 'male'
group by
	M.area_code
having
	sum(P.amount) >= 30000
order by
	sum(P.amount) desc
limit 3;

    
