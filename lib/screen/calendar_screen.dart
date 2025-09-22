import 'package:flutter/material.dart';
import 'package:flutter_calendar_example/screen/add_schedule_screen.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../model/event.dart';

/// 달력 화면
/// ✅ 기능: 달력 표시, 날짜 선택, 이벤트 관리
class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month; // 달력 포맷 (월간, 주간 등)
  DateTime _focusedDay = DateTime.now(); // 현재 포커스된 날짜
  DateTime? _selectedDay; // 선택된 날짜

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  // 이벤트 맵 (날짜별 이벤트 리스트)
  final Map<String, List<Event>> _events = {
    "2025/09/13": [
      Event(id: '1', title: '산책하기'),
      Event(id: '2', title: '카페가기'),
    ],
    "2025/10/25": [
      Event(id: '4', title: '장보기'),
      Event(id: '5', title: '대청소하기'),
    ],
    "2025/11/02": [Event(id: '7', title: '자격증시험')],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[400],
        onPressed: _onFLoatingActionButtonPressed,
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withAlpha((255 * 0.5).toInt()),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: TableCalendar(
                  // 달력에 포커스된 날짜
                  // 달력을 표시할때 기준이 되는 날짜
                  focusedDay: _focusedDay,
                  // 달력의 최초 날짜
                  firstDay: DateTime(2024),
                  // 달력의 마지막 날짜
                  lastDay: DateTime(2030),
                  // 달력의 포맷 (월간)
                  calendarFormat: CalendarFormat.month,
                  // 각 날짜 행의 높이 설정
                  // rowHeight: 60,

                  // 요일 행의 높이 설정
                  // 가끔씩 요일 행이 너무 작게 나오는 경우가 있어서 설정
                  daysOfWeekHeight: 30,
                  // 달력의 헤더 스타일 설정
                  // 달력의 헤더는 월과 년도를 표시하는 부분
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false, // 달력 포맷 버튼 숨김
                    titleCentered: true, // 헤더 타이틀 가운데 정렬
                    titleTextStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    titleTextFormatter:
                        (date, locale) =>
                            '${date.year}년 ${date.month}월', // 년월 포맷 설정
                    headerPadding: EdgeInsets.symmetric(
                      vertical: 8.0,
                    ), // 헤더 패딩 설정
                    leftChevronIcon: Icon(
                      Icons.chevron_left,
                      size: 28.0,
                    ), // 왼쪽 화살표 아이콘
                    rightChevronIcon: Icon(
                      Icons.chevron_right,
                      size: 28.0,
                    ), // 오른쪽 화살표 아이콘
                    // headerMargin: EdgeInsets.only(bottom: 0), // 헤더 마진 설정
                    // 헤더 배경 스타일 설정
                    decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                  ),

                  // 달력의 스타일 설정
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: TextStyle(
                      fontSize: 16.0,
                    ), // 기본 날짜 텍스트 스타일
                    isTodayHighlighted: true, // 오늘 날짜 강조
                    // 오늘 날짜 스타일 설정
                    todayTextStyle: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    // 오늘 날짜 배경 스타일
                    todayDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    // 주말 날짜 스타일 설정
                    weekendTextStyle: TextStyle(
                      fontSize: 16.0,
                      color: Colors.red,
                    ),
                    // 현재 달이 아닌 날짜 스타일 설정
                    outsideTextStyle: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                    // 선택된 날짜 스타일
                    selectedTextStyle: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    // 선택된 날짜 배경 스타일
                    selectedDecoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),

                    // 이벤트 마커 스타일 설정
                    // 이벤트 마커는 특정 날짜에 이벤트가 있음을 나타내는 작은 점
                    // 이벤트 마커는 날짜 셀에 쌓이도록 되어있음
                    // 이벤트 마커는 markerBuilder 콜백을 통해 커스텀 가능
                    markerSize: 8.0, // 이벤트 마커 크기
                    markersAlignment: Alignment.topLeft, // 이벤트 마커 위치
                    markerDecoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ), // 이벤트 마커 스타일
                    // 달력의 테두리 스타일 설정
                    tableBorder: TableBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  // 달력의 빌더 설정
                  // calendar style에서 제공하는 스타일을 무시하고 커스텀한 스타일을 적용할 수 있음
                  calendarBuilders: CalendarBuilders(
                    // 이벤트 마커 커스텀 빌더
                    markerBuilder: (context, day, events) {
                      // day : 해당 날짜
                      // events : 해당 날짜에 해당하는 이벤트 리스트
                      if (events.isNotEmpty) {
                        return Positioned(
                          bottom: 4.0,
                          right: 4.0,
                          child: Container(
                            width: 16.0,
                            height: 16.0,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${events.length}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      return SizedBox.shrink();
                    },

                    // 요일 커스텀 빌더
                    dowBuilder: (context, day) {
                      // day : 해당 요일 날짜

                      final text = switch (day.weekday) {
                        DateTime.monday => '월',
                        DateTime.tuesday => '화',
                        DateTime.wednesday => '수',
                        DateTime.thursday => '목',
                        DateTime.friday => '금',
                        DateTime.saturday => '토',
                        DateTime.sunday => '일',
                        _ => '',
                      };

                      final isWeekend =
                          day.weekday == DateTime.saturday ||
                          day.weekday == DateTime.sunday; // 주말 여부

                      return Align(
                        child: Text(
                          text,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: isWeekend ? Colors.red : Colors.black,
                          ),
                        ),
                      );
                    },
                  ),

                  // 현재 선택된 날짜 파악
                  // 각 날짜가 랜더링될때마다 호출되는 콜백
                  selectedDayPredicate: _selectedDayPredicate,
                  // 날짜 선택시 호출되는 콜백
                  onDaySelected: _onDaySelected,
                  // 달력 포맷 변경시 호출되는 콜백
                  onFormatChanged: _onFormatChanged,

                  // 달력의 포커스된 날짜가 변경될때 호출되는 콜백
                  // ex) 사용자가 달력의 화살표 버튼을 눌러서 월을 변경할때
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },

                  eventLoader: _getEventsForDay,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    // 선택된 날짜에 해당하는 이벤트 리스트
                    final event = _getEventsForDay(_selectedDay!)[index];
                    return ListTile(
                      style: ListTileStyle.list,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: Colors.grey.withAlpha((255 * 0.5).toInt()),
                        ),
                      ),
                      title: Text(event.title),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 8.0),
                  itemCount: _getEventsForDay(_selectedDay!).length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 이벤트 로더 콜백
  // 특정 날짜에 해당하는 이벤트 리스트 반환
  List<Event> _getEventsForDay(DateTime day) {
    String dayT = DateFormat('yyyy/MM/dd').format(day);
    return _events[dayT] ?? [];
  }

  // 플로팅 액션 버튼 클릭시 호출되는 콜백
  void _onFLoatingActionButtonPressed() {
    // 스케줄 추가 화면으로 이동
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AddScheduleScreen()))
        .then((value) {
          if (value != null && value is String) {
            final newEvent = Event(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              title: value,
            );

            final dayT = DateFormat('yyyy/MM/dd').format(_selectedDay!);

            if (_events.containsKey(dayT)) {
              _events[dayT]?.add(newEvent);
            } else {
              _events[dayT] = [newEvent];
            }

            setState(() {});
          }
        });
  }

  // 현재 선택된 날짜 파악
  bool _selectedDayPredicate(DateTime day) {
    return isSameDay(_selectedDay, day);
  }

  // 날짜 선택시 호출되는 콜백
  void _onDaySelected(selectedDay, focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  // 달력 포맷 변경시 호출되는 콜백
  void _onFormatChanged(format) {
    if (_calendarFormat != format) {
      setState(() {
        _calendarFormat = format;
      });
    }
  }
}
