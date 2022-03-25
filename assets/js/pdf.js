// We import the CSS which is extracted to its own file by esbuild.
// Remove this line if you add a your own CSS build pipeline (e.g postcss).
import "../css/pdf.css"

import {Previewer} from '../vendor/paged.js';

const previewer = new Previewer();
const html = document.querySelector('#root').innerHTML;
const $preview = document.querySelector('#preview');

previewer.preview(html, ['/assets/pdf.css'], $preview);

document.querySelector('.button-print').addEventListener('click', _e => window.print())
