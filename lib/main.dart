import 'package:flutter/material.dart';

void main() {
  runApp(const FeedSafeApp());
}

// ============================================================
// APP
// ============================================================

class FeedSafeApp extends StatelessWidget {
  const FeedSafeApp({super.key});

  static const Color green = Color(0xFF2E7D32);
  static const Color background = Color(0xFFF6F8F5);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FeedSafe',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: green,
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
      ),
      home: const FeedSafeHome(),
    );
  }
}

// ============================================================
// HOME
// ============================================================

class FeedSafeHome extends StatelessWidget {
  const FeedSafeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FeedSafeApp.background,
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.camera_alt_outlined),
            selectedIcon: Icon(Icons.camera_alt),
            label: 'Scan',
          ),
          NavigationDestination(
            icon: Icon(Icons.history_outlined),
            selectedIcon: Icon(Icons.history),
            label: 'History',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 28),

              const Text(
                'Good morning 👋',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF202520),
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Check your feed quality in minutes.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF68736A),
                ),
              ),

              const SizedBox(height: 22),

              _buildScanCard(context),

              const SizedBox(height: 26),

              const Text(
                'Quick Tests',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF202520),
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: QuickTestCard(
                      icon: Icons.grass,
                      title: 'Silage',
                      subtitle: 'Fermentation',
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: QuickTestCard(
                      icon: Icons.science_outlined,
                      title: 'pH Check',
                      subtitle: 'Strip reader',
                      onTap: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 26),

              const Text(
                'Recent Batch',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF202520),
                ),
              ),

              const SizedBox(height: 12),

              _buildRecentBatch(),

              const SizedBox(height: 22),

              _buildPassportShortcut(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFE8F5E9),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(
            Icons.eco,
            color: FeedSafeApp.green,
            size: 28,
          ),
        ),

        const SizedBox(width: 12),

        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FeedSafe',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF202520),
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Smart feed quality assistant',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF748077),
                ),
              ),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 7,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFE8F5E9),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.cloud_off,
                size: 14,
                color: FeedSafeApp.green,
              ),
              SizedBox(width: 5),
              Text(
                'Offline ready',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: FeedSafeApp.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildScanCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF2E7D32),
            Color(0xFF388E3C),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2E7D32).withOpacity(0.20),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.auto_awesome,
              color: Colors.white,
              size: 25,
            ),
          ),

          const SizedBox(height: 18),

          const Text(
            'Test your feed',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'AI-powered visual screening for feed quality, '
            'adulteration and contamination risks.',
            style: TextStyle(
              fontSize: 13,
              height: 1.5,
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const GuidedCapturePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: FeedSafeApp.green,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt_outlined),
                  SizedBox(width: 8),
                  Text(
                    'Start Feed Scan',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentBatch() {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE4E9E5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.grass,
              color: FeedSafeApp.green,
            ),
          ),

          const SizedBox(width: 13),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Maize silage',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'FS-2026-00421 • Today',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF7A817B),
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'GOOD',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: FeedSafeApp.green,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPassportShortcut(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const FeedPassportPage(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xFF1B5E20),
          borderRadius: BorderRadius.circular(22),
        ),
        child: const Row(
          children: [
            Icon(
              Icons.qr_code_2,
              color: Colors.white,
              size: 35,
            ),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Digital Feed Passport',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Trace and share your feed screening record.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white70,
              size: 17,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// QUICK TEST CARD
// ============================================================

class QuickTestCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const QuickTestCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFFE4E9E5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(
                icon,
                color: FeedSafeApp.green,
                size: 22,
              ),
            ),

            const SizedBox(height: 13),

            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 3),

            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF7A817B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// GUIDED CAPTURE
// ============================================================

class GuidedCapturePage extends StatefulWidget {
  const GuidedCapturePage({super.key});

  @override
  State<GuidedCapturePage> createState() => _GuidedCapturePageState();
}

class _GuidedCapturePageState extends State<GuidedCapturePage> {
  bool lightingGood = false;
  bool focusGood = true;
  bool distanceGood = true;
  bool referenceGood = false;
  bool checking = false;

  int checkRun = 0;

  bool get allReady =>
      lightingGood &&
      focusGood &&
      distanceGood &&
      referenceGood;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 600),
      runGuidedCheck,
    );
  }

  Future<void> runGuidedCheck() async {
    final int currentRun = ++checkRun;

    setState(() {
      checking = true;
      lightingGood = false;
      referenceGood = false;
    });

    await Future.delayed(const Duration(milliseconds: 800));

    if (!mounted || currentRun != checkRun) return;

    setState(() {
      lightingGood = true;
    });

    await Future.delayed(const Duration(milliseconds: 650));

    if (!mounted || currentRun != checkRun) return;

    setState(() {
      referenceGood = true;
    });

    await Future.delayed(const Duration(milliseconds: 450));

    if (!mounted || currentRun != checkRun) return;

    setState(() {
      checking = false;
    });
  }

  void captureSample() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AIAnalysisPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111512),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111512),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Guided Feed Capture',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: runGuidedCheck,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(
                      18,
                      12,
                      18,
                      18,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF536B45),
                          Color(0xFF8B7651),
                          Color(0xFF3F5139),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.grass,
                        size: 95,
                        color: Colors.white24,
                      ),
                    ),
                  ),

                  Positioned.fill(
                    child: CustomPaint(
                      painter: ScanFramePainter(),
                    ),
                  ),

                  Positioned(
                    top: 30,
                    left: 32,
                    right: 32,
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        _StatusChip(
                          icon: checking
                              ? Icons.auto_awesome
                              : Icons.check_circle,
                          label: checking
                              ? 'AI CHECKING...'
                              : 'READY TO CAPTURE',
                          active: !checking,
                        ),
                        const _StatusChip(
                          icon: Icons.photo_camera_outlined,
                          label: 'SAMPLE',
                          active: false,
                        ),
                      ],
                    ),
                  ),

                  const Positioned(
                    bottom: 38,
                    left: 30,
                    right: 30,
                    child: Text(
                      'Place the feed sample inside the frame',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        shadows: [
                          Shadow(
                            blurRadius: 8,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(
                22,
                20,
                22,
                24,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFFF7F8F6),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Capture quality',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'FeedSafe checks the image before AI analysis.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF737B74),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: CaptureCheckItem(
                          title: 'Lighting',
                          good: lightingGood,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CaptureCheckItem(
                          title: 'Focus',
                          good: focusGood,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: CaptureCheckItem(
                          title: 'Distance',
                          good: distanceGood,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CaptureCheckItem(
                          title: 'Reference',
                          good: referenceGood,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  SizedBox(
                    width: double.infinity,
                    height: 53,
                    child: ElevatedButton(
                      onPressed: allReady ? captureSample : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: FeedSafeApp.green,
                        foregroundColor: Colors.white,
                        disabledBackgroundColor:
                            const Color(0xFFD8DDD9),
                        disabledForegroundColor:
                            const Color(0xFF8A928C),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        allReady
                            ? 'Capture Sample'
                            : 'Checking Capture Quality...',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// STATUS CHIP
// ============================================================

class _StatusChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;

  const _StatusChip({
    required this.icon,
    required this.label,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.35),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: active
                ? const Color(0xFF8EF28F)
                : Colors.white70,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// AI ANALYSIS
// ============================================================

class AIAnalysisPage extends StatefulWidget {
  const AIAnalysisPage({super.key});

  @override
  State<AIAnalysisPage> createState() => _AIAnalysisPageState();
}

class _AIAnalysisPageState extends State<AIAnalysisPage> {
  int currentStep = 0;
  double progress = 0;

  final List<String> steps = [
    'IMAGE CAPTURED',
    'AI ANALYZING',
    'QUALITY ENGINE',
    'RISK SCREENING',
  ];

  final List<IconData> icons = [
    Icons.image_outlined,
    Icons.auto_awesome,
    Icons.memory_outlined,
    Icons.shield_outlined,
  ];

  @override
  void initState() {
    super.initState();
    startAnalysis();
  }

  Future<void> startAnalysis() async {
    for (int i = 0; i < steps.length; i++) {
      if (!mounted) return;

      setState(() {
        currentStep = i;
        progress = (i + 1) / steps.length;
      });

      await Future.delayed(
        const Duration(milliseconds: 1100),
      );
    }

    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const ScreeningResultPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101410),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            24,
            45,
            24,
            28,
          ),
          child: Column(
            children: [
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  color: const Color(0xFF1D3B21),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: const Icon(
                  Icons.eco,
                  color: Color(0xFF81C784),
                  size: 36,
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'FeedSafe AI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                steps[currentStep],
                style: const TextStyle(
                  color: Color(0xFF81C784),
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.3,
                ),
              ),

              const SizedBox(height: 28),

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 7,
                  backgroundColor: Colors.white12,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(
                    Color(0xFF66BB6A),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              Expanded(
                child: Column(
                  children: List.generate(
                    steps.length,
                    (index) {
                      return AnalysisStep(
                        title: steps[index],
                        icon: icons[index],
                        completed: index < currentStep,
                        active: index == currentStep,
                      );
                    },
                  ),
                ),
              ),

              const Icon(
                Icons.lock_outline,
                color: Colors.white38,
                size: 18,
              ),

              const SizedBox(height: 8),

              const Text(
                'Running local rapid screening engine...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Rapid screening result • Laboratory confirmation '
                'may be required',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 10,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// ANALYSIS STEP
// ============================================================

class AnalysisStep extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool completed;
  final bool active;

  const AnalysisStep({
    super.key,
    required this.title,
    required this.icon,
    required this.completed,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    final Color iconColor = completed || active
        ? const Color(0xFF81C784)
        : Colors.white30;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: active
            ? const Color(0xFF1B241C)
            : const Color(0xFF171B17),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: active
              ? const Color(0xFF37683B)
              : Colors.white10,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: active || completed
                  ? const Color(0xFF244A28)
                  : Colors.white10,
              shape: BoxShape.circle,
            ),
            child: completed
                ? const Icon(
                    Icons.check,
                    color: Color(0xFF81C784),
                  )
                : Icon(
                    icon,
                    color: iconColor,
                    size: 21,
                  ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: active || completed
                    ? Colors.white
                    : Colors.white38,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ),

          if (active)
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Color(0xFF81C784),
              ),
            )
          else if (completed)
            const Icon(
              Icons.check_circle,
              color: Color(0xFF66BB6A),
              size: 20,
            ),
        ],
      ),
    );
  }
}

// ============================================================
// SCREENING RESULT
// ============================================================

class ScreeningResultPage extends StatelessWidget {
  const ScreeningResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F8F5),
        elevation: 0,
        title: const Text(
          'Screening Result',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Color(0xFF202520),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.popUntil(
              context,
              (route) => route.isFirst,
            );
          },
          icon: const Icon(
            Icons.close,
            color: Color(0xFF202520),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            20,
            8,
            20,
            30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRiskHeader(),

              const SizedBox(height: 22),

              const Text(
                'Quality Indicators',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 12),

              const IndicatorCard(
                title: 'Moisture',
                value: 'High',
                subtitle: 'Estimated screening indicator',
                icon: Icons.water_drop_outlined,
                status: IndicatorStatus.warning,
              ),

              const SizedBox(height: 10),

              const IndicatorCard(
                title: 'Mould Risk',
                value: 'Elevated',
                subtitle:
                    'Visual contamination indicators detected',
                icon: Icons.blur_on,
                status: IndicatorStatus.danger,
              ),

              const SizedBox(height: 10),

              const IndicatorCard(
                title: 'pH',
                value: 'Above target range',
                subtitle: 'Fermentation screening indicator',
                icon: Icons.science_outlined,
                status: IndicatorStatus.warning,
              ),

              const SizedBox(height: 10),

              const IndicatorCard(
                title: 'Sand / Silica',
                value: 'Possible',
                subtitle:
                    'Visual screening requires confirmation',
                icon: Icons.grain,
                status: IndicatorStatus.warning,
              ),

              const SizedBox(height: 24),

              const Text(
                'Explainable AI',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 12),

              const ContributorCard(
                icon: Icons.water_drop_outlined,
                title: 'High moisture indicator',
                explanation:
                    'Higher moisture can increase storage '
                    'and spoilage risk.',
                strength: 0.88,
              ),

              const SizedBox(height: 10),

              const ContributorCard(
                icon: Icons.blur_on,
                title: 'Mould-like visual pattern',
                explanation:
                    'Image features show patterns associated '
                    'with possible mould contamination.',
                strength: 0.76,
              ),

              const SizedBox(height: 10),

              const ContributorCard(
                icon: Icons.science_outlined,
                title: 'Fermentation concern',
                explanation:
                    'The available pH screening input is '
                    'outside the preferred range.',
                strength: 0.64,
              ),

              const SizedBox(height: 22),

              _buildAdvisory(),

              const SizedBox(height: 18),

              _buildDisclaimer(),

              const SizedBox(height: 22),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const FeedPassportPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.qr_code_2),
                  label: const Text(
                    'Create Digital Feed Passport',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: FeedSafeApp.green,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const GuidedCapturePage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text(
                    'Test Another Sample',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: FeedSafeApp.green,
                    side: const BorderSide(
                      color: FeedSafeApp.green,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRiskHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFC62828),
            Color(0xFFE53935),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFC62828).withOpacity(0.18),
            blurRadius: 20,
            offset: const Offset(0, 9),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.warning_amber_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),

          const SizedBox(height: 18),

          const Text(
            'HIGH RISK',
            style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Rapid screening indicates quality concerns',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 18),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 13,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.14),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.analytics_outlined,
                  color: Colors.white70,
                  size: 18,
                ),
                SizedBox(width: 8),
                Text(
                  'Screening score 34 / 100',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdvisory() {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFFFE082),
        ),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.tips_and_updates_outlined,
            color: Color(0xFFB26A00),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Farmer Advisory',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF6D5200),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Do not use this batch as the sole basis for '
                  'feeding decisions. Isolate the batch and '
                  'consider laboratory confirmation before use.',
                  style: TextStyle(
                    fontSize: 12.5,
                    height: 1.45,
                    color: Color(0xFF6D5200),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisclaimer() {
    return const Text(
      'FeedSafe provides rapid screening and decision support. '
      'It does not replace laboratory testing for definitive '
      'contaminant confirmation.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 11,
        height: 1.45,
        color: Color(0xFF7A817B),
      ),
    );
  }
}

// ============================================================
// INDICATORS
// ============================================================

enum IndicatorStatus {
  good,
  warning,
  danger,
}

class IndicatorCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final IndicatorStatus status;

  const IndicatorCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.status,
  });

  Color get statusColor {
    switch (status) {
      case IndicatorStatus.good:
        return const Color(0xFF2E7D32);
      case IndicatorStatus.warning:
        return const Color(0xFFE65100);
      case IndicatorStatus.danger:
        return const Color(0xFFC62828);
    }
  }

  Color get backgroundColor {
    switch (status) {
      case IndicatorStatus.good:
        return const Color(0xFFE8F5E9);
      case IndicatorStatus.warning:
        return const Color(0xFFFFF3E0);
      case IndicatorStatus.danger:
        return const Color(0xFFFFEBEE);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE4E9E5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              icon,
              color: statusColor,
              size: 22,
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF7A817B),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: statusColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 10.5,
                    color: Color(0xFF8A928C),
                  ),
                ),
              ],
            ),
          ),

          Icon(
            status == IndicatorStatus.danger
                ? Icons.error_outline
                : Icons.warning_amber_rounded,
            color: statusColor,
            size: 20,
          ),
        ],
      ),
    );
  }
}

// ============================================================
// EXPLAINABLE AI CONTRIBUTOR
// ============================================================

class ContributorCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String explanation;
  final double strength;

  const ContributorCard({
    super.key,
    required this.icon,
    required this.title,
    required this.explanation,
    required this.strength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: const Color(0xFFE4E9E5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFEBEE),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFFC62828),
                  size: 20,
                ),
              ),

              const SizedBox(width: 11),

              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),

              Text(
                '${(strength * 100).round()}%',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFC62828),
                ),
              ),
            ],
          ),

          const SizedBox(height: 11),

          Text(
            explanation,
            style: const TextStyle(
              fontSize: 12,
              height: 1.45,
              color: Color(0xFF68736A),
            ),
          ),

          const SizedBox(height: 12),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: strength,
              minHeight: 5,
              backgroundColor: const Color(0xFFFFEBEE),
              valueColor:
                  const AlwaysStoppedAnimation<Color>(
                Color(0xFFC62828),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// CAPTURE CHECK ITEM
// ============================================================

class CaptureCheckItem extends StatelessWidget {
  final String title;
  final bool good;

  const CaptureCheckItem({
    super.key,
    required this.title,
    required this.good,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 11,
      ),
      decoration: BoxDecoration(
        color: good
            ? const Color(0xFFE8F5E9)
            : const Color(0xFFF1F3F1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(
            good
                ? Icons.check_circle
                : Icons.radio_button_unchecked,
            color: good
                ? FeedSafeApp.green
                : const Color(0xFF929992),
            size: 18,
          ),

          const SizedBox(width: 8),

          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w700,
                color: good
                    ? const Color(0xFF285D2C)
                    : const Color(0xFF737B74),
              ),
            ),
          ),

          Text(
            good ? 'OK' : 'CHECK',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w800,
              color: good
                  ? FeedSafeApp.green
                  : const Color(0xFF8A928C),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// DIGITAL FEED PASSPORT
// ============================================================

class FeedPassportPage extends StatelessWidget {
  const FeedPassportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FeedSafeApp.background,
      appBar: AppBar(
        backgroundColor: FeedSafeApp.background,
        elevation: 0,
        title: const Text(
          'Digital Feed Passport',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Color(0xFF202520),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF202520),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            20,
            10,
            20,
            30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildCreatedBanner(),

              const SizedBox(height: 20),

              _buildQrCard(),

              const SizedBox(height: 16),

              const PassportInfoCard(
                title: 'Batch Information',
                icon: Icons.inventory_2_outlined,
                children: [
                  PassportRow(
                    label: 'Feed type',
                    value: 'Maize Silage',
                  ),
                  PassportRow(
                    label: 'Batch ID',
                    value: 'FS-2026-00421',
                  ),
                  PassportRow(
                    label: 'Screening',
                    value: 'Rapid AI Screening',
                  ),
                  PassportRow(
                    label: 'Status',
                    value: 'HIGH RISK',
                    valueColor: Color(0xFFC62828),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              const PassportInfoCard(
                title: 'Screening Summary',
                icon: Icons.analytics_outlined,
                children: [
                  PassportRow(
                    label: 'Moisture',
                    value: 'High',
                    valueColor: Color(0xFFE65100),
                  ),
                  PassportRow(
                    label: 'Mould risk',
                    value: 'Elevated',
                    valueColor: Color(0xFFC62828),
                  ),
                  PassportRow(
                    label: 'pH indicator',
                    value: 'Above target',
                    valueColor: Color(0xFFE65100),
                  ),
                  PassportRow(
                    label: 'Sand / silica',
                    value: 'Possible',
                    valueColor: Color(0xFFE65100),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8E1),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0xFFFFE082),
                  ),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Color(0xFFB26A00),
                    ),
                    SizedBox(width: 11),
                    Expanded(
                      child: Text(
                        'This passport stores the rapid screening '
                        'record. It does not replace laboratory '
                        'confirmation for definitive contaminant '
                        'detection.',
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.45,
                          color: Color(0xFF6D5200),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              SizedBox(
                height: 54,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.popUntil(
                      context,
                      (route) => route.isFirst,
                    );
                  },
                  icon: const Icon(Icons.home_outlined),
                  label: const Text(
                    'Back to FeedSafe Home',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: FeedSafeApp.green,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCreatedBanner() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFFC8E6C9),
        ),
      ),
      child: const Row(
        children: [
          SizedBox(
            width: 48,
            height: 48,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: FeedSafeApp.green,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.verified,
                color: Colors.white,
                size: 27,
              ),
            ),
          ),
          SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Passport Created',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1B5E20),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Digital record generated for this feed batch.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF4F6350),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrCard() {
    return Container(
      padding: const EdgeInsets.all(23),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(27),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'SCAN TO VIEW FEED RECORD',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
              color: Color(0xFF68736A),
            ),
          ),

          const SizedBox(height: 18),

          Container(
            width: 205,
            height: 205,
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: const Color(0xFFE0E5E1),
              ),
            ),
            child: CustomPaint(
              painter: FeedPassportQrPainter(),
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            'FS-2026-00421',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            'Digital Feed Passport ID',
            style: TextStyle(
              fontSize: 11,
              color: Color(0xFF7A817B),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PASSPORT INFO CARD
// ============================================================

class PassportInfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const PassportInfoCard({
    super.key,
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFFE4E9E5),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: FeedSafeApp.green,
                size: 21,
              ),
              const SizedBox(width: 9),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),

          const SizedBox(height: 11),

          ...children,
        ],
      ),
    );
  }
}

// ============================================================
// PASSPORT ROW
// ============================================================

class PassportRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const PassportRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF727A73),
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: valueColor ??
                  const Color(0xFF202520),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// QR-STYLE PAINTER
// ============================================================

class FeedPassportQrPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final double module = size.width / 25;

    void square(int x, int y, int width, int height) {
      canvas.drawRect(
        Rect.fromLTWH(
          x * module,
          y * module,
          width * module,
          height * module,
        ),
        paint,
      );
    }

    void finder(int x, int y) {
      paint.color = Colors.black;
      square(x, y, 7, 7);

      paint.color = Colors.white;
      square(x + 1, y + 1, 5, 5);

      paint.color = Colors.black;
      square(x + 2, y + 2, 3, 3);
    }

    finder(0, 0);
    finder(18, 0);
    finder(0, 18);

    paint.color = Colors.black;

    const List<String> pattern = [
      '00101100110101001011010',
      '11010011001010110100101',
      '01100101101011001010110',
      '10110100110100101101001',
      '01001011010110100110110',
      '11011001001011010100101',
      '00110110110100110110110',
      '10101001011011001001011',
      '01101110100101101101010',
      '10010101011010100110101',
      '01101010100110110101011',
      '11010110101001011010100',
      '00101001101101010110110',
      '10110101001011010100101',
      '01011010110100101101010',
      '11001001011011010110101',
      '00110110100101011001011',
      '10101011011010100110100',
      '01100100101101011010110',
      '10011011010110100101011',
      '01010100110101011011010',
      '11001011001010110100101',
      '00110101101101001011010',
      '10101011010100110110101',
      '01100110101011001001011',
    ];

    for (int y = 0; y < pattern.length; y++) {
      for (int x = 0; x < pattern[y].length; x++) {
        if (pattern[y][x] == '1') {
          canvas.drawRect(
            Rect.fromLTWH(
              x * module,
              y * module,
              module,
              module,
            ),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(
    covariant CustomPainter oldDelegate,
  ) {
    return false;
  }
}

// ============================================================
// SCAN FRAME PAINTER
// ============================================================

class ScanFramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    const double margin = 48;
    const double length = 35;

    final double left = margin;
    final double right = size.width - margin;
    final double top = 75;
    final double bottom = size.height - 75;

    // Top-left
    canvas.drawLine(
      Offset(left, top),
      Offset(left + length, top),
      paint,
    );
    canvas.drawLine(
      Offset(left, top),
      Offset(left, top + length),
      paint,
    );

    // Top-right
    canvas.drawLine(
      Offset(right, top),
      Offset(right - length, top),
      paint,
    );
    canvas.drawLine(
      Offset(right, top),
      Offset(right, top + length),
      paint,
    );

    // Bottom-left
    canvas.drawLine(
      Offset(left, bottom),
      Offset(left + length, bottom),
      paint,
    );
    canvas.drawLine(
      Offset(left, bottom),
      Offset(left, bottom - length),
      paint,
    );

    // Bottom-right
    canvas.drawLine(
      Offset(right, bottom),
      Offset(right - length, bottom),
      paint,
    );
    canvas.drawLine(
      Offset(right, bottom),
      Offset(right, bottom - length),
      paint,
    );
  }

  @override
  bool shouldRepaint(
    covariant CustomPainter oldDelegate,
  ) {
    return false;
  }
}