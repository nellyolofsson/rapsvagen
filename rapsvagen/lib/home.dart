import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'nav.dart';

// ── Färgpalett ────────────────────────────────────────────────────────────────
const kAmber900 = Color(0xFF412402);
const kAmber800 = Color(0xFF633806);
const kAmber600 = Color(0xFFBA7517);
const kAmber400 = Color(0xFFEF9F27);
const kAmber100 = Color(0xFFFAC775);
const kAmber50 = Color(0xFFFAEEDA);

const kTeal50 = Color(0xFFE1F5EE);
const kTeal600 = Color(0xFF0F6E56);
const kTeal800 = Color(0xFF085041);

const kBlue50 = Color(0xFFE6F1FB);
const kBlue800 = Color(0xFF0C447C);

const kGreen50 = Color(0xFFEAF3DE);
const kGreen600 = Color(0xFF3B6D11);
const kGreen200 = Color(0xFFC0DD97);

const kWarningBg = Color(0xFFFFF8EC);
const kWarningText = Color(0xFF854F0B);
const kWarningBorder = Color(0xFFEF9F27);

// ── Entry point ───────────────────────────────────────────────────────────────

// ── HomePage ──────────────────────────────────────────────────────────────────
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scroll = ScrollController();

  void _scrollTo(double offset) => _scroll.animateTo(
    offset,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F4F0),
      appBar: TopNav(
        onHome: () => _scrollTo(0),
        onInfo: () => _scrollTo(380),
        onProgram: () => _scrollTo(780),
        // onImage: () => _scrollTo(1180),
        onContact: () => _scrollTo(1200),
      ),
      body: SingleChildScrollView(
        controller: _scroll,
        child: Column(
          children: [
            const _HeroSection(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 720),
                  child: const Column(
                    children: [
                      _InfoSection(),
                      SizedBox(height: 20),
                      _ProgramSection(),
                      SizedBox(height: 20),
                      _ContactSection(),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
            const _Footer(),
          ],
        ),
      ),
    );
  }
}

// ── Hero ──────────────────────────────────────────────────────────────────────
class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFAC775), kAmber400, Color(0xFFFAC775)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // Decorative flower shapes
          Positioned(
            left: 20,
            top: 20,
            child: _RapsFlower(size: 60, opacity: 0.18),
          ),
          Positioned(
            right: 20,
            top: 20,
            child: _RapsFlower(size: 60, opacity: 0.18),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Center(child: _RapsFlower(size: 44, opacity: 0.12)),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 24),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white.withOpacity(0.6)),
                    ),
                    child: const Text(
                      'Rapsvägen 2026',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: kAmber900,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Cykelfest utan cykel',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: kAmber900,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Grannskapsfest på Rapsvägen',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: kAmber800),
                  ),
                  const SizedBox(height: 24),
                  // Date chips
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: const [
                      _DateChip(label: 'Festdatum', value: '22 aug 2026'),
                      _DateChip(label: 'Sista anmälan', value: '30 juni 2026'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DateChip extends StatelessWidget {
  final String label, value;
  const _DateChip({required this.label, required this.value});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.55),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.6,
            color: kAmber800,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: kAmber900,
          ),
        ),
      ],
    ),
  );
}

// Decorative rapeseed flower drawn with circles
class _RapsFlower extends StatelessWidget {
  final double size, opacity;
  const _RapsFlower({required this.size, required this.opacity});
  @override
  Widget build(BuildContext context) => Opacity(
    opacity: opacity,
    child: SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _FlowerPainter()),
    ),
  );
}

class _FlowerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final c = size.width / 2;
    final r = size.width * 0.28;
    final petalR = size.width * 0.22;
    final paint = Paint()..color = kAmber900;
    for (var i = 0; i < 8; i++) {
      final angle = (i / 8) * 2 * math.pi;
      canvas.drawCircle(
        Offset(c + r * math.cos(angle), c + r * math.sin(angle)),
        petalR,
        paint,
      );
    }
    canvas.drawCircle(
      Offset(c, c),
      size.width * 0.18,
      Paint()..color = kAmber400,
    );
  }

  @override
  bool shouldRepaint(_FlowerPainter old) => false;
}

// ── Section card ──────────────────────────────────────────────────────────────
class _SectionCard extends StatelessWidget {
  final Widget child;
  const _SectionCard({required this.child});
  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: Colors.black.withOpacity(0.08), width: 0.5),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: child,
  );
}

class _SectionHeader extends StatelessWidget {
  final Color bgColor;
  final Widget icon;
  final String title;
  const _SectionHeader({
    required this.bgColor,
    required this.icon,
    required this.title,
  });
  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
        child: Center(child: icon),
      ),
      const SizedBox(height: 10),
      Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Color(0xFF1A1A1A),
        ),
      ),
    ],
  );
}

// ── Info section ──────────────────────────────────────────────────────────────
class _InfoSection extends StatelessWidget {
  const _InfoSection();
  @override
  Widget build(BuildContext context) => _SectionCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeader(
          bgColor: kAmber50,
          icon: Text('🎉', style: TextStyle(fontSize: 18)),
          title: 'Om festen',
        ),
        const SizedBox(height: 16),
        const Text(
          'Snart är det dags för årets stora cykelfest — utan cykel! '
          'En kväll med grannar, god mat och gott sällskap längs Rapsvägen. '
          'Anmäl dig senast 30 juni för att vara med.',
          style: TextStyle(fontSize: 15, color: Color(0xFF555555), height: 1.7),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: kWarningBg,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: kWarningBorder.withOpacity(0.4)),
          ),
          child: const Row(
            children: [
              Text('🚧', style: TextStyle(fontSize: 14)),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Sidan är under konstruktion — vissa funktioner kanske inte fungerar ännu.',
                  style: TextStyle(fontSize: 13, color: kWarningText),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// ── Program section ───────────────────────────────────────────────────────────
class _ProgramSection extends StatelessWidget {
  const _ProgramSection();
  @override
  Widget build(BuildContext context) => _SectionCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeader(
          bgColor: kTeal50,
          icon: Text('🍽️', style: TextStyle(fontSize: 18)),
          title: 'Så här går festen till',
        ),
        const SizedBox(height: 12),
        const Text(
          'Middagen vandrar mellan tre hushåll. Gäster och värdar avslöjas först på festdagen – information skickas ut två veckor innan!\n\n'
          '🍽️ Kvällen delas upp i tre delar: förrätt, varmrätt och efterrätt, där olika hushåll ansvarar för varsin rätt.\n'
          '📬 Två veckor innan festen får ni veta vilken rätt ni ska laga.\n'
          '🎁 Vilka ni får som gäster och vilka ni själva ska besöka avslöjas på själva festdagen – det är en del av överraskningen!\n'
          '📝 Har ni allergier, önskemål eller vill vara flexibla med vilken rätt ni lagar? Skriv det i anmälningsformuläret.\n'
          'Varmt välkomna till en kväll fylld av god mat, skratt och nya bekantskaper! 💛',
          style: TextStyle(fontSize: 15, color: Color(0xFF555555), height: 1.7),
        ),
        const SizedBox(height: 16),
        Row(
          children: const [
            Expanded(
              child: _StepCard(
                number: '1',
                title: 'Förrätt',
                desc: 'Hos ett hushåll på gatan',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _StepCard(
                number: '2',
                title: 'Varmrätt',
                desc: 'Hos ett annat hushåll',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _StepCard(
                number: '3',
                title: 'Efterrätt',
                desc: 'Hos ett tredje hushåll',
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class _StepCard extends StatelessWidget {
  final String number, title, desc;
  const _StepCard({
    required this.number,
    required this.title,
    required this.desc,
  });
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.black.withOpacity(0.09), width: 0.5),
    ),
    child: Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: kAmber600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF777777),
            height: 1.4,
          ),
        ),
      ],
    ),
  );
}

// ── Contact section ───────────────────────────────────────────────────────────
class _ContactSection extends StatelessWidget {
  const _ContactSection();
  @override
  Widget build(BuildContext context) => _SectionCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeader(
          bgColor: kBlue50,
          icon: Text('📞', style: TextStyle(fontSize: 18)),
          title: 'Kontakt',
        ),
        const SizedBox(height: 12),
        const Text(
          'Frågor eller funderingar? Hör av dig till arrangörerna:',
          style: TextStyle(fontSize: 15, color: Color(0xFF555555), height: 1.7),
        ),
        const SizedBox(height: 14),
        const _ContactCard(
          initials: 'MR',
          name: 'Madeleine Romin',
          phone: '073-345 54 52',
          avatarBg: kAmber50,
          avatarFg: kAmber800,
        ),
        const SizedBox(height: 10),
        const _ContactCard(
          initials: 'NO',
          name: 'Nelly Olofsson',
          phone: '070-865 46 92',
          avatarBg: kTeal50,
          avatarFg: kTeal800,
        ),
      ],
    ),
  );
}

class _ContactCard extends StatelessWidget {
  final String initials, name, phone;
  final Color avatarBg, avatarFg;
  const _ContactCard({
    required this.initials,
    required this.name,
    required this.phone,
    required this.avatarBg,
    required this.avatarFg,
  });
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.black.withOpacity(0.09), width: 0.5),
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: 21,
          backgroundColor: avatarBg,
          child: Text(
            initials,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: avatarFg,
            ),
          ),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              phone,
              style: const TextStyle(fontSize: 13, color: Color(0xFF666666)),
            ),
          ],
        ),
      ],
    ),
  );
}

// ── Footer ────────────────────────────────────────────────────────────────────
class _Footer extends StatelessWidget {
  const _Footer();
  @override
  Widget build(BuildContext context) => Container(
    color: kGreen50,
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 14),
    child: const Text(
      'Rapsvägen  •  Cykelfest utan cykel 2026  •  Vi ses den 22 augusti!',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 12, color: kGreen600),
    ),
  );
}
// href="https://docs.google.com/forms/d/e/1FAIpQLSfoPv9bLs1WNixQv0qakoQNPn1ay-Xlaaj2SXIa0Dj1Vf3P-A/viewform?usp=dialog" target="_blank">