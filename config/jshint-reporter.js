module.exports = {
  reporter: function reporter(results) {
    var sys = require('sys'),
    len = results.length,
    file, error;

    results.forEach(function (result) {
      file = result.file;
      error = result.error;
      console.log(file+':'+error.line+':'+error.character+':'+error.reason);
    });
    process.exit(len > 0 ? 1 : 0);
  }
};
