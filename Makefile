default : build-jdk8 push
build-jdk8: build-openjdk-8 build-adoptopenjdk-8 build-eclipse-temurin-jdk8
build-openjdk-8:
	cd openjdk-8 && docker build --tag kingstartech/maven:openjdk-8 .
build-adoptopenjdk-8:
	cd adoptopenjdk-8 && docker build --tag kingstartech/maven:adoptopenjdk-8 .
build-eclipse-temurin-jdk8:
	cd eclipse-temurin-jdk8 && docker build --tag kingstartech/maven:eclipse-temurin-jdk8 .
push:
	docker push kingstartech/maven:openjdk-8 
	docker push kingstartech/maven:adoptopenjdk-8 
	docker push kingstartech/maven:eclipse-temurin-jdk8 