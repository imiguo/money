const sharp = require('sharp');

var images = [
    'default',
    'dollarup',
    'enjoymoney',
    'fundsmore',
    'gainmost',
    'logunion',
    'yourshares'
];
images.forEach(function (image) {
    sharp('./themes/' + image + '.png')
      .resize(720, 490, {
        kernel: sharp.kernel.lanczos2,
        interpolator: sharp.interpolator.nohalo
      })
      .crop(sharp.gravity.northeast)
      .toFile('./resource/themes/' + image + '.png');
});
