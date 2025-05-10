'use client';
import Link from 'next/link';
import { useState } from 'react';

const Navbar = () => {
  const [isOpen, setIsOpen] = useState(false);

  return (
    <nav className="fixed top-0 left-0 w-full p-5 bg-black text-white backdrop-blur-md z-10 shadow-lg">
      <div className="flex justify-between items-center">
        <h2 className="text-xl font-bold">Rapsvägen</h2>

        {/* Desktop links */}
        <div className="hidden md:flex space-x-6 text-base">
          <Link href="/" className="hover:underline font-bold">Hem</Link>
          <Link href="/galleri" className="hover:underline font-bold">Galleri</Link>
          <Link href="/om" className="hover:underline font-bold">Om</Link>
          <Link href="#kontakt" className="hover:underline font-bold">Kontakt</Link>
        </div>

        {/* Mobile menu button */}
        <button
          onClick={() => setIsOpen(!isOpen)}
          className="md:hidden text-white focus:outline-none"
        >
          ☰
        </button>
      </div>

      {/* Mobile dropdown menu */}
      {isOpen && (
        <div className="md:hidden mt-4 space-y-2 text-center">
          <Link href="/" className="block hover:underline font-bold" onClick={() => setIsOpen(false)}>Hem</Link>
          <Link href="/galleri" className="block hover:underline font-bold" onClick={() => setIsOpen(false)}>Galleri</Link>
          <Link href="/om" className="block hover:underline font-bold" onClick={() => setIsOpen(false)}>Om</Link>
          <Link href="#kontakt" className="block hover:underline font-bold" onClick={() => setIsOpen(false)}>Kontakt</Link>
        </div>
      )}
    </nav>
  );
};

export default Navbar;
