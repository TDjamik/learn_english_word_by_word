class SecurityService {
  final DataService _dataService = DataService();

  Future<bool> setPassword(String password) async {
    if (password.length >= 4) {
      await _dataService.storeData(key: "password", value: password);
      return true;
    }
    return false;
  }

  Future<bool> checkPassword(String password) async {
    String installedPassword = await _dataService.readData(key: "password");
    return password == installedPassword;
  }

  Future<void> deletePassword() async {
    await _dataService.deleteData(key: "password");
  }
}
