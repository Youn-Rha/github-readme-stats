# 1. 아키텍처 호환성이 좋은 기본 이미지 사용
FROM node:22

WORKDIR /app

# 2. 파일 복사
COPY package*.json ./

# 3. 핵심 수정: 쉘(/bin/sh)을 거치지 않고 직접 실행하도록 배열 형태를 씁니다.
# 이렇게 하면 줄바꿈 문자가 섞여도 npm을 정확히 찾아 실행합니다.
RUN ["npm", "install", "--production"]

COPY . .

EXPOSE 8080

# 4. 실행 명령도 배열 형태로 작성합니다.
CMD ["node", "express.js"]
