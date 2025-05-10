import React from 'react';

const Contact = () => {
    return (
        <div className="max-w-lg mx-auto p-4">
            <h1 className="text-3xl font-bold text-gray-900 mb-6 text-center">Kontakta oss</h1>
            <p className="text-base text-gray-800 mb-4 text-center">
                Har du frågor eller funderingar? Tveka inte att höra av dig!
            </p>
            <p className="text-base text-gray-800 text-center mb-2">
  📞 Du kan nå oss via: 
</p>

<div className="text-center space-y-1 text-gray-800">
  <p><strong>Madeleine Romin:</strong> 073-3455452</p>
  <p><strong>Nelly Olofsson:</strong> 070-8654692</p>
</div>
        </div>
    );
};

export default Contact;
