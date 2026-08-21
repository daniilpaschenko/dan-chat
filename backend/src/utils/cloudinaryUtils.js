const streamifier = require('streamifier');
const cloudinary = require('../config/cloudinary');

// загружает буфер в Cloudinary потоком
const streamUpload = (buffer, { folder, publicId, type = 'upload', transformation, resourceType = 'image' }) => {
    return new Promise((resolve, reject) => {
        const stream = cloudinary.uploader.upload_stream(
            {
                folder,
                public_id: publicId,
                overwrite: true,
                resource_type: resourceType,
                type,
                ...(transformation ? { transformation } : {}),
            },
            (error, result) => {
                if (result) resolve(result);
                else reject(error);
            }
        );
        streamifier.createReadStream(buffer).pipe(stream);
    });
};

// генерирует подписанный временный URL для приватного ассета
const getSignedUrl = (publicId, expiresInSeconds = 600) => {
    return cloudinary.url(publicId, {
        type: 'authenticated',
        sign_url: true,
        secure: true,
        resource_type: 'image',
        expires_at: Math.floor(Date.now() / 1000) + expiresInSeconds,
    });
};

module.exports = { streamUpload, getSignedUrl };