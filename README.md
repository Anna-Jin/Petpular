# 토이 프로젝트 \<Petpular\>

반려냥이의 프로필, 어떻게 관리하고 계신가요?<br>
Petpular는 반려냥이의 정보를 한눈에 보고 관리할 수 있도록 돕는 집사들을 위한 플래폼입니다.

커뮤니티로 다른 집사들과 소통하세요!

유기동물 목록을 조회해보고 사지 말고 입양하세요!



<br>

## 목차
- [0. 들어가며](#0-들어가며)
  * [0-1. 프로젝트 주제 선정](#0-1-프로젝트-주제-선정)
- [1. 개요](#1-개요)
  * [1-1. 프로젝트 진행 순서](#1-1-프로젝트-진행-순서)
  * [1-2. 개발 기간](#1-2-개발-기간)
  * [1-3. 메인 기술 스택](#1-3-메인-기술-스택)
  * [1-4. 구동 환경](#1-4-구동-환경)
- [2. 프로젝트 기획](#2-프로젝트-기획)
  * [2-1. 기획서](#2-1-기획서)
- [3. 개발](#3-개발)
  * [3-1. 기술 문서](#3-1-기술-문서)
  * [3-2. 주요 기능](#3-2-주요-기능)
  * [3-3. 향후 추가 계획](#3-3-향후-추가-계획)
- [4. 데모](#4-데모)
  * [4-1. 데모 영상](#4-1-데모-영상)
- [5. 느낀 점](#5-느낀-점)
  * [5-1. 우선 순위 설정](#5-1-우선-순위-설정)
  * [5-2. 성장의 즐거움](#5-2-성장의-즐거움)
  * [5-2. 총평](#5-2-총평)

<br>

## 0. 들어가며

### 0-1. 프로젝트 주제 선정

첫 개인프로젝트 주제는 나와 가장 관련있으면서 재미있게 개발할 수 있는 주제로 선정하고자 했다.
여러가지 관심사 중 우리집 최고 권위자인 고양이 '빵이'와 관련된 서비스가 생각이 났고, 최근 주위에 반려고양이를 키우기 시작하는 사람들이 늘어나고 있기에 나 뿐만 아니라 모두가 함께 사용할 수 있는 서비스인 <반려동물 커뮤니티>를 이번 프로젝트의 주제로 선정하게 되었다.

<br>

## 1. 개요

### 1-1. 프로젝트 진행 순서
기획 / 일정표(WBS) 제작 -> DB 설계 -> URL / API 설계 -> 기능 구현 -> 테스트 -> 배포

<br>

### 1-2. 개발 기간
`2022-03-10` ~ `2022-04-12`

<br>

### 1-3. 메인 기술 스택

- Back end <br>

<img src="https://img.shields.io/badge/Java-89A426?style=for-the-badge&logo=java&logoColor=white&color=0169B4" height="25" /> <img src="https://img.shields.io/badge/Spring_Boot-F9FCF3?style=for-the-badge&logo=spring-boot&logoColor=white&color=67AA3C" height="25" /> <img src="https://img.shields.io/badge/MySQL-7DA205?style=for-the-badge&logo=mysql&logoColor=white&color=D78800" height="25" />

- Front end <br>

<img src="https://img.shields.io/badge/HTML5-0A6A05?style=for-the-badge&logo=html5&logoColor=white&color=D84925" height="25" /> <img src="https://img.shields.io/badge/Bootstrap-FA6C0E?style=for-the-badge&logo=bootstrap&logoColor=white&color=7613EE" height="25" /> <img src="https://img.shields.io/badge/JavaScript-468010?style=for-the-badge&logo=javascript&logoColor=F7DF1E&color=DB9B26" height="25" />  <img src="https://img.shields.io/badge/jQuery-D17001?style=for-the-badge&logo=jquery&logoColor=white&color=1064A5" height="25" /> <img src="https://img.shields.io/badge/CSS-BB9F00?&style=for-the-badge&logo=css3&logoColor=white&color=018FD1" height="25" />

- 버전 및 이슈 관리 <br>

<img src="https://img.shields.io/badge/Git-0A6A05?style=for-the-badge&logo=git&logoColor=white&color=E44A2D" height="25" /> <img src="https://img.shields.io/badge/Github-0A6A05?style=for-the-badge&logo=github&logoColor=black&color=white" height="25" /> <img src="https://img.shields.io/badge/Zenhub-0A6A05?style=for-the-badge&logo=github&logoColor=white&color=3C4994" height="25" /> 

<br>

### 1-4. 구동 환경

- Chrome

<br>

## 2. 프로젝트 기획

### 2-1. 기획서

[노션 기획서 페이지](https://www.notion.so/305071e2f4574234932856912cb8a67d)


<br>

## 3. 개발

### 3-1. 기술 문서

[기술 스택, 라이브러리, 구현기능, 트러블 슈팅](https://www.notion.so/186c0ace56174cc2831a394d36800a54)


<br>

### 3-2. 주요 기능
- 반려동물 등록 : 반려냥이의 프로필을 등록하고 수정할 수 있습니다.
- 반려동물 추가정보 등록 : 반려냥이의 사료 / 모래 구매일과 수량, 용량을 등록하면 다음 구매일을 추천해줍니다.
- 반려동물 프로필 : 등록한 반려냥이의 프로필과 사료 / 모래의 다음 구매일을 확인할 수 있습니다.
- 유기동물 조회 : 시 / 도 / 군(구)별 현재 보호중인 유기동물 현황을 볼 수 있습니다.
- 그 외에도 유저의 프로필 수정 및 게시글 / 반려동물 목록 / 유기동물 찜 목록 보기 기능을 제공합니다.

<br>

### 3-3. 향후 추가 계획
- (ver.1.1) 회원 삭제 기능
- (ver.2) 지도 API를 이용한 동물병원 위치 검색기능

<br>

# 4. 데모

### 4-1. 데모 영상
[![토이프로젝트 Petpular 데모 영상](https://img.youtube.com/vi/KmsWxZXVdd8/0.jpg)](https://www.youtube.com/watch?v=KmsWxZXVdd8)

<br>

# 5. 느낀 점

### 5-1. 우선 순위 설정

한 달이라는 짧은 기간 안에 프로젝트를 완성해야한다는 부담감이 크게 다가와서 시작부터 조급한 마음을 갖고 있었다. 하지만 프로젝트를 하면서 하루에 시간을 충분히 갖고 차근차근 개발을 하다보니 일정을 며칠이나 앞서나가게 되는 경험을 하게 되었다.

이번 프로젝트를 통해 우선순위를 정해 제한 된 기간 내에 프로젝트를 완성할 수 있도록 일정을 관리하는 방법을 깨달았다.

<br>

### 5-2. 성장의 즐거움

혼자 프로젝트를 진행하다보니 적용하고자 하는 모든 기술들을 스스로 찾고 공부해야했다.

예를 들어 API를 호출하기 위해 WebClient를 공부해야했는데, 수 많은 자료를 검색하고 읽어보면서 직접 새로운 기술을 적용하는 과정이 즐겁게 다가왔다.

<br>

### 5-2. 총평

기획부터 DB설계, URL설계, 개발까지 스스로 공부하고 적용해본 첫 프로젝트를 진행하였다. 

기획단계에서 하고싶은 기능을 무작정 다 넣었지만 정말 내가 할 수 있을까?라는 기대 반 두려움 반으로 시작했는데, 에러를 마주하고 스스로 해결하면서 ‘내가 진짜 할 수 있구나'라는 생각과 함께 큰 자신감을 얻게 된 프로젝트였다.


