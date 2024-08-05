# 가져올 이미지를 정의
FROM node:16

# 경로 설정하기
WORKDIR /app

# package.json 워킹 디렉토리에 복사 (.은 설정한 워킹 디렉토리를 뜻함)
COPY package.json .

# 명령어 실행 (의존성 설치)
RUN npm install

# 현재 디렉토리의 모든 파일을 도커 컨테이너의 워킹 디렉토리에 복사한다.
COPY . .

# 3000번 포트 노출
EXPOSE 3000

# npm start 스크립트 실행
CMD ["npm", "start"]

# 그리고 Dockerfile로 docker 이미지를 빌드해야한다.
# $ docker build -t my-react-app .

# 이미지 생성이 되었는지 확인
# $ docker images

# 이미지 실행 명령어 (컨테이너를 띄운다) (백그라운드 실행 원할경우 -d 옵션 추가)
# $ docker run -p 3000:3000 my-react-app
# $ docker run -d -p 3000:3000 my-react-app