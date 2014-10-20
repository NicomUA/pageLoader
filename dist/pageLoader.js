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
      script.defer = true;
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
      var callStack, lib, libUrl, libs, page, _i, _len, _this;
      callStack = [];
      _this = this;
      this.page = page = this.matchUrl();
      if (this.page == null) {
        this.log('no page to load');
        return false;
      }
      libs = [];
      if (this.globals.length) {
        Array.prototype.push.apply(libs, this.globals);
      }
      if (this.page.require.length) {
        Array.prototype.push.apply(libs, this.page.require);
      }
      if (libs.length) {
        this.log('Loading required libs for page');
        for (_i = 0, _len = libs.length; _i < _len; _i++) {
          lib = libs[_i];
          libUrl = (lib.match('^(http|https|\/\/)', 'i') != null) ? lib : this.libPath + lib;
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
