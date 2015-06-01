require('coffee-script/register');
Docker_Web_Hooks = require('./src/Docker-Web-Hooks')

new Docker_Web_Hooks()
    .setup()
    .start()