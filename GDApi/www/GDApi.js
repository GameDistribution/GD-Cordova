var exec = require('cordova/exec');

exports.init = function(arg0, success, error) {
    exec(success, error, "GDApi", "init", arg0);
};

exports.showBanner = function(arg0, success, error) {
    exec(success, error, "GDApi", "showBanner", arg0);
};

exports.addTestDevice = function(arg0, success, error) {
    exec(success, error, "GDApi", "addTestDevice", arg0);
};

exports.setAdListener = function(arg0, success, error) {
    exec(success, error, "GDApi", "setAdListener", arg0);
};
