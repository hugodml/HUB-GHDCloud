const express = require('express');
var bodyParser = require('body-parser')
const app = express();

app.use(bodyParser.json())

var exec = require('child_process').exec;

app.post('/create', (req, res) => {
    if (req.body.name && req.body.password) {
        exec('./script.sh ' + req.body.name + ' ' + req.body.password, (err, stdout) => {
            if (err)
                console.error(err)
            else
                console.log(`${stdout}`);
        })
        res.status(201).json({"msg": "Created"});
    } else {
        res.status(400).json({"msg": "Invalid Body"});
    }
})

app.listen(8080, () =>{
    console.log('Ekip');
})
