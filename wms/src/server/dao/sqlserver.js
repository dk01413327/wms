'use strict'

const sqlserver = require('mssql');
const conf = require('./../config/config');

const pool = new sqlserver.ConnectionPool(conf.sqlConfig).connect();

async function query(sql){    
    try{
        let conn = await pool;
        const request = await conn.request();
        const result = await request.query(sql);
        //conn.close();
        return result.recordset
    }catch(err){
        return {errcode:1,errmsg:err}
    }
}

module.exports = {
    query,
}