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
    '/examples/accordion.html': {
        'module': 'accordion.js',
        'require': ['https://code.jquery.com/ui/1.11.2/jquery-ui.min.js']
    },

    '/examples/datepicker.html': {
        'module': 'datepicker.js',
        'require': ['https://code.jquery.com/ui/1.11.2/jquery-ui.min.js']
    },

    '/examples/angular.html': {
        'module': 'angular.js',
        'require': ['https://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js']
    },

    '(.*)': {
        'module': null,
        'require': []
    }
};
