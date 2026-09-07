import 'package:flutter/material.dart';

class ScaffoldBasicsApp extends StatelessWidget {
  const ScaffoldBasicsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scaffold Basics',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const ScaffoldShowcasePage(),
    );
  }
}

class ScaffoldShowcasePage extends StatefulWidget {
  const ScaffoldShowcasePage({super.key});

  @override
  State<ScaffoldShowcasePage> createState() => _ScaffoldShowcasePageState();
}

class _ScaffoldShowcasePageState extends State<ScaffoldShowcasePage> {
  final TextEditingController _nameController = TextEditingController();
  int _selectedIndex = 0;
  int _actionCount = 0;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _recordAction() {
    setState(() {
      _actionCount++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Action recorded successfully.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sections = <Widget>[
      _buildOverview(),
      _buildWidgetsGuide(),
      _buildAbout(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaffold Basics Showcase'),
        actions: [
          IconButton(
            tooltip: 'About this demo',
            onPressed: () => showAboutDialog(
              context: context,
              applicationName: 'Scaffold Basics',
              applicationVersion: '2.0.0',
              children: const [
                Text('A small Flutter project demonstrating common Scaffold patterns.'),
              ],
            ),
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.dashboard_customize_outlined, size: 40),
                    SizedBox(height: 12),
                    Text('Scaffold Basics', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    Text('Flutter UI learning project'),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Overview'),
                selected: _selectedIndex == 0,
                onTap: () {
                  setState(() => _selectedIndex = 0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.widgets_outlined),
                title: const Text('Widgets'),
                selected: _selectedIndex == 1,
                onTap: () {
                  setState(() => _selectedIndex = 1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('About'),
                selected: _selectedIndex == 2,
                onTap: () {
                  setState(() => _selectedIndex = 2);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(child: sections[_selectedIndex]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _recordAction,
        icon: const Icon(Icons.add),
        label: const Text('Try action'),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.widgets_outlined), selectedIcon: Icon(Icons.widgets), label: 'Widgets'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'About'),
        ],
      ),
    );
  }

  Widget _buildOverview() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          'Learn the building blocks of a Flutter screen',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'This demo combines an AppBar, Drawer, cards, form input, a floating action button, SnackBar feedback, and bottom navigation in one small project.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        _FeatureCard(
          icon: Icons.edit_outlined,
          title: 'Interactive input',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Your name',
                  hintText: 'Type something here',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: () {
                  final name = _nameController.text.trim();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(name.isEmpty ? 'Enter your name first.' : 'Welcome, $name!')),
                  );
                },
                icon: const Icon(Icons.send_outlined),
                label: const Text('Show message'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _FeatureCard(
          icon: Icons.touch_app_outlined,
          title: 'Working actions',
          child: Text('Actions performed: $_actionCount'),
        ),
        const SizedBox(height: 16),
        const _FeatureCard(
          icon: Icons.phone_android_outlined,
          title: 'Responsive layout',
          child: Text('The content uses scrollable, padded Material widgets so the demo remains usable on different screen sizes.'),
        ),
      ],
    );
  }

  Widget _buildWidgetsGuide() {
    const widgets = [
      ('AppBar', 'Top-level navigation and page actions.', Icons.web_asset_outlined),
      ('Drawer', 'Secondary navigation accessible from the menu icon.', Icons.menu_open_outlined),
      ('Card', 'Groups related content into clear visual sections.', Icons.credit_card_outlined),
      ('FloatingActionButton', 'Highlights the main action on the screen.', Icons.add_circle_outline),
      ('NavigationBar', 'Switches between the main areas of the demo.', Icons.navigation_outlined),
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: widgets.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = widgets[index];
        return ListTile(
          leading: CircleAvatar(child: Icon(item.$3)),
          title: Text(item.$1),
          subtitle: Text(item.$2),
          tileColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        );
      },
    );
  }

  Widget _buildAbout() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Icon(Icons.flutter_dash, size: 72),
        const SizedBox(height: 16),
        Text(
          'Scaffold Basics',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        const Text(
          'A compact learning project that demonstrates practical Flutter layout, navigation, input, and feedback patterns using Material 3.',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({required this.icon, required this.title, required this.child});

  final IconData icon;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(width: 10),
                Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 14),
            child,
          ],
        ),
      ),
    );
  }
}
