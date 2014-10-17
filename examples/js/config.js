pageLoader.libPath = './js/';
pageLoader.pagePath = './js/pages/';
// pageLoader.debug = true;

// pages configuration
pageLoader.pages = {
    '/examples/index.html': {
        'module': 'index.js',
        'require': ['https://code.jquery.com/ui/1.11.2/jquery-ui.min.js']
    },
    '/examples/accordion.html': {
        'module': 'accordion.js',
        'require': ['https://code.jquery.com/ui/1.11.2/jquery-ui.min.js']
    },

    '/examples/datapicker.html': {
        'module': 'datepicker.js',
        'require': ['https://code.jquery.com/ui/1.11.2/jquery-ui.min.js']
    },
    '(.*)': {
        'module': null,
        'require': []
    }
};
