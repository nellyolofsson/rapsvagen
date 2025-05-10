import Link from 'next/link';
import Contact from './Contact';


const Navbar = () => {
  return (
    <nav className="fixed top-0 left-0 w-full p-5 bg-black text-white backdrop-blur-md flex justify-between items-center z-10 shadow-lg relative">
      <h2 className="text-xl font-bold">Rapsvägen</h2>
      <div className="space-x-6 text-base">
        <Link href="/" className="hover:underline font-bold">Hem</Link>
        <Link href="/galleri" className="hover:underline font-bold">Galleri</Link>
        <Link href="/om" className="hover:underline font-bold">Om</Link>
        <Link href="#kontakt" className="hover:underline font-bold transition-all duration-300">Kontakt
        </Link>
      </div>
    </nav>
  );
};

export default Navbar;
