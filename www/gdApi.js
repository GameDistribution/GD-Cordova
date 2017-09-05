var exec = require('cordova/exec');

exports.init = function(arg0, success, error) {
    exec(success, error, "gdApi", "init", arg0);
};

exports.showBanner = function(success, error) {
    exec(success, error, "gdApi", "showBanner", []);
};

exports.addTestDevice = function(arg0, success, error) {
    exec(success, error, "gdApi", "addTestDevice", arg0);
};

exports.setAdListener = function(success, error) {
    exec(success, error, "gdApi", "setAdListener", []);
};
