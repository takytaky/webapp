# 1. Java 17 실행 환경을 제공하는 경량화된 Base Image 사용
FROM eclipse-temurin:17-jre-alpine
# 2. 애플리케이션 버전을 인수로 지정
ARG  VERSION

# 3. 컨테이너 이미지 추가 정보를 LABEL로 지정
LABEL maintainer="Yu Mi"
LABEL title="Java spring test app"
LABEL version="$VERSION"
LABEL description="Java spring web application"

# 4. 컨테이너 내에서 작업할 디렉토리 지정 (선택 사항)
WORKDIR /app

# 5. Maven 빌드로 생성된 jar 파일을 컨테이너 내부의 app.jar로 복사
# (target 폴더 내의 정확한 jar 파일명으로 변경하거나 와일드카드 사용)
COPY target/webapp-*.jar app.jar

# 6. 컨테이너가 시작될 때 실행할 명령어
ENTRYPOINT ["java"]
CMD [ "-jar", "app.jar"]
