const express = require('express')
const mysql = require('mysql')
const bodyParser = require('body-parser')
const cors = require('cors');


const app = express()

app.use(function(req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', '*');
    res.setHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next()
})

app.use(bodyParser.json())

const port = 8300;

// Configuración de MySQL
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'intradroxinet'
});

db.connect((err) => {
  if (err) {
    throw err;
  }
  console.log('Conexión a la base de datos establecida');
});

// Middleware para analizar solicitudes JSON
app.use(bodyParser.json());
// Habilitar CORS para todas las solicitudes
app.use(cors());

// Rutas
app.get('/facturas', (req, res) => {
  const sql = 'SELECT * FROM factura';
  db.query(sql, (err, result) => {
    if (err) {
      res.status(500).send('Error al obtener las facturas');
      return;
    }
    res.json(result);
  });
});

app.get('/detalles-factura/:id', (req, res) => {
  const idFactura = req.params.id;
  const sql = `SELECT * FROM detalle_factura WHERE id_factura = ${idFactura}`;
  db.query(sql, (err, result) => {
    if (err) {
      res.status(500).send('Error al obtener los detalles de la factura');
      return;
    }
    res.json(result);
  });
});

// Iniciar el servidor
app.listen(port, () => {
  console.log(`Servidor iniciado en http://localhost:${port}`);
});
