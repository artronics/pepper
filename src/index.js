'use strict';

require('./index.html');
require('./assets/styles/style.scss');
var Elm = require('./elm/Main.elm');

Elm.Main.embed(document.getElementById('main'));