var exec = require('cordova/exec');

exports.init = function(args, success, error) {
    exec(success, error, "GDApi", "init", args);
};
