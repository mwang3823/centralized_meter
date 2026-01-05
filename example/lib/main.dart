import 'package:dbtt/common/theme.dart';
import 'package:dbtt/dbtt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DBTT Plugin Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      localizationsDelegates: [
        DbttPlugin.localizationDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: DbttPlugin.supportedLocales,
      locale: const Locale('vi'),
      home: const LoginPage(),
    );
  }
}

/// Trang Login
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _serverController = TextEditingController();
  final _nhaBeServerController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  String server = 'http://nhabe-api.e-point.xyz/';
  String nhaBeServer = 'https://kinhdoanh.capnuocnhabe.vn/api/';
  String username = "test";
  String pass = "123456";
  String digitizeKey =
      'https://services.capnuocnhabe.vn/tracuuhoso/viewfilesho?id=';
  String mapApiKey = 'AIzaSyClCOES8RBETmqX4qjixwveOuEuo7s-Xf4';

  @override
  void initState() {
    super.initState();
    _serverController.text = server;
    _nhaBeServerController.text = nhaBeServer;
    _usernameController.text = username;
    _passwordController.text = pass;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _serverController.dispose();
    _nhaBeServerController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        _errorMessage = 'Vui lòng nhập username và password';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final user = await DbttPlugin.init(
        username: _usernameController.text,
        password: _passwordController.text,
        server: _serverController.text,
        nhaBeSever: _nhaBeServerController.text,
        digitizeKey: digitizeKey,
        mapApiKey: mapApiKey,
        displayPrint: true,
      );

      if (mounted) {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => DemoPage(user: user)));
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DBTT Plugin - Login'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.water_drop, size: 80, color: Colors.blue),
            const SizedBox(height: 24),
            const Text(
              'DBTT Plugin Demo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            TextField(
              controller: _serverController,
              decoration: const InputDecoration(
                labelText: 'Server URL',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.cloud),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _nhaBeServerController,
              decoration: const InputDecoration(
                labelText: 'NhaBe Server URL',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.cloud_queue),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 24),

            if (_errorMessage != null) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red.shade700),
                ),
              ),
              const SizedBox(height: 16),
            ],

            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: _isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Text('Đăng nhập', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Trang Demo cac ham cua plugin
class DemoPage extends StatefulWidget {
  final LoginResModel user;

  const DemoPage({super.key, required this.user});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  final _searchController = TextEditingController();
  // final _danhBoController = TextEditingController(text: '19021136048'); //DANHBO

  final _danhBoController = TextEditingController(text: '04011011780'); //DANHBO

  final _searchModel = TextEditingController();
  final _searchModelFocusNode = FocusNode();

  String _selectedSearchType = 'danhbo';
  String? _searchResult;
  bool _isSearching = false;

  // Tab names for pushContactDetailWithTab
  final List<Map<String, dynamic>> _tabOptions = [
    {'index': 0, 'name': 'Tong quan', 'icon': Icons.dashboard},
    {'index': 1, 'name': 'Tra cứu', 'icon': Icons.search},
    {'index': 2, 'name': 'Báo cáo', 'icon': Icons.report},
    {'index': 3, 'name': 'Đóng/Mở nước', 'icon': Icons.water},
    {'index': 4, 'name': 'Lắp mới', 'icon': Icons.add_circle},
    {'index': 5, 'name': 'Thay đồng hồ', 'icon': Icons.swap_horiz},
    {'index': 6, 'name': 'Đổi đồng hồ', 'icon': Icons.swap_calls},
    {'index': 7, 'name': 'Biến động', 'icon': Icons.trending_up},
    {'index': 8, 'name': 'Hình ảnh', 'icon': Icons.image},
    {'index': 9, 'name': 'Định mức', 'icon': Icons.people},
    {'index': 10, 'name': 'Phiếu khiếu nại', 'icon': Icons.report_problem},
    {'index': 11, 'name': 'Công văn', 'icon': Icons.description},
    {'index': 12, 'name': 'Lịch sử cập nhật', 'icon': Icons.history},
    {'index': 13, 'name': 'Tin nhắn', 'icon': Icons.message},
    {'index': 14, 'name': 'Số hóa', 'icon': Icons.qr_code},
  ];

  // Option types for pushLookupScreenWithOption
  final List<Map<String, dynamic>> _lookupOptions = [
    {'id': 'danhbo', 'name': 'Danh bo', 'icon': Icons.numbers},
    {'id': 'hoten', 'name': 'Ho ten', 'icon': Icons.person},
    {'id': 'lotrinh', 'name': 'Lo trinh', 'icon': Icons.route},
    {'id': 'diachi', 'name': 'Dia chi', 'icon': Icons.location_on},
  ];

  @override
  void dispose() {
    _searchController.dispose();
    _danhBoController.dispose();
    _searchModel.dispose();
    _searchModelFocusNode.dispose();
    super.dispose();
  }

  Future<void> _search() async {
    if (_searchController.text.isEmpty) return;

    setState(() {
      _isSearching = true;
      _searchResult = null;
    });

    try {
      final result = await DbttPlugin.searchCustomer(
        context,
        keyword: _searchController.text,
        searchType: _selectedSearchType,
      );
      setState(() {
        _searchResult = result;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              result != null
                  ? 'Tim thay danh bo: $result'
                  : 'Khong tim thay ket qua duy nhat',
            ),
            backgroundColor: result != null ? Colors.green : Colors.orange,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Loi: $e')));
      }
    } finally {
      setState(() {
        _isSearching = false;
      });
    }
  }

  void _logout() {
    DbttPlugin.dispose();
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DBTT Plugin Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () => _showPluginStatus(context),
            tooltip: 'Trang thai Plugin',
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => _showUserInfo(context),
            tooltip: 'Thông tin User',
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
            tooltip: 'Đăng xuất',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Section 1: Input Danh Bo
            _buildSection(
              title: 'Nhập Danh Bộ',
              color: Colors.blue.shade50,
              children: [
                TextField(
                  controller: _danhBoController,
                  decoration: const InputDecoration(
                    labelText: 'Danh bo',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.numbers),
                    hintText: 'VD: 04011010620',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Section 2: Navigation screens
            _buildSection(
              title: 'Các màn hình chính',
              color: Colors.green.shade50,
              children: [
                _buildButton(
                  'pushOverviewReport - Báo cáo tổng quan',
                  Icons.dashboard,
                  () => DbttPlugin.pushOverviewReport(context),
                  Colors.green,
                ),
                _buildButton(
                  'pushLookupScreen - Tra cứu danh bạ',
                  Icons.search,
                  () => DbttPlugin.pushLookupScreen(context),
                  Colors.blue,
                ),
                _buildButton(
                  'pushComparisonReport - Báo cáo so sánh',
                  Icons.compare_arrows,
                  () => DbttPlugin.pushComparisonReport(context),
                  Colors.purple,
                ),
                _buildButton(
                  'pushContactDetail - Chi tiết khach hang',
                  Icons.person_pin,
                  () => DbttPlugin.pushContactDetail(
                    context,
                    _danhBoController.text,
                  ),
                  Colors.orange,
                ),
                _buildButton(
                  'pushMeterSchedule - Lịch ghi chỉ số',
                  Icons.schedule,
                  () => DbttPlugin.pushpushMeterSchedule(
                    context,
                    _danhBoController.text,
                  ),
                  Colors.teal,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Section 3: Lookup with options
            _buildSection(
              title: 'pushLookupScreenWithOption - Tra cứu theo loại',
              color: Colors.amber.shade50,
              children: [
                CustomTextField(
                  focusNode: _searchModelFocusNode,
                  controller: _searchModel,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _lookupOptions.map((option) {
                    return ElevatedButton.icon(
                      onPressed: () => DbttPlugin.pushLookupScreenWithOption(
                        context,
                        OptionModel(id: option['id']),
                        search: _searchModel.text,
                      ),
                      icon: Icon(option['icon'], size: 18),
                      label: Text(option['name']),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black87,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Section 4: Contact detail with tabs
            _buildSection(
              title: 'pushContactDetailWithTab - Chi tiết theo Tab',
              color: Colors.pink.shade50,
              children: [
                const Text(
                  'Chọn tab để xem chi tiết khách hàng:',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _tabOptions.map((tab) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 32,
                      child: ElevatedButton.icon(
                        onPressed: () => DbttPlugin.pushContactDetailWithTab(
                          context,
                          _danhBoController.text,
                          tab['index'],
                        ),
                        icon: Icon(tab['icon'], size: 16),
                        label: Text(
                          '${tab['index']}: ${tab['name']}',
                          style: const TextStyle(fontSize: 12),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 8,
                          ),
                          backgroundColor: Colors.pink.shade100,
                          foregroundColor: Colors.black87,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Section 5: Search customer
            _buildSection(
              title: 'searchCustomer - Tìm kiếm khách hàng',
              color: Colors.cyan.shade50,
              children: [
                DropdownButtonFormField<String>(
                  value: _selectedSearchType,
                  decoration: const InputDecoration(
                    labelText: 'Loại tìm kiếm',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'danhbo', child: Text('Danh bộ')),
                    DropdownMenuItem(value: 'hoten', child: Text('Họ tên')),
                    DropdownMenuItem(value: 'lotrinh', child: Text('Lộ trình')),
                    DropdownMenuItem(value: 'diachi', child: Text('Địa chỉ')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedSearchType = value!;
                    });
                  },
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          labelText: 'Từ khóa tìm kiếm',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.search),
                        ),
                        onSubmitted: (_) => _search(),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _isSearching ? null : _search,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          foregroundColor: Colors.white,
                        ),
                        child: _isSearching
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text('Tim'),
                      ),
                    ),
                  ],
                ),
                if (_searchResult != null) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle, color: Colors.green),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text('Danh bộ tìm thấy: $_searchResult'),
                        ),
                        TextButton(
                          onPressed: () {
                            _danhBoController.text = _searchResult!;
                            setState(() {});
                          },
                          child: const Text('Sử dụng'),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 16),

            // Section 6: Plugin utilities
            _buildSection(
              title: 'Các hàm tiện ích',
              color: Colors.grey.shade200,
              children: [
                _buildInfoRow(
                  'isInitialized',
                  DbttPlugin.isInitialized.toString(),
                ),
                _buildInfoRow(
                  'currentLocale',
                  DbttPlugin.currentLocale.toString(),
                ),
                _buildInfoRow('serverUrl', DbttPlugin.serverUrl ?? 'N/A'),
                const SizedBox(height: 12),
                _buildButton(
                  'dispose - Đăng xuất và xóa dữ liệu',
                  Icons.delete_forever,
                  _logout,
                  Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
    Color? color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color ?? Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  Widget _buildButton(
    String label,
    IconData icon,
    VoidCallback onPressed,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: color.computeLuminance() > 0.5 ? Colors.black : color,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: color.computeLuminance() > 0.5
                          ? Colors.black
                          : color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }

  void _showPluginStatus(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Trạng thái Plugin'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('isInitialized', DbttPlugin.isInitialized.toString()),
            _buildInfoRow(
              'currentLocale',
              DbttPlugin.currentLocale.languageCode,
            ),
            _buildInfoRow('serverUrl', DbttPlugin.serverUrl ?? 'N/A'),
            const Divider(),
            const Text(
              'Supported Locales:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              DbttPlugin.supportedLocales.map((l) => l.languageCode).join(', '),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Đóng'),
          ),
        ],
      ),
    );
  }

  void _showUserInfo(BuildContext context) {
    final user = DbttPlugin.currentUser;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Thông tin User (currentUser)'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('Họ tên', user?.hoTen ?? 'N/A'),
            _buildInfoRow('Mã NV', user?.maNhanVien ?? 'N/A'),
            _buildInfoRow('Chức vụ', user?.chucVu ?? 'N/A'),
            _buildInfoRow('Phòng ban', user?.phongBan ?? 'N/A'),
            _buildInfoRow(
              'Access Token',
              '${user?.accessToken?.substring(0, 20)}...',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Đóng'),
          ),
        ],
      ),
    );
  }
}

//___________________________________________________________

class CustomTextFieldModel {
  final String? title;
  final FocusNode focusNode;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final String? hintText;
  final int maxLines;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final double? width;
  final VoidCallback? onTap;
  final String? suffixIcon;
  final String? subTitle;
  final String? subTitle2;

  /// true = không cho nhập, chỉ hiển thị giá trị
  bool readOnly;

  /// Icon widget để hiển thị ở cuối textfield (ví dụ: icon check)
  Widget? suffixIconWidget;

  /// Stream để cập nhật suffixIconWidget (cho check chì góc)
  Stream<Widget?>? suffixIconStream;

  CustomTextFieldModel({
    this.title,
    required this.focusNode,
    required this.controller,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction,
    this.hintText,
    this.maxLines = 1,
    this.onSubmitted,
    this.onChanged,
    this.width,
    this.onTap,
    this.suffixIcon,
    this.subTitle,
    this.subTitle2,
    this.readOnly = false,
    this.suffixIconWidget,
    this.suffixIconStream,
  });

  void dispose() {
    focusNode.dispose();
    controller.dispose();
  }
}

class CustomTextField extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final String? hintText;
  final int maxLines;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final double? width;
  final VoidCallback? onTap;
  final String? suffixIcon;
  final Icon? suffixIconData;
  final Widget? suffixWidget;
  final TextStyle? hintStyle;
  final bool readOnly;

  CustomTextField({
    super.key,
    required this.focusNode,
    required this.controller,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction,
    this.hintText,
    this.maxLines = 1,
    this.onSubmitted,
    this.onChanged,
    this.width,
    this.onTap,
    this.suffixIcon,
    this.suffixIconData,
    this.suffixWidget,
    this.hintStyle,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget field = TextField(
      onTap: () {
        if (onTap != null) onTap!();
      },
      readOnly: readOnly || onTap != null,
      focusNode: focusNode,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.darkGrey, width: 0.7),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 0.7),
        ),
        isDense: true,

        contentPadding: EdgeInsets.symmetric(vertical: AppSizes.minPadding),
        hintText: hintText,
        hintStyle:
            hintStyle ??
            TextStyle(
              color: AppColors.hint,
              fontSize: AppTextSizes.subBody.value,
            ),
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: AppSizes.minPadding / 2),
                child: Image.asset(
                  suffixIcon!,
                  width: AppSizes.icon,
                  height: AppSizes.icon,
                ),
              )
            : suffixWidget != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: AppSizes.minPadding / 2),
                child: suffixWidget,
              )
            : suffixIconData != null
            ? suffixIconData
            : null,
        suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      ),
      style: TextStyle(
        fontSize: AppTextSizes.body.value,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      maxLines: maxLines,
      minLines: 1,
      inputFormatters: inputFormatters,
      onSubmitted: onSubmitted,
      onChanged: onChanged,
    );

    if (width != null) {
      return SizedBox(width: width, child: field);
    }

    return field;
  }
}
