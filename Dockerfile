# 1. 가벼운 Node.js 버전 선택
FROM node:22-slim

# 2. 컨테이너 내부 작업 디렉토리 설정
WORKDIR /app

# 3. 패키지 설치를 위해 파일 복사
COPY package*.json ./

# 4. 의존성 설치 (express를 dependencies로 옮긴 상태여야 합니다!)
RUN npm install --production

# 5. 소스 코드 전체 복사
COPY . .

# 6. 서버가 사용할 포트 개방
EXPOSE 8080

# 7. 서버 실행 (공식 가이드에 따라 express.js 실행)
CMD ["node", "express.js"]
