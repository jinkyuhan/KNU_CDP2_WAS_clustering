

# CDP2_WAS_clustering

> 이 프로젝트는 WAS 세션 이중화 솔루션으로써  사용자가  WAS 세션 이중화를 위한  특별한 설정을 할 필요가 없도록 Docker-compose기반의 자동적인 Web Application Server 이중화 스크립트를 제공합니다. 하나의 웹서버에게 오는 요청을 다른 두 웹 어플리케이션 서버로 분산합니다. 웹 어플리케이션 서버의 예측 불가능한 종료에 장애 극복 및 세션의 지속을 보장합니다.  

> This project is a WAS session redundancy solution. It provides an automatic Web Application Server redundancy script based on Docker-compose, so that users do not have to set any special settings for WAS session redundancy. Distributes requests to one web server to two other web application servers. Ensures failover and the continuity of the session on the web application server's unpredictable termination

## 실행 방법(How to run)

1. Clone git  
   ```Bash
   $ git clone https://github.com/jinkyuhan/CDP2_WAS_clustering.git
   cd CDP2_WAS_clustering
   ```

2. Run 'runserver.sh'
	 ```Bash
   $ ./runserver.sh
   ``` 
	- docker 및 docker-compose 설치 여부 확인(미설치시 서버 실행 불가)
	- 기존의 서버 실행 여부를 체크 후 실행중이면  'quitserver.sh' 호출하여 서버 종료
	- 배포를 위해 사용자가 진행하는 프로젝트의 이름과 외부로 노출할 port 번호 입력
	- 서버 실행

3. Run 'quitserver.sh'
	 ```Bash
   $ ./quitserver.sh
   ```
   	- 실행중인 모든 서버를 종료.
## 사용 예제(Usage example)

스크린샷을 더하여 설명
1. $ ./runserver.sh 
> 사용자의 프로젝트 이름 입력
> 사용자가 원하는 port번호 입력
(컨테이너 실행중인 모습+ 웹 페이지 정상적으로 잘 동작하는지 스샷 ....)

ex)서버 웹 브라우저로 접속 방법....
http://localhost:(지정한 포트넘버)/index.jsp ......

2. tomcat-server1 다운 후에도 세션 유지되는 모습 스크린샷....


3. $ ./quitserver.sh ...스샷

## 개발 환경 설정(Dev-env, Dependency)

Docker:19.03.8
Docker-compose:1.25.5
httpd:2.4
tomcat:9.0
JK Connector(mod_jk) :1.2.48
## 기여자 정보(Contributor's info)

jinkyuhan, *gkswlsrb95@gmail.com* 
cheesecat47, *cheesecat47@gmail.com*
atg0831, *atg0831@naver.com*
hgh1146, *hgh1146@naver.com*

## 해설 (한국어)

- 이 솔루션은 스크립트 자동화에 의하여  WAS 세션 이중화를 위한 설정 과정의 수고를 덜어주고 사용자의 요구에 맞춰 WAS의 설정 파일의 내용을 변경함으로써 서비스 개발의 생산성 향상에 기여합니다.
-  Docker-compose로부터 2개의 이미지를 빌드하고 3개의 컨테이너 인스턴스를 생성합니다. 생성되는 컨테이너는 다음과 같습니다. 
	- **apache-server**: 정적 데이터에 대한 웹 요청을 처리하는 웹 서버 입니다. 필요에 따라 다른 웹 어플리케이션 서버로 요청을 분산합니다.
	- **tomcat-server1**, **tomcat-server2**: 서로를 지원하여 동적 데이터에 대한 웹 요청을 처리하는  웹 어플리케이션 서버입니다. **Failover**와 **Load balancing**을 지원합니다.

## Explanation (in English)
-  This solution contributes to productivity improvement of service development by reducing the labor of the setting process for WAS session redundancy by automated scripts and changing the contents of the WAS configuration file according to the user's needs.
-  Build 2 images from Docker-compose and create 3 container instances. The containers created are:
	  - **apache-server**: Static web server to distribute requests to other Web Application Servers(tomcat)
	  - **tomcat-server1**, **tomcat-server2**: Web Application Server(WAS) supporting each other. It provides **Failover** and **Load  Balancing**


