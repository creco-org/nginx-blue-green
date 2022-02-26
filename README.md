# nginx-blue-green

> nginx의 graceful reload를 이용하여 blue/green 배포를 할 수 있도록 POC를 위한 테스트입니다.

## STEP 1. 준비

```bash

# 도커 컨테이너와 이미지를 초기화
./reset.sh

# nginx 도커와 web server 도커를 빌드
./build.sh

# blue-app으로 실행
./start.sh
```

## STEP 2. green 배포

```bash
# blue-app이 실행중이면, green-app으로 뜨도록 하고 blue-app을 종료합니다. (green-app이 실행중이면, blue-app이 뜹니다.)
./deploy.sh
```
