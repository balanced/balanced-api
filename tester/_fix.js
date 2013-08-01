var fs = require('fs');

var json = JSON.parse(fs.readFileSync(process.argv[2]).toString())

var str = JSON.stringify(json, null, 4);

console.log(str);


fs.writeFileSync(process.argv[2], str);
