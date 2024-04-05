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

const PUERTO = 4300

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

app.get('/productos/alimentos', (req, res) => {
    const query = `SELECT p.id_producto, p.nombre_producto, p.precio, p.Cantidad_productos, c.categorias, pr.proveedores
    FROM producto p
    INNER JOIN categorias c ON p.id_Categoria = c.id_Categoria
    INNER JOIN proveedor pr ON p.id_proveedor = pr.id_proveedor
    WHERE p.id_Categoria = 4;`

    conexion.query(query, (error, resultado) => {
        if(error) return console.error(error.message)

        if(resultado.length > 0) {
            res.json(resultado)
        } else {
            res.json(`No hay registros`)
        }
    })
})

app.get('/productos/alimentos/:id', (req, res) => {
    const { id } = req.params

    const query = `SELECT * FROM producto WHERE id_producto=${id};`
    conexion.query(query, (error, resultado) => {
        if(error) return console.error(error.message)

        if(resultado.length > 0) {
            res.json(resultado)
        } else {
            res.json(`No hay registros`)
        }
    })
})

app.post('/productos/alimentos/agregar', (req, res) => {
    const { nombre_producto, precio, id_Categoria, id_proveedor, Cantidad_productos } = req.body;

    // Verifica si id_Categoria no es nulo
    if (id_Categoria === null || id_Categoria === undefined) {
        return res.status(400).json('El campo id_Categoria no puede ser nulo.');
    }

    // Construye la consulta SQL
    const query = 'INSERT INTO producto (nombre_producto, precio, id_Categoria, id_proveedor, Cantidad_productos) VALUES (?, ?, ?, ?, ?)';
    const values = [nombre_producto, precio, id_Categoria, id_proveedor, Cantidad_productos];

    // Ejecuta la consulta
    conexion.query(query, values, (error, result) => {
        if (error) {
            console.error('Error al insertar el producto: ', error);
            return res.status(500).json('Ocurrió un error al insertar el producto');
        }

        console.log('Se insertó correctamente el producto');
        res.json('Se insertó correctamente el producto');
    });
});
  
app.put('/productos/actualizar/alimentos/:id_producto', (req, res) => {
    const id_producto = req.params.id_producto;
    const { nombre_producto, precio, id_Categoria, id_proveedor, Cantidad_productos } = req.body;

    const query = 'UPDATE producto SET nombre_producto=?, precio=?, id_Categoria=?, id_proveedor=?, Cantidad_productos=? WHERE Id_producto=?';

    conexion.query(query, [nombre_producto, precio, id_Categoria, id_proveedor, Cantidad_productos, id_producto], (error, results) => {
        if (error) {
            console.error(error.message);
            return res.status(500).json('Ocurrió un error al actualizar el producto');
        }
        console.log(`Se actualizó correctamente el producto con ID ${id_producto}`);
        res.json('Se actualizó correctamente el producto');
    });
});

app.delete('/productos/borrar/:id', (req, res) => {
    const { id } = req.params

    const query = `DELETE FROM producto WHERE Id_producto=${id};`
    conexion.query(query, (error) => {
        if(error) console.error(error.message)

        res.json(`Se eliminó correctamente el producto`)
    })
})