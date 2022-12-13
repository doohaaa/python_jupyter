--����1: ������ �� ��
select EMP_NAME ����̸�, ORG_CD �Ҽ�, position ����, SALARY ����
from cslee.tb_emp 
where position = '�븮';

--����2: ���� ��
select count(*) from cslee.tb_emp;

select  EMP_NAME ����̸�, ORG_CD �Ҽ�, position ����, salary ����
from cslee.tb_emp;

select emp_name ����̸�, org_cd �Ҽ�, position ����, salary ����
from cslee.tb_emp
where salary >=50000000;

--����3: ������ �켱���� 
select EMP_NAME ����̸�, ORG_CD �Ҽ�, position ��å, salary ����
from cslee.tb_emp
where (ORG_CD = '08' or ORG_CD = '09' or ORG_CD='10')
and position ='���'
and SALARY >= 40000000
and SALARY <= 50000000;

--����4: ������ �켱���� (Between A and B ����)
select EMP_NAME ����̸�, ORG_CD �Ҽ�, position ��å, salary ����
from cslee.tb_emp
where ORG_CD in ('08', '09', '10')
and position ='���' 
and SALARY between 40000000 and 50000000;

select EMP_NAME ����̸�, ORG_CD �Ҽ�, position ��å, salary ����
from cslee.tb_emp
where SALARY between 40000000 and 50000000;


--����5: WHERE ������ -in
select EMP_NAME, ORG_CD, position 
from cslee.tb_emp  
where ORG_CD in ('06','07')
and position in ('����', '����');

select EMP_NAME, ORG_CD, position 
from cslee.tb_emp  
where (ORG_CD,position)
in (('06','����'),('07','����'));


--����6: WHERE ���� -like 

--"��"�� ���� ���� �������� ������ ��ȸ�ϴ� where���� �ۼ��Ѵ�.
select EMP_NAME ����̸�, ORG_CD ���ڵ�, position ��å, ent_date �Ի�����
from cslee.tb_emp 
where emp_name like '��%';

--�̸��� �ι�°�� "��"�� �������� ������ ��ȸ�϶�
select EMP_NAME ����̸�, ORG_CD ���ڵ�, position ��å, ENT_DATE �Ի�����
from cslee.tb_emp 
where emp_name like '_��%';

--����7: where ���� -is notnull 
select EMP_NAME ����̸�, ORG_CD �Ҽ�, position ��å, GENDER ����
from cslee.tb_emp 
where gender = null;

select EMP_NAME ����̸�, ORG_CD �Ҽ�, position ��å, GENDER ����
from cslee.tb_emp 
where gender is null;

--����8: where ����- ����������
--����3��(10)�� ����߿��� '����'�� ������ ������ �������� �ڷḦ ã�´�.
select EMP_NAME ����̸�, ORG_CD �Ҽ�, position ��å
from CSLEE.TB_EMP
where ORG_CD = '10'
and not position = '����';

--�Ҽ��� NULL�� �ƴ� ������ �ڷḦ ����϶�
select EMP_NAME ����̸�, ORG_CD �Ҽ�, position ��å
from CSLEE.tb_emp 
where ORG_CD is not null;

--2. Order by ���� �����ϱ�
--����9

select ORG_CD �μ�, EMP_NAME ����̸�, ENT_DATE �Ի���
from cslee.tb_emp 
order by ORG_CD, ENT_DATE desc;

select EMP_NAME, EMP_NO, ORG_CD
from CSLEE.tb_emp 
order by EMP_NAME ASC, EMP_NO ASC, EMP_NO desc;

select EMP_NAME ����̸�, EMP_NO �����ȣ, ORG_CD �μ��ڵ�
from CSLEE.tb_emp 
order by ����̸�, �����ȣ, �μ��ڵ� desc;

select EMP_NAME, EMP_NO, ORG_CD
from CSLEE.tb_emp 
order by 1 ASC, 2 ASC, 3 DESC;

select EMP_NAME ����̸�, EMP_NO �����ȣ, ORG_CD �μ��ڵ�
from CSLEE.tb_emp 
order by emp_name, 2, �μ��ڵ� desc;


