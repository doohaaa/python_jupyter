select EMP_NAME ����̸�, ORG_CD �Ҽ�, position ����, SALARY ����
from cslee.tb_emp 
where position ='�븮'

select now();

select now(), now()::date-'1 day' ::interval;

show timezone;

select current_date, current_time, timeofday();

select now(), current_timestamp, timestamp 'now';

select date_part('year', timestamp '2020-07-03 20:38:40');
select date_part('year', current_timestamp);

select extract('isoyear' from date '2006-01-01');
select extract('isoyear' from current_timestamp);

select date_trunc('year', timestamp '2020-07-30 20:38:40');
select date_trunc('year', curreNt_timestamp);

select date_part('month', timestamp '2020-07-30 20:38:40');
select date_part('month', current_timestamp);

select extract('month' from timestamp '2020-07-30 20:38:40');
select extract('month' from interval '2 years 3 months');
select extract('month' from interval '2years 13 months');

select date_trunc('month', timestamp '2020-07-30 20:38:40');

select date_part('day', timestamp '2020-07-30 20:38:40');
select date_trunc('day', timestamp '2020-07-30 20:38:40');

select date_part('hour', timestamp '2013-07-30 20:38:40');
select date_part('hour', interval '4 hours 3 minutes');
select date_trunc('hour', timestamp '2020-07-30 20:38:40');

select date_part('minute', timestamp '2020-07-30 20:38:40');
select date_trunc('minute', timestamp '2020-07-30 20:38:40');

select date_part('second', timestamp '2013-07-30 20:38:40');
select extract('second' from time '17:12:28.5');
select date_trunc('second', timestamp '2013-07-30 20:38:40');

--���� p154.
select EMP_NAME, to_char((current_timestamp - ENT_DATE),'W') WEEKS
from cslee.tb_emp 
where ORG_CD = '10';

select EMP_NAME, ENT_DATE,
to_CHAR(ENT_DATE, 'yyyy') �Ի��,
to_char(ENT_DATE, 'MM') �Ի��,
to_char(ent_date,'DD') �Ի���
from cslee.tb_emp;

select emp_name, ent_date,
extract('year' from ent_date) �Ի��,
extract('month' from ent_date) �Ի��,
extract('day' from ent_date) �Ի���
from cslee.tb_emp;

select to_date('05 Dec 2000', 'DD Mon YYYY');

select to_number('12,454.8-', '99G999D95');

select to_timestamp('05 Dec 2000', 'DD Mon YYYY');

select cast(123.4 as varchar(10)),
cast('123.5' as numeric),
cast(1234.5678 as dec(6,2)),
cast(current_timestamp as date),
to_char(current_timestamp, 'YYYY-MM-DD HH24:MI:SS'),
to_char(1234.56, 'L9,999.99'),
to_number('$12,345', '$99,999'),
to_date('2014/03/01 21:30:18', 'YYYY-MM-DD HH24:MI:SS'),
to_timestamp('2014/03/01 21:30:18', 'YYYY-MM-DD HH24:MI:SS');

select emp_name,
case when salary > 50000000
then salary 
else 50000000
end as revised_salary
from cslee.tb_emp;

select org_name,
case org_name
when '����1��' then '����'
when '����2��' then '����'
when '����3��' then '����'
when '�濵������' then '����'
else '����'
end as area
from cslee.tb_org;

select emp_name,
case when salary >=90000000 then 'HIGH'
when salary >=60000000 then 'MID'
else 'LOW'
end as salary_grade
from cslee.tb_emp;

select emp_name, salary,
case when salary >=50000000
then 20000000
else(case when salary >=20000000 then 10000000
else salary*0.5 end)
end as bonus
from cslee.tb_emp;

select emp_name, position,
coalesce(position, '����')
from cslee.TB_EMP;

select emp_name, position,
case when position is null then '����'
else position end as ��å
from cslee.TB_EMP;

select coalesce(salary, 0) SAL
from cslee.tb_emp where emp_name='������';

select MAX(salary) SAL
from CSLEE.tb_emp where EMP_NAME='������';

select coalesce(MAX(salary),9999) SAL
from cslee.tb_emp where emp_name='������';

select count(*) "��ü�Ǽ�",
count(position) "��å�Ǽ�",
count(distinct position) "��å����",
max(salary) "�ִ�",
min(salary) "�ּ�",
avg(salary) "���"
from cslee.tb_emp;

select position "��å",
count(*) "�ο���",
min(salary) "�ּ�",
max(salary) "�ִ�",
avg(salary) "���"
from cslee.tb_emp 
group by position;

select org_cd "�μ�",
count(*) "�ο���",
avg(SALARY) "���" 
from CSLEE.tb_emp 
group by org_cd 
having count(*) >=4;

select org_cd "�μ�",
MAX(SALARY) "�ִ�"
from CSLEE.tb_emp 
group by org_cd 
having MIN(salary)<=40000000;

select ORG_CD, position, AVG(SALARY)
from CSLEE.tb_emp te where position in ('����','�븮','���')
group by org_cd ,POSITION;

select org_cd,
avg(case position when '����' then salary end) "����",
avg(case position when '�븮' then salary end) "�븮",
avg(case position when '���' then salary end) "���"
from cslee.tb_emp 
where position in ('����','�븮','���')
group by org_cd;

select org_cd,
sum(coalesce((case position when '����' then 1 else 0 end),0)) "����",
sum(coalesce((case position when '����' then 1 else 0 end),0)) "����",
sum(coalesce((case position when '�븮' then 1 else 0 end),0)) "�븮",
sum(coalesce((case position when '���' then 1 else 0 end),0)) "�ÿ�"
from cslee.tb_emp 
group by org_cd;

select org_cd,
coalesce (sum(case position when '����' then 1 end),0) "����",
coalesce (sum(case position when '����' then 1 end),0) "����",
coalesce (sum(case position when '�븮' then 1 end),0) "�븮",
coalesce (sum(case position when '���' then 1 end),0) "���"
from cslee.tb_emp 
group by org_cd;

select tb_emp.emp_name, tb_emp.org_cd, 
tb_emp.org_cd, tb_org.org_name
from cslee.tb_emp, cslee.tb_org 
where cslee.tb_emp.org_cd = cslee.tb_org.org_cd;

select tb_emp.emp_no,
tb_emp.emp_name,
tb_emp.org_cd,
tb_org.org_name,
tb_emp.position
from cslee.tb_emp,
cslee.tb_org 
where cslee.tb_emp.org_cd = cslee.tb_org.org_cd;

select E.emp_no,
E.EMP_NAME, E.ORG_CD, O.ORG_NAME, E.position
from cslee.tb_emp as E, CSLEE.TB_ORG as O
where E.ORG_CD=O.org_cd and E.position ='����'
order by O.org_name;

select A.ACCNO, C.CUST_NAME, P.PROD_NAME, A.CONT_AMT, E.EMP_NAME
from CSLEE.tb_accnt A, CSLEE.TB_CUST C, cslee.tb_prod P, cslee.TB_EMP E 
where A.cust_no =C.cust_no and A.prod_cd =P.prod_cd 
and A.MANAGER=E.EMP_NO;

select E.EMP_NAME �����, E.SALARY ����, S.GRADE �޿����
from CSLEE.tb_emp E, cslee.TB_GRADE S
where E.SALARY between S.LOW_SAL and S.HIGH_SAL;


select EMP.EMP_NO, EMP.EMP_NAME, ORG.ORG_NAME
from CSLEE.TB_EMP EMP, CSLEE.TB_ORG ORG 
where EMP.ORG_CD = ORG.ORG_CD;

select EMP.EMP_NO, EMP.EMP_NAME, ORG.ORG_NAME
from CSLEE.TB_EMP EMP 
inner join CSLEE.TB_ORG ORG on EMP.ORG_CD = ORG.ORG_CD;

select EMP.EMP_NO, EMP.EMP_NAME, ORG.ORG_NAME
from cslee.TB_EMP EMP 
join cslee.TB_ORG ORG 
on EMP.ORG_CD=ORG.ORG_CD;

select ACC.ACCNO, ACC.CUST_NO, CUST.CUST_NAME
from CSLEE.TB_ACCNT ACC
inner join cslee.TB_CUST CUST 
on (CUST.CUST_NO = ACC.CUST_NO);

select E.EMP_NAME, E.ORG_CD, O.ORG_CD, O.ORG_NAME
from CSLEE.TB_Emp E 
join CSLEE.TB_ORG O 
on (E.ORG_CD = O.org_cd)
where E.ORG_CD ='10';

select A.ACCNO ���¹�ȣ, C.CUST_NAME ����, P.PROD_NAME ��ǰ��, A.CONT_AMT ���ݾ�, E.EMP_NAME ����ڸ�
from CSLEE.TB_ACCNT A, CSLEE.TB_CUST C, CSLEE.TB_PROD P, CSLEE.TB_EMP E 
where  A.cust_no = C.cust_no 
and A.PROD_CD = P.prod_cd 
and A.MANAGER = E.EMP_NO;

select A.ACCNO ���¹�ȣ, C.CUST_NAME ����, P.PROD_NAME ��ǰ��, A.CONT_AMT ����ȣ, E.EMP_NAME ����ڸ�
from CSLEE.TB_ACCNT A 
inner join CSLEE.TB_CUST C on A.CUST_NO = C.cust_no 
inner join CSLEE.TB_PROD P on A.prod_cd = P.PROD_CD 
inner join CSLEE.TB_EMP E on A.manager = E.emp_no;

select COUNT(EMP_NAME) from CSLEE.TB_EMP;
select COUNT(ORG_NAME) from CSLEE.TB_ORG;

select E.EMP_NAME, O.ORG_NAME
from CSLEE.TB_EMP E cross join CSLEE.TB_ORG O 
order by emp_name;

select COUNT(E.EMP_NAME)
from CSLEE.TB_EMP E cross join CSLEE.TB_ORG O;

select E.EMP_NO ���, E.EMP_NAME �����,
E.position ��å, O.ORG_NAME �μ���
from CSLEE.TB_EMP E left outer join CSLEE.TB_ORG O on E.ORG_CD = O.org_cd 
where E.position = '���';


select E.EMP_NO ���, E.EMP_NAME �����,
E.position ��å, O.ORG_NAME �μ���
from CSLEE.TB_EMP E right outer join CSLEE.TB_ORG O on E.ORG_CD = O.org_cd 
where E.position = '���';

select A.ORG_CD, A.ORG_NAME, B.ORG_CD, B.ORG_NAME
from CSLEE.tb_org A full outer join CSLEE.TB_ORG B on A.ORG_CD=B.ORG_CD;

select A.ORG_CD, A.ORG_NAME, B.ORG_CD, B.ORG_NAME 
from CSLEE.TB_ORG A left outer join CSLEE.TB_ORG B 
on A.ORG_CD = B.org_cd union 
select A.org_cd , A.org_name, B.org_cd, B.org_name 
from CSLEE.TB_ORG A right outer join CSLEE.TB_ORG  B 
on A.ORG_CD = B.ORG_CD;