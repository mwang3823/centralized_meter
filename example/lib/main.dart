import 'package:dbtt/common/theme.dart';
import 'package:dbtt/dbtt.dart';
import 'package:flutter/material.dart';

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
      home: const LoginSimulatorPage(),
    );
  }
}

class LoginSimulatorPage extends StatefulWidget {
  const LoginSimulatorPage({super.key});

  @override
  State<LoginSimulatorPage> createState() => _LoginSimulatorPageState();
}

class _LoginSimulatorPageState extends State<LoginSimulatorPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Host App - Login'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              const Icon(Icons.water_drop, size: 80, color: Colors.blue),
              const SizedBox(height: 24),

              // Title
              Text(
                'DBTT Plugin Example',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFonts.montserrat,
                ),
              ),
              const SizedBox(height: 8),

              // Subtitle
              Text(
                'Day la app gia lap de test plugin DBTT',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: AppFonts.montserrat,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),

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
                    style: TextStyle(
                      color: Colors.red.shade700,
                      fontFamily: AppFonts.montserrat,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Login button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _simulateLoginAndInitPlugin,
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
                      : Text(
                          'Dang nhap & Mo Plugin',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppFonts.montserrat,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 16),

              // Info text
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Khi nhan nut, app se:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFonts.montserrat,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('1. Gia lap login thanh cong'),
                    Text('2. Goi DbttPlugin.init() voi tokens'),
                    Text('3. Hien thi MainScreen cua plugin'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Trang boc MainScreen cua plugin
class PluginWrapperPage extends StatelessWidget {
  const PluginWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DBTT Module'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          // Hien thi thong tin user
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              _showUserInfo(context);
            },
          ),
          // Logout
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _logout(context);
            },
          ),
        ],
      ),
      body: DbttPlugin.getMainScreen(),
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

  void _logout(BuildContext context) {
    // Goi dispose de reset plugin
    DbttPlugin.dispose();

    // Quay ve trang login
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
