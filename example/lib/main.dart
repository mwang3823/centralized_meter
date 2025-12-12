import 'package:dbtt/dbtt.dart';
import 'package:flutter/material.dart';
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
      // Thêm localization delegates cho plugin
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
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    // Default values for testing
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _serverController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        _errorMessage = 'Vui long nhap username va password';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Goi DbttPlugin.init() voi login
      final user = await DbttPlugin.init(
        username: _usernameController.text,
        password: _passwordController.text,
        server: _serverController.text,
        displayPrint: true,
      );

      if (mounted) {
        // Chuyen sang trang demo
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

            // Server URL
            TextField(
              controller: _serverController,
              decoration: const InputDecoration(
                labelText: 'Server URL',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.cloud),
              ),
            ),
            const SizedBox(height: 16),

            // Username
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),

            // Password
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

            // Error message
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

            // Login button
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
                    : const Text('Dang nhap', style: TextStyle(fontSize: 16)),
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
  String _selectedSearchType = 'danhbo';
  List<CustomerListModel> _searchResults = [];
  bool _isSearching = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _search() async {
    if (_searchController.text.isEmpty) return;

    setState(() {
      _isSearching = true;
    });

    try {
      DbttPlugin.searchCustomer(
        context,
        keyword: _searchController.text,
        searchType: _selectedSearchType,
      );
      setState(() {
        // _searchResults = result.items ?? [];
      });
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
            icon: const Icon(Icons.person),
            onPressed: () => _showUserInfo(context),
          ),
          IconButton(icon: const Icon(Icons.logout), onPressed: _logout),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Section 1: Navigation buttons
            _buildSection(
              title: 'Navigation',
              children: [
                _buildButton(
                  'Báo cáo tổng quan',
                  Icons.dashboard,
                  () => DbttPlugin.pushOverviewReport(context),
                ),
                _buildButton(
                  'Tra cứu danh bạ',
                  Icons.search,
                  () => DbttPlugin.pushLookupScreen(context),
                ),
                _buildButton(
                  'Báo cáo so sánh',
                  Icons.compare_arrows,
                  () => DbttPlugin.pushComparisonReport(context),
                ),
                _buildButton(
                  'Index 2',
                  Icons.account_box_sharp,
                  () => DbttPlugin.pushContactDetailWithTab(context,'04011011171', 2 ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Section 2: Search customer
            _buildSection(
              title: 'Tim kiem khach hang',
              children: [
                // Search type dropdown
                DropdownButtonFormField<String>(
                  initialValue: _selectedSearchType,
                  decoration: const InputDecoration(
                    labelText: 'Loai tim kiem',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'danhbo', child: Text('Danh bo')),
                    DropdownMenuItem(value: 'hoten', child: Text('Ho ten')),
                    DropdownMenuItem(value: 'lotrinh', child: Text('Lo trinh')),
                    DropdownMenuItem(value: 'diachi', child: Text('Dia chi')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedSearchType = value!;
                    });
                  },
                ),
                const SizedBox(height: 12),

                // Search input
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          labelText: 'Tu khoa',
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
                        child: _isSearching
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text('Tim'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Search results
                if (_searchResults.isNotEmpty) ...[
                  Text(
                    'Ket qua: ${_searchResults.length} khach hang',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _searchResults.length > 5
                        ? 5
                        : _searchResults.length,
                    itemBuilder: (context, index) {
                      final customer = _searchResults[index];
                      return Card(
                        child: ListTile(
                          title: Text(customer.hoTen ?? 'N/A'),
                          subtitle: Text(
                            'Danh bo: ${customer.danhBo ?? 'N/A'}\n'
                            'Dia chi: ${customer.diaChi ?? 'N/A'}',
                          ),
                          isThreeLine: true,
                          trailing: PopupMenuButton<int>(
                            icon: const Icon(Icons.more_vert),
                            onSelected: (tabIndex) {
                              DbttPlugin.pushContactDetailWithTab(
                                context,
                                tabIndex,
                              );
                            },
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 0,
                                child: Text('Tong quan'),
                              ),
                              const PopupMenuItem(
                                value: 1,
                                child: Text('Lich su thanh toan'),
                              ),
                              const PopupMenuItem(
                                value: 2,
                                child: Text('Chi so tieu thu'),
                              ),
                              const PopupMenuItem(
                                value: 3,
                                child: Text('Dong/Mo nuoc'),
                              ),
                              const PopupMenuItem(
                                value: 4,
                                child: Text('Lap moi'),
                              ),
                            ],
                          ),
                          onTap: () {
                            // DbttPlugin.pushContactDetail(context, customer);
                          },
                        ),
                      );
                    },
                  ),
                ],
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
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildButton(String label, IconData icon, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }

  void _showUserInfo(BuildContext context) {
    final user = DbttPlugin.currentUser;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Thong tin User'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ho ten: ${user?.hoTen ?? "N/A"}'),
            Text('Ma NV: ${user?.maNhanVien ?? "N/A"}'),
            Text('Chuc vu: ${user?.chucVu ?? "N/A"}'),
            Text('Phong ban: ${user?.phongBan ?? "N/A"}'),
            const Divider(),
            Text('Server: ${DbttPlugin.serverUrl ?? "N/A"}'),
            Text('Locale: ${DbttPlugin.currentLocale.languageCode}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Dong'),
          ),
        ],
      ),
    );
  }
}
