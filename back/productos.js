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

const PUERTO = 6300

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

app.get('/productos', (req, res) => {
    const query = `SELECT p.id_producto, p.nombre_producto, p.precio, p.Cantidad_productos, c.categorias, pr.proveedores
    FROM producto p
    INNER JOIN categorias c ON p.id_Categoria = c.id_Categoria
    INNER JOIN proveedor pr ON p.id_proveedor = pr.id_proveedor;`

    conexion.query(query, (error, resultado) => {
        if(error) return console.error(error.message)

        if(resultado.length > 0) {
            res.json(resultado)
        } else {
            res.json(`No hay registros`)
        }
    })
})

