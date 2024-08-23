/// Author: Meng
/// Date: 2024-08-22
/// Modify: 2024-08-22
/// Desc:
///
class EventAction {
  static const String login = 'login';
  static const String gotoLogin = 'goto-login';
  static const String logout = 'logout';
  static const String welcome = 'welcome';
  static const String blogList = 'blog-list';
}

class EventMsg {
  final String action;
  final dynamic data;

  EventMsg(this.action, this.data);
}

class EventBus {
  EventBus._internal();

  static final EventBus _instance = EventBus._internal();

  factory EventBus() => _instance;

  final _eventMap = <String, List<Function>>{};

  void add(String eventName, Function callback) {
    if (_eventMap.containsKey(eventName)) {
      _eventMap[eventName]?.add(callback);
    } else {
      _eventMap[eventName] = [callback];
    }
  }

  void remove(String eventName, Function callback) {
    if (_eventMap.containsKey(eventName)) {
      _eventMap[eventName]?.remove(callback);
    }
  }

  void emit(String eventName, Map<String, dynamic> data) {
    if (_eventMap.containsKey(eventName)) {
      _eventMap[eventName]?.forEach((callback) {
        if (callback != null) {
          callback(data);
        } else {
          // 移除已经被释放的回调
          remove(eventName, callback);
        }
      });
    }
  }
}
