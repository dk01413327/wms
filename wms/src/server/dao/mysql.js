const mysql = require('mysql')
const config = require('./../config/config.js')

const pool = mysql.createPool(config.mysqlConfig)

pool.connectionLimit = 10; //连接池中可以存放的最大连接数
pool.waitForConnections = true; //连接使用量超负荷是否等待
pool.queueLimit = 0; //每个连接可操作的列数上限，0为没有上限

var mysqlConn = () =>{
	return new Promise((resolve,reject)=>{
		pool.getConnection((err,conn)=>{
			if(err){
				reject(err);
			}else{				
				resolve(conn);
			}
		})
	})
}

var query = (sql,params) =>{
	return new Promise((resolve,reject)=>{
		try{
			pool.getConnection((err,conn)=>{
				if(err){
					reject(err)
				}else{
					conn.query(sql,params,function(err,result){
						if(err){
							reject(err)
						}else{
							resolve(result);
						}
					})
				}
			})
		}catch(err){
			reject(err);
		}		
	})
}



module.exports = {
	query
}