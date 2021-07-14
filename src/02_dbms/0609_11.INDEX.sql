--[ⅩⅠ] 인덱스 : '주키가 아닌' 필드 중심으로 질의(특히 조회)를 많이하는 경우 조회속도 향상.
SELECT * FROM USER_INDEXES ;    -- 'SCOTT'계정이 소유한 인덱스 정보
DROP TABLE EMP01;
CREATE TABLE EMP01
    AS
    SELECT * FROM EMP;  -- 서브쿼리...
INSERT INTO EMP01 SELECT * FROM EMP01;
INSERT INTO EMP01 (EMPNO, ENAME, DEPTNO) VALUES (1111, 'HONG', 40);
INSERT INTO EMP01 SELECT * FROM EMP01;
SELECT TO_CHAR(COUNT(*), '9,999,999') FROM EMP01;
-- 인덱스 생성 전 조회속도
SELECT * FROM EMP01 WHERE ENAME = 'HONG';   -- 0.074초
CREATE INDEX IDX_EMP01_ENAME ON EMP01(ENAME);   -- 인덱스 생성에 17.29초
-- 인덱스 생성 후 조회속도    -- 0.025초
SELECT * FROM EMP01 WHERE ENAME = 'HONG';
SELECT * FROM USER_INDEXES WHERE INDEX_NAME = 'IDX_EMP01_ENAME';
DROP INDEX IDX_EMP01_ENAME;
SELECT * FROM EMP01 WHERE ENAME = 'HONG';   -- 0.078초

select * from all;
