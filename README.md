# CDP2_WAS_clustering

> 이 프로젝트는 WAS 세션 이중화 솔루션입니다. Docker-compose기반의 자동적인 Web Application Server 이중화 스크립트를 제공합니다. 하나의 웹서버에게 오는 요청을 다른 두 웹 어플리케이션 서버로 분산합니다. 웹 어플리케이션 서버의 예측 불가능한 종료에 세션의 지속을 보장합니다. 

> This project is a WAS redundancy solution. Provides automatic Web Application Server redundancy script based on Docker-compose. You can distributes requests from one web server to two other WAS. It ensures the continuity of the session on the WAS’s unpredictable termination.


## 실행 방법(How to run)

```zsh
// For Mac
$ ./start_mac.sh
```

```powershell
// For Windows
$ ./start_windows.bat
```

```bash
// For Ubuntu
$./start_ubuntu.sh
```

## 사용 예제(Usage example)

스크린샷을 더하여 설명



Each Container Use following ports as a Default (수정예정 : 포트 정하는 스크립트 관한 설명시 기본값으로 제시...)

- Port #80 for apache server (via HTTP)
- Port #8080, #8180 for tomcat server (via HTTP)
- Port #8009, #8109 to connect apache and tomcat (via AJP)

## 개발 환경 설정(Dev-env, Dependency)

Docker:19.03.8
Docker-compose:1.25.4
httpd:2.4
tomcat:9.0

## 기여자 정보(Contributor's info)

jinkyuhan, *gkswlsrb95@gmail.com* 
cheesecat47, *cheesecat47@gmail.com*
atg0831, *atg0831@naver.com*
hgh1146, *hgh1146@naver.com*

## 해설 (한국어)

- 이 솔루션은 Docker-compose로부터 2개의 이미지를 빌드하고 3개의 컨테이너 인스턴스를 생성합니다. 생성되는 컨테이너는 다음과 같습니다. 
- **apache-server**: 정적 데이터에 대한 웹 요청을 처리하는 웹 서버 입니다. 필요에 따라 다른 웹 어플리케이션 서버로 요청을 분산합니다.
- **tomcat-server1**, **tomcat-server2**: 서로를 지원하여 동적 데이터에 대한 웹 요청을 처리하는  웹 어플리케이션 서버입니다. **Failover**와 **Load balancing**을 지원합니다.

## Explanation (in English)

- This solution build following 2 images and Setup 3 containers with Docker-Compose. The containers created are :
  - **apache-server**: Static web server to distribute requests to other Web Application Servers(tomcat)
  - **tomcat-server1**, **tomcat-server2**: Web Application Server(WAS) supporting each other. It provides **Failover** and **Load  Balancing**
