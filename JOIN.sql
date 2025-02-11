-- INNER JOIN(내부조인)
SELECT * FROM INFO;

SELECT * FROM INFO INNER JOIN AUTH ON INFO.AUTH_ID = AUTH.AUTH_ID; -- 붙을 수 없는 데이터는 안나옴

-- 컬럼 지정 - AUTH_ID는 양쪽에 다 있기 때문에, 출렬할 때, 테이블명.컬럼명 으로 지정해야 합니다.
SELECT ID
    , TITLE
    , CONTENT
    , AUTH.AUTH_ID
    , NAME
    , JOB
FROM INFO INNER JOIN AUTH ON INFO.AUTH_ID = AUTH.AUTH_ID;

--테이블 ALIAS
SELECT I.ID,
       I.AUTH_ID,
       A.NAME
FROM INFO I
INNER JOIN AUTH A
ON I.AUTH_ID = A.AUTH_ID;

--USING절 - 양쪽 테이블에 동일 키 이름으로 연결할 때 사용이 가능합니다.
SELECT *
FROM INFO I
INNER JOIN AUTH A
USING (AUTH_ID);
--------------------------------------------------------------------------------
--외부조인이라 부릅니다.
--LEFT OUTER JOIN - 왼쪽 테이블이 기준이 되고, 왼쪽테이블은 다나옴
SELECT *
FROM INFO I
LEFT OUTER JOIN AUTH A
ON I.AUTH_ID = A.AUTH_ID;

--RIGHT OUTER JOIN - 오른쪽 테이블이 기준이 되고, 오른쪽테이블은 다나옴
SELECT *
FROM INFO I
RIGHT OUTER JOIN AUTH A
ON I.AUTH_ID = A.AUTH_ID;

--FULL OUTER JOIN - 양쪽 테이블이 누락없이 다나옴
SELECT *
FROM INFO I
FULL OUTER JOIN AUTH A
ON I.AUTH_ID = A.AUTH_ID;

-- 번외 CROSS조인 - 잘못된 조인의 형태 (오라클에서 "카디시안 프로덕트"라고 부릅니다.)
SELECT *
FROM INFO I
CROSS JOIN AUTH A;
--------------------------------------------------------------------------------
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;

SELECT *
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--조인이 3개 이상도 될까요? -> ㅇㅇ됨

SELECT *
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
LEFT JOIN LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID;
--------------------------------------------------------------------------------
--오라클에서 사용하는 조인 뭄법도 있음.
--조인을 할때 조인의 테이블 FROM에 , 로 나열
--WHERE절에서 조인의 조건을 기술함
SELECT * FROM AUTH;
SELECT * FROM INFO;

--이너조인(내부조인)
SELECT *
FROM INFO I, AUTH A
WHERE I.AUTH_ID = A.AUTH_ID;

--아우터조인(외부조인)
SELECT *
FROM INFO I, AUTH A
WHERE I.AUTH_ID = A.AUTH_ID(+); -- LEFT JOIN

SELECT *
FROM INFO I, AUTH A
WHERE I.AUTH_ID(+) = A.AUTH_ID; -- RIGHT JOIN

-- 오라클에서 FULL OUTER 조인은 없습니다.

-- 크로스조인은 조인 조건을 적지 않으면 됩니다.
SELECT *
FROM INFO I , AUTH A; -- CROSS 조인

