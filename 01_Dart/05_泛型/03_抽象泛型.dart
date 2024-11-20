void main(List<String> args) {}

abstract class Cache<T> {
  getByKey(String key);
  void setByKey(String key, T value);
}

class FlieCache<T> implements Cache<T> {
  @override
  getByKey(String key) {
    throw Null;
  }

  @override
  void setByKey(String key, T value) {
    print("我是文件缓存 把key=${key} value=${value}的数据写到文件中");
  }
}

class MemoryCache<T> implements Cache<T> {
  @override
  getByKey(String key) {
    throw Null;
  }

  @override
  void setByKey(String key, T value) {
    print("我是内存缓存 把key=${key} value=${value}的数据写到内存中");
  }
}

class Student {}

class Room<T extends Student> {}
