const express = require('express')
const app = express()
const moment = require('moment')
let os = require('os')

const respuesta = () => {
    const f = moment().format('MMM Do YYYY, h:mm:ss a');
    const txt = `HostName: ${os.hostname()}, os: ${os.type}...`;
    return txt
}

app.get('/', (req, res) => {
    const msg = respuesta()
    res.send(msg)
});

app.listen(3000, () => {
    console.log('Server on...')
});