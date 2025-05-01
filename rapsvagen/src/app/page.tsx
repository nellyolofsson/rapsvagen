import React from 'react';
import Link from 'next/link';
import Navbar from "./componetns/Navbar";
import Image from 'next/image';

export default function Home() {
  return (
    <main className="relative min-h-screen font-sans">
      {/* Bakgrundsbilden ligger bakom med z-index */}
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

      <div className="text-center min-h-screen p-10 bg-yellow-50/60">
        <h1 className="text-4xl text-green-900 font-bold mb-4">Välkommen till Rapsvägen!</h1>
        <p className="text-lg text-black m-[10px]">Snart är det dags för årets stora "Cykelfest utan cykel"! 🚴‍♀️🌞</p>

        <p className="text-lg mb-2 text-black">📅 Datum: 9 Augusti 2025</p>
        <p className="text-lg mb-2 text-black">⏳ Sista anmälningsdag: 30 Juni</p>
        <p className="text-lg mb-6 text-black">✅ Anmäl dig nu för att säkra din plats!</p>

        {/* Under konstruktion meddelande */}
       
          <p className='text-lg mb-6 text-black'>🚧 Denna sida är under konstruktion! Vissa funktioner kan vara otillgängliga.</p>
        

        {/* Anmälningslänk */}
        <Link href="https://docs.google.com/forms/d/e/1FAIpQLSeFEXEMPEL/viewform" target="_blank">
          <span className="inline-block mt-4 px-6 py-3 bg-green-700 text-white font-semibold rounded-xl shadow hover:bg-green-800 transition">
            Anmäl dig här
          </span>
        </Link>

       
      </div>
    </main>
  );
}
