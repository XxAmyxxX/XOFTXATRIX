const express = require('express')
const mysql = require('mysql')
const bodyParser = require('body-parser')

const app = express()

app.use(function(req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', '*');
    res.setHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next()
})

app.use(bodyParser.json())

const PUERTO = 8300

const conexion = mysql.createConnection(
    {
        host:'localhost',
        port: 3306,
        database:'intradroxinet',
        user:'root',
        password:''
    }
)

app.listen(PUERTO, () => {
    console.log(`Servidor corriendo en el puerto ${PUERTO}`);
})

conexion.connect(error => {
    if(error) throw error
    console.log('Conexión exitosa a la base de datos');
})

app.get('/', (req, res) => {
    res.send('API')
})
app.get('/categorias', (req, res) => {
    const query = "SELECT * FROM categorias WHERE id_Categoria = 1;";

    conexion.query(query, (error, resultado) => {
        if (error) {
            console.error('Error al obtener la categoría: ', error);
            res.status(500).json('Ocurrió un error al obtener la categoría');
            return;
        }

        if (resultado.length > 0) {
            res.json(resultado);
        } else {
            res.json('No hay registros');
        }
    });
});







