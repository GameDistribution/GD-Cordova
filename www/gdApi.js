var exec = require('cordova/exec');

exports.init = function(arg0) {
    exec(null, null, "gdApi", "init", arg0);
};

exports.showBanner = function() {
    exec(null, null, "gdApi", "showBanner", []);
};

exports.enableTestAds = function() {
    exec(null, null, "gdApi", "enableTestAds", null);
};

exports.setAdListener = function(success, error) {
    exec(success, error, "gdApi", "setAdListener", []);
};
