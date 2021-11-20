require('@rails/ujs').start()
require('turbolinks').start()
require('@rails/activestorage').start()
require('channels')
require('jquery')
require('@nathanvda/cocoon')

import 'cocoon';

window.bootstrap = require("bootstrap");

import '../stylesheets/application.scss';

var jQuery = require('jquery')

global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;
import toastr from 'toastr'
window.toastr = toastr
