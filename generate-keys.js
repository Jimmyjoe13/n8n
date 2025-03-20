const crypto = require('crypto');

// Générer une clé de chiffrement aléatoire
const encryptionKey = crypto.randomBytes(24).toString('hex');

console.log('Clés générées pour le déploiement sur Render:');
console.log('-------------------------------------------');
console.log(`ENCRYPTION_KEY: ${encryptionKey}`);
console.log('');
console.log('Utilisez ces valeurs dans votre base de données Render.');
console.log('N\'oubliez pas de définir également BASIC_AUTH_USER et BASIC_AUTH_PASSWORD.');
