'use strict'

const sqlserver = require('mssql');
const conf = require('./../config/config');

const pool = new sqlserver.ConnectionPool(conf.sqlConfig).connect();

async function query(sql){    
    try{
        const conn = await pool;
        const request = await conn.request();
        const result = await request.query('select 1 as cnt');
        return result
    }catch(err){
        return err
    }
}

async function execute(procName,params){
    try{
        const conn = await pool;
        const request = await conn.request();
        await request.execute(procName,params,function(err,result,outValue){
            return result;
        })
    }catch(err){
        return err;
    }
}

module.exports = {
    query,
    execute
}