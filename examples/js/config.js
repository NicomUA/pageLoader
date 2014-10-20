pageLoader.libPath = './js/';
pageLoader.pagePath = './js/pages/';
pageLoader.globals = ['https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'];
pageLoader.debug = true;

// pages configuration
pageLoader.pages = {
    '/examples/index.html': {
        'module': null,
        'require': []
    },
    '/examples/jquery.html': {
        'module': 'jquery.js',
        'require': ['https://code.jquery.com/ui/1.11.2/jquery-ui.min.js']
    },

    '/examples/angular.html': {
        'module': 'angular.js',
        'require': ['https://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js']
    },
    '/examples/backbone.html': {
        'module': 'backbone.js',
        'preLoad': [
            'http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.7.0/underscore.js',
            'http://cdnjs.cloudflare.com/ajax/libs/backbone.js/1.1.2/backbone.js'
        ],
        'require': [
            'http://cdnjs.cloudflare.com/ajax/libs/backbone-localstorage.js/1.1.13/backbone.localStorage.js'
        ]
    },

    '(.*)': {
        'module': null,
        'require': []
    }
};
