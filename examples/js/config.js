pageLoader.libPath = './js/';
pageLoader.pagePath = './js/pages/';
pageLoader.globals = ['https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js','https://code.jquery.com/ui/1.11.2/jquery-ui.min.js'];
pageLoader.debug = true;

// pages configuration
pageLoader.pages = {
    '/examples/index.html': {
        'module': 'index.js',
        'require': []
    },
    '/examples/accordion.html': {
        'module': 'accordion.js',
        'require': []
    },

    '/examples/datepicker.html': {
        'module': 'datepicker.js',
        'require': []
    },
    '(.*)': {
        'module': null,
        'require': []
    }
};
