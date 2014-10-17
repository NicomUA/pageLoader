(function() {
  var pageLoader;

  this.pageLoader = pageLoader = {
    document: window.document,
    location: location.pathname,
    head: document.head,
    body: document.body,
    debug: false,
    log: function() {
      if (this.debug && typeof console === 'object' && console.log) {
        if (console.log.apply != null) {
          return console.info.apply(console, arguments);
        } else {
          return console.info(arguments);
        }
      }
    },
    getConfig: function() {
      var configUrl;
      this.log('loading config file');
      configUrl = document.currentScript.getAttribute('data-config');
      return this.loadScript(configUrl);
    },
    loadScript: function(lib, cb) {
      var dfd, script, url;
      dfd = new $.Deferred();
      url = lib;
      script = window.document.createElement('script');
      script.type = 'text/javascript';
      script.src = url;
      script.async = true;
      script.onreadystatechange = function() {
        if (script.readyState === 4 && script.status === 200) {
          pageLoader.log('load ' + url);
          return dfd.resolve();
        }
      };
      script.onload = function() {
        pageLoader.log('File %s loaded ', url);
        return dfd.resolve();
      };
      this.body.appendChild(script);
      return dfd;
    },
    matchUrl: function() {
      var lib, libUrl, pattern, _ref;
      lib = null;
      _ref = this.pages;
      for (pattern in _ref) {
        libUrl = _ref[pattern];
        if (this.location.match(pattern, 'ig')) {
          lib = libUrl;
          break;
        }
      }
      return lib;
    },
    bootstrap: function() {
      var callStack, libUrl, page, requeredLib, _i, _len, _ref, _ref1, _this;
      callStack = [];
      _this = this;
      this.page = page = this.matchUrl();
      if (this.page == null) {
        this.log('no page to load');
        return false;
      }
      if (this.page.require.length) {
        this.log('Loading required libs for page');
        _ref = page.require;
        _ref1 = page.require;
        for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
          page = _ref1[_i];
          requeredLib = page;
          libUrl = (requeredLib.match('^(http|https|\/\/)', 'i') != null) ? requeredLib : this.libPath + requeredLib;
          callStack.push(this.loadScript(libUrl));
        }
      }
      if (this.page.module != null) {
        callStack.push(this.loadScript(this.pagePath + this.page.module));
      }
      return $.when.apply($, callStack).done(function() {
        _this.log('all libs loaded');
        if (_this.page.init != null) {
          _this.log('init %s page', _this.page.module);
          return _this.page.init();
        }
      });
    },
    init: function() {
      var _this;
      _this = this;
      return $.when(this.getConfig()).done(function() {
        return _this.bootstrap();
      });
    }
  };

  pageLoader.init();

}).call(this);
