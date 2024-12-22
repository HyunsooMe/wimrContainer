# What-s-in-my-Naengjanggo

**======================**
**필수**
**======================**
**초기값 설정 방법**
application.properties 파일에서
    spring.datasource.username에 mySQL root name을
    spring.datasource.password에 mySQL root password를
    file.upload.location에 로컬 프로젝트 파일의 files 폴더 주소를 
넣어주어야 한다.

그리고 mySQL에서 data Import로 프로젝트 파일의 resources에 존재하는 data.sql을 import 해줘야한다.