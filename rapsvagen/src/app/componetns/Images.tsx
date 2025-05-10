import React, { useState } from 'react';

interface ImageGalleryProps {
    images: string[];
}

const ImageGallery: React.FC<ImageGalleryProps> = ({ images }) => {
    const [selectedImage, setSelectedImage] = useState<string | null>(null);

    const handleImageClick = (image: string) => {
        setSelectedImage(image);
    };

    const closeModal = () => {
        setSelectedImage(null);
    };

    return (
        <div>
            <div className="gallery">
                {images.map((image, index) => (
                    <img
                        key={index}
                        src={image}
                        alt={`Gallery image ${index + 1}`}
                        onClick={() => handleImageClick(image)}
                        className="gallery-image"
                    />
                ))}
            </div>

            {selectedImage && (
                <div className="modal" onClick={closeModal}>
                    <div className="modal-content" onClick={(e) => e.stopPropagation()}>
                        <img src={selectedImage} alt="Selected" className="modal-image" />
                        <button onClick={closeModal} className="close-button">
                            Close
                        </button>
                    </div>
                </div>
            )}
        </div>
    );
};

export default ImageGallery;