import React from 'react';
import Link from 'next/link';
import Navbar from "./componetns/Navbar";
import Image from 'next/image';

export default function Home() {
  return (
    <main className="relative min-h-screen font-sans">
      {/* Bakgrundsbild */}
      <div className="absolute inset-0 -z-10">
        <Image
          src="/white.jpg"
          alt="bakgrund"
          fill
          style={{ objectFit: "cover" }}
          quality={100}
          priority
        />
      </div>

      <Navbar />

      <div className="text-center min-h-screen px-4 py-10 bg-yellow-50/60">
        <h1 className="text-2xl sm:text-3xl md:text-4xl text-green-900 font-bold mb-4">
          Välkommen till Rapsvägen!
        </h1>

        <p className="text-lg text-black m-[10px]">Snart är det dags för årets stora &quot;Cykelfest utan cykel&quot;! 🚴‍♀️🌞</p>

        <p className="text-base sm:text-lg mb-2 text-black">📅 Datum: 9 Augusti 2025</p>
        <p className="text-base sm:text-lg mb-2 text-black">⏳ Sista anmälningsdag: 30 Juni</p>
        <p className="text-base sm:text-lg mb-6 text-black">✅ Anmäl dig nu för att säkra din plats!</p>

        <p className="text-base sm:text-lg mb-6 text-black">
          🚧 Denna sida är under konstruktion – vissa funktioner kanske inte fungerar ännu.
        </p>

        <Link href="https://docs.google.com/forms/d/e/1FAIpQLSfoPv9bLs1WNixQv0qakoQNPn1ay-Xlaaj2SXIa0Dj1Vf3P-A/viewform?usp=dialog" target="_blank">
          <span className="inline-block mt-4 mb-10 px-6 py-3 bg-green-700 text-white font-semibold rounded-xl shadow hover:bg-green-800 transition">
            Anmäl dig här
          </span>
        </Link>
        

        {/* Info-ruta */}
        <div className="max-w-2xl mx-auto text-left bg-white/70 px-6 py-6 rounded-xl shadow mt-6 text-black">
          <h2 className="text-xl sm:text-2xl font-bold mb-4 text-green-900">Så här går festen till 🎉</h2>

          <p className="mb-4 text-base sm:text-lg">
            Välkommen till årets stora &quot;Cykelfest utan cykel&quot;!" på Rapsvägen den 9 augusti 2025!
          </p>

          <p className="mb-4 text-base sm:text-lg">
            Fyll i formuläret för att anmäla er. Sista anmälningsdag är 30 juni.
          </p>

          <p className="mb-4 text-base sm:text-lg">
            🍽️ Kvällen delas upp i tre delar – förrätt, varmrätt och efterrätt – och olika hushåll står för varje rätt.
          </p>

          <p className="mb-4 text-base sm:text-lg">
            📬 Två veckor innan får ni veta vilken rätt ni ska laga.
          </p>

          <p className="mb-4 text-base sm:text-lg">
            🎁 Vem ni får som gäster och vilka ni själva ska besöka avslöjas på själva festdagen – en del av överraskningen!
          </p>

          <p className="mb-4 text-base sm:text-lg">
            📝 Har ni allergier, önskemål eller vill ni vara flexibla med vilken rätt ni lagar? Skriv det i formuläret.
          </p>

          <p className="font-semibold text-base sm:text-lg">
            Varmt välkomna till en kväll fylld av god mat, skratt och nya bekantskaper! 💛
          </p>
        </div>

        <footer className="mt-20 text-sm text-gray-500">© 2025 Rapsvägens Grannskap</footer>
      </div>
    </main>
  );
}
