var exec = require('cordova/exec');

exports.init = function(arg0, success, error) {
    exec(success, error, "GDApi", "init", arg0);
};

exports.showBanner = function(success, error) {
    exec(success, error, "GDApi", "showBanner", []);
};

exports.addTestDevice = function(arg0, success, error) {
    exec(success, error, "GDApi", "addTestDevice", arg0);
};

exports.setAdListener = function(success, error) {
    exec(success, error, "GDApi", "setAdListener", []);
};
