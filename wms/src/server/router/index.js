'use strict'

var express = require('express')
var router = express.Router()
var config = require('./../config/config.js')
//var mysql = require('./../dao/mysql.js')
//var sqlMap = require('./../model/sqlMap.js')

var sqlCreateor = require('./../model/sqlCreator.js')
var sqlserver = require('./../dao/sqlserver.js')
var common = require('./../dao/common.js')

//middleware that is speccific to this router
var Logger = function(req,res,next){
	next()
}

router.use(Logger)


//params:null
router.get('/sysinfo',function(req,res){
	res.send({errcode:0,errmsg:config.appInfo})
})

//params:userno,password
router.get('/login',function(req,res){
	var ip = common.getIP(req);
	(async ()=>{
		try{
			var sql = sqlCreateor.index.login(req.query);
			var result = await sqlserver.query(sql);
			result = result[0];
			if(result.errcode == 0){
				common.backResult(res,result.errcode,'OK',result)
			}else{
				common.backResult(res,result.errcode,result.errmsg)
			}			
		}catch(err){
			console.log(err)
			common.backResult(res,1,err);
		}
	})()
})

//params:userno
router.get('/getmenu',function(req,res){
	(async ()=>{
		try{
			var sql = sqlCreateor.index.getMenu(req.query.userid);
			var data = await sqlserver.query(sql);
			var menu = common.createMenu(data);
			common.backResult(res,0,'OK',menu);
		}catch(err){
			common.backResult(res,1,err);
		}		
	})()
})


//params:userid,oldpassword,newpassword
router.get('/changepassword',function(req,res){	
	(async ()=>{
		try{
			var sql = sqlCreateor.index.changePD(req.query);
			console.log(sql)
			var result = await sqlserver.query(sql);
			console.log(result);
			result = result[0];
			//result = common.parseRowData(result);
			if(result.errcode == 0){
				common.backResult(res,result.errcode,'OK',result)
			}else{
				common.backResult(res,result.errcode,result.errmsg)
			}	
		}catch(err){
			console.log(err)
			common.backResult(res,1,err);
		}
		
	})()
})


module.exports = router