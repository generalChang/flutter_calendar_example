# 📅 Flutter Calendar Example

[table_calendar](https://pub.dev/packages/table_calendar) 패키지를 활용하여 **이벤트 관리가 가능한 달력 화면**을 구현한 예제입니다.  
누구나 쉽게 가져다 쓰고, 참고하거나 확장할 수 있도록 구현하였습니다.

<br>

## ✨ 주요 기능

- 달력 표시
- 날짜 선택 및 포커싱
- 날짜별 이벤트 관리 (마커 및 개수 표시, 이벤트 리스트, 새 이벤트 추가)

<br>

## 📸 스크린샷

| 달력 화면 | 날짜 선택 및 일정 조회 | 일정 추가 | 일정 추가 후 |
|-----------|------------|-----------|--------------|
| <img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-22 at 11 25 13" src="https://github.com/user-attachments/assets/a6fffbe5-7037-4d74-b5ab-93f6e1aaffca" /> | <img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-22 at 11 25 17" src="https://github.com/user-attachments/assets/81a06398-1012-4f3d-b9f4-acfa93772783" /> | <img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-22 at 11 25 41" src="https://github.com/user-attachments/assets/3539ac94-ef13-4af7-97f2-d37a9dac5b1c" /> | <img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-22 at 11 26 03" src="https://github.com/user-attachments/assets/bdf76ab5-7557-444e-83cc-5c977a4c76bd" /> |

<br>

## 📌 참고사항

- 현재 예제에는 **로컬 저장소나 백엔드 서버 연동 기능이 없습니다.**
- 일정(Event) 데이터는 `Map<String, List<Event>>`형태로 **하드코딩된 상태**로 관리됩니다.
- 따라서 앱을 재실행하면 추가한 일정은 **초기화**됩니다.
- 실제 서비스에서는 **로컬 DB(SQLite, Hive 등)** 또는 **백엔드 서버(Firebase, REST API 등)** 와 연동하여 
일정 데이터를 관리하는 방식으로 확장할 수 있습니다.
