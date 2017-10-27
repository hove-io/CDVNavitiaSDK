module.exports = function(ctx) {
    if (ctx.opts.cordova.platforms.indexOf('ios') === -1) {
        return;
    }

    console.log();
    console.log('*****************************************************');
    console.log('***         Go stretch your legs (~5min)          ***');
    console.log('*****************************************************');
    console.log();

    const deferral = ctx.requireCordovaModule('q').defer();
    const spawn = ctx.requireCordovaModule('child_process').spawn;
    const child = spawn('carthage', ['update', '--cache-builds', '--platform', 'iOS'], {
        cwd: ctx.opts.plugin.dir,
    });
    child.stdout.setEncoding('utf8');
    child.stderr.setEncoding('utf8');

    child.stdout.on('data', function(data) {
        console.log(data);
    });

    child.stderr.on('data', function(data) {
        console.log(data);
    });

    child.on('error', function(err) {
        deferral.reject(err);
    });

    child.on('close', function(code) {
        deferral.resolve();
    });

    return deferral.promise;
};
