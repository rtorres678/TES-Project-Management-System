const readline = require('readline');
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
    prompt: 'TES> '
});

var mysql = require('mysql');

var con = mysql.createConnection({
    host: "localhost",
    user: "dev",
    password: "password"
});

rl.prompt();

rl.on('line', async (line) => {
    switch (line.trim()) {
        case 'LP':
            console.log('Listing Projects:');
            var output;
            await con.query("SHOW DATABASES;", function (err, result) {
                if (err) throw err;
                output = result[0].Database;
                console.log('output1: ' + output);
                rl.prompt();
            });
            console.log('output: ' + output);
            break;
        case '':
            break;
        default:
            console.log(`Say what? I might have heard '${line.trim()}'`);
            console.log('test: ' + line.trim());
            break;
    }
    
}).on('close', () => {
    console.log('Have a great day!');
    process.exit(0);
});