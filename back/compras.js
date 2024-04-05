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

const PUERTO = 7300

const connection = mysql.createConnection(
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

connection.connect((err) => {
    if (err) {
      console.error('Error al conectar a la base de datos: ', err);
      return;
    }
    console.log('Conexión establecida correctamente');
  });

app.get('/', (req, res) => {
    res.send('API')
})

// Ruta para recibir datos del front-end y agregarlos a la tabla 'factura'
app.post('/crearfactura', (req, res) => {
  const { nombre_cliente, dni_cliente, dni_empleado, detalle } = req.body;

  // Insertar datos en la tabla 'factura'
  const facturaData = { nombre_cliente, dni_cliente, dni_empleado };
  connection.query('INSERT INTO factura SET ?', facturaData, (error, results, fields) => {
    if (error) {
      console.error('Error al insertar en la tabla factura: ', error);
      return res.status(500).send('Error interno del servidor al crear factura');
    }

    console.log('Datos insertados en la tabla factura correctamente');

    // Obtener el ID de la factura insertada
    const id_factura = results.insertId;

    // Insertar datos en la tabla 'detalle_factura'
    const detalleInsertions = detalle.map(item => {
      return new Promise((resolve, reject) => {
        const detalleFacturaData = {
          id_factura,
          Nombre_producto: item.Nombre_producto,
          cantidad: item.cantidad,
          Valor_unitario: item.Valor_unitario
        };

        connection.query('INSERT INTO detalle_factura SET ?', detalleFacturaData, (err, results) => {
          if (err) {
            console.error('Error al insertar en la tabla detalle_factura: ', err);
            return reject('Error interno del servidor al insertar detalle factura');
          }
          console.log('Datos insertados en la tabla detalle_factura correctamente');
          resolve();
        });
      });
    });

    // Ejecutar todas las inserciones de detalle en paralelo
    Promise.all(detalleInsertions)
      .then(() => {
        res.status(200).send('Factura creada exitosamente');
      })
      .catch(error => {
        console.error('Error al insertar detalles de factura: ', error);
        res.status(500).send('Error interno del servidor al crear factura');
      });
  });
});