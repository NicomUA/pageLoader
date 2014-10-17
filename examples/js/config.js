pageLoader.libPath = '/js/';
pageLoader.pagePath = '/js/pages/';
pageLoader.debug = false;

// pages configuration
pageLoader.pages = {
    '/examples/index.html': { 'init': 'index.js', 'require': [] },
    '(.*)': { 'init': null, 'require': [] }
};
