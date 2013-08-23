var fs = require('fs');

var inStr = fs.readFileSync(process.argv[2]).toString();

var json = JSON.parse(inStr);

var str = JSON.stringify(json, null, 4);

console.log(str);

if(inStr != str)
    fs.writeFileSync(process.argv[2], str);
