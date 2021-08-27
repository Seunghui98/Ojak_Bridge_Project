# 👨🏼‍⚕️ Ojak_Bridge_Project
- 만약 원격의료가 된다면 이라는 가정으로부터 비대면 의료 서비스가 가능하도록 프로젝트를 구현
- JSP를 이용하여 의사와 환자를 연결해주는 오작교 홈페이지를 제작
- RDB를 구축하여 의사, 환자, 예약, 병원 등의 Data들을 이용하여 각 기능에 맞추어 CRUD 될 수 있도록 구현

<br>

## 👀 프로젝트 개요  
- 📆 프로젝트 기간  
  - 2020.11.29  ~ 2020.12.18 (3Weeks)


- 📌 기획 배경
  - 코로나19 상황으로 언택트 시대에 '원격의료'의 기초적인 기능을 제공
  - 모든 병원 및 의료진에 대한 정보를 확인할 수 있는 통합하는 시스템 필요
  - 환자가 직접 병원에 가지 않아도 되는 온라인 진료가 가능하도록 할 수 있는 시스템 구축 

<br>
<br>

##  :rocket: 프로젝트 주요 기능
- 환자, 의사, 관리자 해당 로그인 기능 작동
- 회원가입 기능 구현
- 병원 검색 후, 해당 병원의 위치 좌표를 KAKAO MAP에서 확인
- 각 병원 의료진의 스케줄에 맞추어 온라인 진료를 예약할 수 있도록 예약 시스템 구현
- WebRTC로 의사와 환자가 P2P 통신을 통해 원격진료가 가능하도록 구현
- 진료가 완료된 예약은 환자가 리뷰 작성하도록 구현
- 사용자들이 의료에 관한 의견을 자유롭게 공유할 수 있도록 미니 오작교 커뮤니티(게시판) 구현

<br>
<br>

## 🔧 프로젝트 사용기술
![K-042](https://user-images.githubusercontent.com/54658745/131130166-9d63ec40-4d44-4038-950f-551f254adf40.png)

- Open API
  - Kakao MAP
  - Web RTC 
<br>
<br>


## 📈 ERD
![K-043](https://user-images.githubusercontent.com/54658745/131130253-c0b03a73-3366-4393-99ac-afcc2ca7c9bc.png)
<br>
<br>

## 📝 테이블 명세서
### 1️⃣ user테이블: 일반 환자(사용자)의 정보를 담은 테이블
![K-044](https://user-images.githubusercontent.com/54658745/131131104-627eb9fd-4995-4836-8d51-3380e9d03ec2.png)

### 2️⃣ doctor테이블: 의사의 정보를 담은 테이블 
![K-045](https://user-images.githubusercontent.com/54658745/131131109-a0364ad9-35db-47ba-a055-4384966e5ffd.png)

### 3️⃣ hospital 테이블: 병원의 정보를 담은 테이블
![K-046](https://user-images.githubusercontent.com/54658745/131131115-361f0bb1-4e66-4d3a-9bf9-4857f63978af.png)

### 4️⃣ reservation 테이블: 예약기능을 위해 정보를 담은 테이블
![K-047](https://user-images.githubusercontent.com/54658745/131131123-5e6e7dc8-fec8-4704-b46a-50a98b9c0b74.png)

### 5️⃣ bbs 테이블: 게시판의 정보를 담은 테이블
![K-048](https://user-images.githubusercontent.com/54658745/131131135-68ffe623-daa2-4a5b-8c0c-fae1bd5f043f.png)

### 6️⃣ review 테이블: 진료 후기에 대한 정보를 담은 테이블
![K-049](https://user-images.githubusercontent.com/54658745/131131142-cb7a1487-af4a-47cd-89c6-aedada4ca064.png)

### 7️⃣ com 테이블: 댓글에 대한 정보를 담은 테이블
![K-050](https://user-images.githubusercontent.com/54658745/131131150-2186c3f9-cdbd-4fad-be72-1b954ab3fa10.png)
<br>
<br>

##  ✨ 화면 구성도 및 주요 기능
### 1️⃣ 메인화면
- 로그인 및 회원가입 기능
- 병원 검색 및 Kakao MAP 표시 기능
![구현1](https://user-images.githubusercontent.com/54658745/131137990-5c3497fe-cb7a-4494-a2e2-9e5045046828.png)

### 2️⃣ 병원에 대해 온라인 예약 기능
- 예약하고 싶은 의사의 스케줄 확인
- 예약 가능한 스케줄에 맞추어 예약 가능
- 예약이 성공되면 예약 리스트에서 확인 가능하며 예약 취소도 가능하게 구현
![구현2](https://user-images.githubusercontent.com/54658745/131138067-8e1530a7-3223-4e73-8908-0688907c087e.png)

### 3️⃣ 온라인 진료 기능
- Web RTC를 활용하여 P2P 온라인 진료 가능
- 진료 후 환자가 진료에 대한 리뷰 작성 가능
![구현3](https://user-images.githubusercontent.com/54658745/131138336-667f436a-8e12-4494-842c-b7ea1cd2b6a2.png)

### 4️⃣ 오작교 게시판 기능
- 오작교 게시판을 통해 자유롭게 소통 가능
- 게시글과 해당 댓글에 대한 CRUD 기능 구현
-<img width="1787" alt="KakaoTalk_20210827_221906545_06" src="https://user-images.githubusercontent.com/54658745/131138554-72ccdce1-7436-4432-bfab-4fe7c387de99.png">
![image](https://user-images.githubusercontent.com/54658745/131138703-1df74c61-cd01-41af-8a2e-316f54ac7156.png)

<br>
<br>

## 📝 프로젝트 기대 효과
- 사용자에게 홈페이지를 통해 간편하게 의료 정보 제공 가능
- 모든 의료진에 스케줄에 맞춰 온라인 진료 예약 시스템 제공
- 오작교 게시판을 통해 의료 관련 정보를 자유롭게 공유 가능
- WebRTC를 통해 의사와 환자의 P2P 화상통신 가능

<br>
<br>

## 🎉 프로젝트 결과
- 데이터베이스 1분반과 2분반 합쳐사 기말발표에서 1등
