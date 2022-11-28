## import module
import pandas as pd
import numpy as np

## csv 읽어오기
df=pd.read_csv('파일명',encoding='cp949')

## 이름 지정
SIG20=pd.read_csv('20SIG.csv',encoding='cp949')
SIG19=pd.read_csv('19SIG.csv',encoding='cp949')
SIG18=pd.read_csv('18SIG.csv',encoding='cp949')
SIG17=pd.read_csv('17SIG.csv',encoding='cp949')
SIG16=pd.read_csv('16SIG.csv',encoding='cp949')

## 결측치 확인
SIG19.info()


## 데이터 프레임 확인
SIG20
SIG19
SIG18
SIG17
SIG16


## 타입 변경 (object->string)
SIG20=SIG20.astype({ 'A2' : 'string' })
SIG19=SIG19.astype({ 'A2' : 'string' })
SIG18=SIG18.astype({ 'A2' : 'string' })
SIG17=SIG17.astype({ 'A2' : 'string' })
SIG16=SIG16.astype({ 'A2' : 'string' })


## '시','군','구'로 끝나는 거 찾기
list = ['16','17','18','19','20']

for i in list:
    target = eval('SIG'+i)
    print(i)
    print("시:%d" %target[target["A2"].str.endswith('시')]["A2"].count())
    print("군:%d" %target[target["A2"].str.endswith('군')]["A2"].count())
    print("구:%d" %target[target["A2"].str.endswith('구')]["A2"].count())