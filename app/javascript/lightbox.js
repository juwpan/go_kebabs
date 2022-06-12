import Lightbox from 'bs5-lightbox';

document.querySelectorAll('.my-lightbox-toggle').
forEach(el => el.addEventListener('click', Lightbox.initialize));
