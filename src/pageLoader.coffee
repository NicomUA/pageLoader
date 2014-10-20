@pageLoader = pageLoader =
    # get global elements to pageLoader namespace
    document : window.document
    location : location.pathname
    head : document.head
    body : document.body

    # set debug to true if need infirmation about work flow
    debug: false

    #logger
    log : ->
        if @debug && typeof console == 'object' && console.log
            if console.log.apply?
                console.info.apply(console, arguments);
            else
                console.info(arguments);

    # get config from file. Use data-config attribute to specified file
    getConfig : ->
        @log 'loading config file'
        configUrl = document.currentScript.getAttribute('data-config');
        return @loadScript(configUrl);

    # append scrit tag to DOM
    loadScript: (lib, cb) ->
        dfd = new $.Deferred();
        url = lib;
        script = window.document.createElement('script');
        script.type = 'text/javascript';
        script.src = url;
        script.defer = true;

        # for old IE browsers
        script.onreadystatechange = ->
            if script.readyState==4 && script.status==200
                pageLoader.log('load ' + url);
                return dfd.resolve();

        # for browsers
        script.onload = ->
            pageLoader.log('File %s loaded ', url);
            return dfd.resolve();

        @body.appendChild(script);
        return dfd;

    # find match page cobfig for current url
    matchUrl : ->
        lib = null;
        _ref = @pages;
        for pattern of _ref
            libUrl = _ref[pattern];
            if @location.match(pattern, 'ig')
                lib = libUrl;
                break;

        lib

    # bootstrap pageLoader
    bootstrap : ->
        callStack = [];
        _this = @;
        @page = page = @matchUrl();

        if !@page?
            @log('no page to load');
            return false;

        libs = []
        if @globals.length
            Array::push.apply libs, @globals

        if @page.require.length
            Array::push.apply libs, @page.require

        if libs.length
            @log('Loading required libs for page');

            for lib in libs
                libUrl = if (lib.match('^(http|https|\/\/)','i')?) then lib else (@libPath + lib);
                callStack.push(@loadScript(libUrl));

        callStack.push(@loadScript(@pagePath + @page.module)) if @page.module?

        $.when.apply($, callStack)
        .done ->
            _this.log('all libs loaded');

            if _this.page.init?
                _this.log('init %s page', _this.page.module);
                _this.page.init()

    init: ()->
        _this = @;

        $.when @getConfig()
        .done ->
            _this.bootstrap()


# init all
pageLoader.init();
