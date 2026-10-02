import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const FeedSafeApp());
}

class FeedSafeApp extends StatelessWidget {
  const FeedSafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FeedSafe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32),
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F8F5),
        fontFamily: 'Arial',
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

  void _startScan(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const SampleInputPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            label: 'Scan',
          ),
          NavigationDestination(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                      color: Color(0xFF2E7D32),
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
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Smart feed quality assistant',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 13,
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
                      children: [
                        Icon(
                          Icons.wifi_off,
                          size: 15,
                          color: Color(0xFF2E7D32),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Offline ready',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF2E7D32),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              const Text(
                'Good morning 👋',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Check your feed quality in minutes.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 22),

              // MAIN SCAN CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF2E7D32),
                      Color(0xFF43A047),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(26),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.18),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.document_scanner_outlined,
                      color: Colors.white,
                      size: 38,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Test your feed',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'AI-powered visual screening for feed quality, adulteration and contamination risks.',
                      style: TextStyle(
                        color: Colors.white70,
                        height: 1.45,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: () => _startScan(context),
                        icon: const Icon(Icons.camera_alt),
                        label: const Text('Start Feed Scan'),
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF2E7D32),
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 26),

              const Text(
                'Quick tests',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 14),

              Row(
                children: const [
                  Expanded(
                    child: QuickTestCard(
                      icon: Icons.grass,
                      title: 'Silage',
                      subtitle: 'Fermentation screening',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: QuickTestCard(
                      icon: Icons.science_outlined,
                      title: 'pH Check',
                      subtitle: 'Strip reader',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 26),

              const Text(
                'Recent batch',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.06),
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
                        color: Color(0xFF2E7D32),
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
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'FS-2026-00421 • Today',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
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
                          color: Color(0xFF2E7D32),
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const FeedPassportPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.qr_code_2),
                label: const Text('Digital Feed Passport'),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuickTestCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const QuickTestCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.black.withOpacity(0.06),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFF2E7D32),
            size: 28,
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SAMPLE INPUT
// ============================================================

class SampleInputPage extends StatefulWidget {
  const SampleInputPage({super.key});

  @override
  State<SampleInputPage> createState() => _SampleInputPageState();
}

class _SampleInputPageState extends State<SampleInputPage> {
  final ImagePicker _picker = ImagePicker();
  bool _loading = false;

  Future<void> _pickImage(ImageSource source) async {
    setState(() {
      _loading = true;
    });

    try {
      final XFile? file = await _picker.pickImage(
        source: source,
        imageQuality: 88,
        maxWidth: 1600,
      );

      if (file == null) {
        setState(() {
          _loading = false;
        });
        return;
      }

      final Uint8List bytes = await file.readAsBytes();

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => SamplePreviewPage(
            imageBytes: bytes,
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Unable to access the image. Please try again.',
          ),
        ),
      );
    }

    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Feed Sample'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 12),

            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(
                Icons.add_a_photo_outlined,
                size: 48,
                color: Color(0xFF2E7D32),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Add your feed sample',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Upload or capture a clear image of the feed or silage sample for rapid screening.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),

            if (_loading)
              const Padding(
                padding: EdgeInsets.all(30),
                child: CircularProgressIndicator(),
              )
            else ...[
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  icon: const Icon(Icons.photo_library_outlined),
                  label: const Text('Upload from Gallery'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 17,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => _pickImage(ImageSource.camera),
                  icon: const Icon(Icons.camera_alt_outlined),
                  label: const Text('Take Photo'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 17,
                    ),
                  ),
                ),
              ),
            ],

            const SizedBox(height: 28),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8E1),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.lightbulb_outline,
                    color: Color(0xFFF57F17),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Demo tip: use a clear maize-silage/feed image with visible quality concerns so the visual sample matches the screening result shown later.',
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.45,
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
// SAMPLE PREVIEW
// ============================================================

class SamplePreviewPage extends StatelessWidget {
  final Uint8List imageBytes;

  const SamplePreviewPage({
    super.key,
    required this.imageBytes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Preview'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sample captured',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 7),

            const Text(
              'Review the image before starting the rapid screening workflow.',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 20),

            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: Image.memory(
                  imageBytes,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 18),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Color(0xFF2E7D32),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Image ready for the FeedSafe screening workflow.',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => GuidedCapturePage(
                        imageBytes: imageBytes,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Continue to Quality Check'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// GUIDED CAPTURE / QUALITY CHECK
// ============================================================

class GuidedCapturePage extends StatefulWidget {
  final Uint8List imageBytes;

  const GuidedCapturePage({
    super.key,
    required this.imageBytes,
  });

  @override
  State<GuidedCapturePage> createState() => _GuidedCapturePageState();
}

class _GuidedCapturePageState extends State<GuidedCapturePage> {
  bool lightingGood = false;
  bool focusGood = false;
  bool distanceGood = false;
  bool referenceGood = false;

  bool checking = true;
  int checkRun = 0;

  bool get allReady =>
      lightingGood &&
      focusGood &&
      distanceGood &&
      referenceGood;

  @override
  void initState() {
    super.initState();
    _runChecks();
  }

  Future<void> _runChecks() async {
    final int run = ++checkRun;

    setState(() {
      checking = true;
      lightingGood = false;
      focusGood = false;
      distanceGood = false;
      referenceGood = false;
    });

    await Future.delayed(const Duration(milliseconds: 450));
    if (!mounted || run != checkRun) return;
    setState(() => lightingGood = true);

    await Future.delayed(const Duration(milliseconds: 450));
    if (!mounted || run != checkRun) return;
    setState(() => focusGood = true);

    await Future.delayed(const Duration(milliseconds: 450));
    if (!mounted || run != checkRun) return;
    setState(() => distanceGood = true);

    await Future.delayed(const Duration(milliseconds: 450));
    if (!mounted || run != checkRun) return;
    setState(() {
      referenceGood = true;
      checking = false;
    });
  }

  void _startAnalysis() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AIAnalysisPage(
          imageBytes: widget.imageBytes,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guided Sample Check'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Check sample quality',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'FeedSafe checks the sample image before screening.',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 18),

            Container(
              height: 260,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.black12,
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.memory(
                    widget.imageBytes,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: allReady
                            ? Colors.greenAccent
                            : Colors.white70,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  Positioned(
                    top: 14,
                    left: 14,
                    child: _StatusChip(
                      text: checking
                          ? 'AI CHECKING'
                          : 'READY TO SCREEN',
                      color: checking
                          ? Colors.orange
                          : Colors.green,
                    ),
                  ),
                  if (allReady)
                    Positioned(
                      right: 14,
                      bottom: 14,
                      child: _StatusChip(
                        text: 'SAMPLE READY',
                        color: Colors.green,
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              'Capture quality',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            CaptureCheckItem(
              icon: Icons.wb_sunny_outlined,
              title: 'Lighting',
              subtitle: 'Sample is sufficiently visible',
              completed: lightingGood,
            ),

            CaptureCheckItem(
              icon: Icons.center_focus_strong,
              title: 'Focus',
              subtitle: 'Feed texture is visible',
              completed: focusGood,
            ),

            CaptureCheckItem(
              icon: Icons.straighten,
              title: 'Distance',
              subtitle: 'Sample occupies enough of the frame',
              completed: distanceGood,
            ),

            CaptureCheckItem(
              icon: Icons.crop_free,
              title: 'Reference',
              subtitle: 'Image framing is suitable',
              completed: referenceGood,
            ),

            const SizedBox(height: 14),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: allReady ? _startAnalysis : null,
                icon: const Icon(Icons.analytics_outlined),
                label: const Text('Run Feed Screening'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String text;
  final Color color;

  const _StatusChip({
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.65),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 7),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
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
  final Uint8List imageBytes;

  const AIAnalysisPage({
    super.key,
    required this.imageBytes,
  });

  @override
  State<AIAnalysisPage> createState() => _AIAnalysisPageState();
}

class _AIAnalysisPageState extends State<AIAnalysisPage> {
  int currentStep = 0;

  final List<String> steps = const [
    'IMAGE CAPTURED',
    'AI ANALYZING',
    'QUALITY ENGINE',
    'RISK SCREENING',
  ];

  @override
  void initState() {
    super.initState();
    _startSequence();
  }

  Future<void> _startSequence() async {
    for (int i = 0; i < steps.length; i++) {
      await Future.delayed(const Duration(milliseconds: 950));

      if (!mounted) return;

      setState(() {
        currentStep = i;
      });
    }

    await Future.delayed(const Duration(milliseconds: 900));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ScreeningResultPage(
          imageBytes: widget.imageBytes,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double progress =
        (currentStep + 1) / steps.length;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('AI Feed Screening'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 160,
                width: double.infinity,
                child: Image.memory(
                  widget.imageBytes,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Analyzing your sample',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'FeedSafe is running a rapid screening workflow.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 28),

            LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              borderRadius: BorderRadius.circular(20),
            ),

            const SizedBox(height: 25),

            ...List.generate(
              steps.length,
              (index) => AnalysisStep(
                title: steps[index],
                active: index == currentStep,
                completed: index < currentStep,
              ),
            ),

            const Spacer(),

            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8E1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Color(0xFFF57F17),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Rapid screening and decision support. Laboratory confirmation may be required for definitive contaminant detection.',
                      style: TextStyle(
                        fontSize: 11,
                        height: 1.45,
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

class AnalysisStep extends StatelessWidget {
  final String title;
  final bool active;
  final bool completed;

  const AnalysisStep({
    super.key,
    required this.title,
    required this.active,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = completed || active
        ? const Color(0xFF2E7D32)
        : Colors.black26;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: active
            ? const Color(0xFFE8F5E9)
            : Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: active
              ? const Color(0xFF81C784)
              : Colors.black12,
        ),
      ),
      child: Row(
        children: [
          Icon(
            completed
                ? Icons.check_circle
                : active
                    ? Icons.autorenew
                    : Icons.circle_outlined,
            color: color,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              fontWeight:
                  active || completed ? FontWeight.bold : FontWeight.w500,
              color: color,
            ),
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
  final Uint8List imageBytes;

  const ScreeningResultPage({
    super.key,
    required this.imageBytes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screening Result'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE + RESULT
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFFFEBEE),
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: SizedBox(
                      height: 190,
                      width: double.infinity,
                      child: Image.memory(
                        imageBytes,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    'HIGH RISK',
                    style: TextStyle(
                      color: Color(0xFFC62828),
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'Rapid screening indicates quality concerns',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF7F1D1D),
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    '34 / 100',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC62828),
                    ),
                  ),

                  const Text(
                    'Screening score',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Quality indicators',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const IndicatorCard(
              title: 'Moisture',
              value: 'High',
              description: 'Estimated screening indicator',
              status: IndicatorStatus.danger,
            ),

            const IndicatorCard(
              title: 'Mould Risk',
              value: 'Elevated',
              description: 'Visual contamination indicators',
              status: IndicatorStatus.danger,
            ),

            const IndicatorCard(
              title: 'pH',
              value: 'Above target',
              description: 'Fermentation screening indicator',
              status: IndicatorStatus.warning,
            ),

            const IndicatorCard(
              title: 'Sand / Silica',
              value: 'Possible',
              description: 'Visual screening requires confirmation',
              status: IndicatorStatus.warning,
            ),

            const SizedBox(height: 18),

            const Text(
              'Explainable AI',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const ContributorCard(
              title: 'High moisture indicator',
              strength: 0.88,
              icon: Icons.water_drop_outlined,
            ),

            const ContributorCard(
              title: 'Mould-like visual pattern',
              strength: 0.76,
              icon: Icons.blur_on,
            ),

            const ContributorCard(
              title: 'Fermentation concern',
              strength: 0.64,
              icon: Icons.science_outlined,
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8E1),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.agriculture,
                        color: Color(0xFFF57F17),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Farmer advisory',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Do not use this batch as the sole basis for feeding decisions. Isolate the batch and consider laboratory confirmation before use.',
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'FeedSafe provides rapid screening and decision support. It does not replace laboratory testing for definitive contaminant confirmation.',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 11,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FeedPassportPage(
                        imageBytes: imageBytes,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.qr_code_2),
                label: const Text(
                  'Create Digital Feed Passport',
                ),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SampleInputPage(),
                    ),
                    (route) => route.isFirst,
                  );
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Test Another Sample'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// INDICATORS
// ============================================================

enum IndicatorStatus {
  danger,
  warning,
  good,
}

class IndicatorCard extends StatelessWidget {
  final String title;
  final String value;
  final String description;
  final IndicatorStatus status;

  const IndicatorCard({
    super.key,
    required this.title,
    required this.value,
    required this.description,
    required this.status,
  });

  Color get statusColor {
    switch (status) {
      case IndicatorStatus.danger:
        return const Color(0xFFC62828);
      case IndicatorStatus.warning:
        return const Color(0xFFF57F17);
      case IndicatorStatus.good:
        return const Color(0xFF2E7D32);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: Colors.black.withOpacity(0.06),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 52,
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(10),
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(
            value,
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// EXPLAINABLE AI
// ============================================================

class ContributorCard extends StatelessWidget {
  final String title;
  final double strength;
  final IconData icon;

  const ContributorCard({
    super.key,
    required this.title,
    required this.strength,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: Colors.black.withOpacity(0.06),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: const Color(0xFF2E7D32),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                '${(strength * 100).round()}%',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E7D32),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: strength,
            minHeight: 7,
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// CAPTURE CHECK
// ============================================================

class CaptureCheckItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool completed;

  const CaptureCheckItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: completed
                ? const Color(0xFF2E7D32)
                : Colors.black38,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            completed
                ? Icons.check_circle
                : Icons.radio_button_unchecked,
            color: completed
                ? const Color(0xFF2E7D32)
                : Colors.black26,
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
  final Uint8List? imageBytes;

  const FeedPassportPage({
    super.key,
    this.imageBytes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Feed Passport'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.verified_outlined,
                    color: Color(0xFF2E7D32),
                    size: 30,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Digital passport created',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Traceable rapid screening record',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            if (imageBytes != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: Image.memory(
                    imageBytes!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            if (imageBytes != null)
              const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Colors.black.withOpacity(0.07),
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    'FEEDSAFE',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                      color: Color(0xFF2E7D32),
                    ),
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    width: 170,
                    height: 170,
                    child: CustomPaint(
                      painter: FeedSafeQrPainter(),
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'FS-2026-00421',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'Digital Feed Passport ID',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              'Batch information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const PassportInfoCard(
              rows: [
                PassportRow(
                  label: 'Feed type',
                  value: 'Maize Silage',
                ),
                PassportRow(
                  label: 'Batch ID',
                  value: 'FS-2026-00421',
                ),
                PassportRow(
                  label: 'Test type',
                  value: 'Rapid AI Screening',
                ),
                PassportRow(
                  label: 'Overall result',
                  value: 'HIGH RISK',
                  danger: true,
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              'Screening summary',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const PassportInfoCard(
              rows: [
                PassportRow(
                  label: 'Moisture',
                  value: 'High',
                  danger: true,
                ),
                PassportRow(
                  label: 'Mould risk',
                  value: 'Elevated',
                  danger: true,
                ),
                PassportRow(
                  label: 'pH',
                  value: 'Above target',
                  warning: true,
                ),
                PassportRow(
                  label: 'Sand / Silica',
                  value: 'Possible',
                  warning: true,
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              'Important',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'This passport records a rapid screening result for traceability and decision support. It does not constitute laboratory confirmation of contaminants.',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const FeedSafeHome(),
                    ),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.home_outlined),
                label: const Text('Back to FeedSafe Home'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PassportInfoCard extends StatelessWidget {
  final List<PassportRow> rows;

  const PassportInfoCard({
    super.key,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.black.withOpacity(0.06),
        ),
      ),
      child: Column(
        children: rows
            .map(
              (row) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        row.label,
                        style: const TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    Text(
                      row.value,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: row.danger
                            ? const Color(0xFFC62828)
                            : row.warning
                                ? const Color(0xFFF57F17)
                                : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class PassportRow {
  final String label;
  final String value;
  final bool danger;
  final bool warning;

  const PassportRow({
    required this.label,
    required this.value,
    this.danger = false,
    this.warning = false,
  });
}

// ============================================================
// QR-STYLE PAINTER
// ============================================================

class FeedSafeQrPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    const int grid = 25;

    final double cellWidth = size.width / grid;
    final double cellHeight = size.height / grid;

    final List<List<bool>> matrix =
        List.generate(grid, (r) {
      return List.generate(grid, (c) {
        final int value =
            (r * 17 + c * 31 + r * c * 7) % 11;
        return value < 5;
      });
    });

    void drawFinder(int startRow, int startCol) {
      for (int r = 0; r < 7; r++) {
        for (int c = 0; c < 7; c++) {
          final bool outer =
              r == 0 ||
              r == 6 ||
              c == 0 ||
              c == 6;

          final bool inner =
              r >= 2 &&
              r <= 4 &&
              c >= 2 &&
              c <= 4;

          matrix[startRow + r][startCol + c] =
              outer || inner;
        }
      }
    }

    drawFinder(0, 0);
    drawFinder(0, grid - 7);
    drawFinder(grid - 7, 0);

    for (int r = 0; r < grid; r++) {
      for (int c = 0; c < grid; c++) {
        if (matrix[r][c]) {
          canvas.drawRect(
            Rect.fromLTWH(
              c * cellWidth,
              r * cellHeight,
              cellWidth + 0.3,
              cellHeight + 0.3,
            ),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}