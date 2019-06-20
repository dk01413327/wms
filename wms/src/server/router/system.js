'use strict'

var express = require('express')
var router = express.Router()
var mysql = require('./../dao/mysql.js')
var sqlMap = require('./../model/sqlMap.js')

//var sqlserver = require('./../dao/sqlserver.js')
var common = require('./../dao/common.js')

//middleware that is speccific to this router
var Logger = function(req,res,next){
	console.log('system');
	next()
}

router.use(Logger)

//params:null
router.get('/getUser',function(req,res){
	(async ()=>{
        var result = '';
		try{
            var sql = sqlMap.system.user.getUser;
			result = await mysql.query(sql);
			common.backResult(res,0,'OK',result);
		}catch(err){
			common.backResult(res,1,JSON.stringify(err));
		}
		
	})()
})

router.get('/getUserRole',function(req,res){
	(async ()=>{
        var result = '';
		try{
            var sql = sqlMap.system.user.getUserRole;
			result = await mysql.query(sql,req.query.userno);
			common.backResult(res,0,'OK',result);
		}catch(err){
			common.backResult(res,1,JSON.stringify(err));

		}
		
	})()
})

router.get('/saveUser',function(req,res){
	(async ()=>{
        var result = '';
		try{
			var params = common.json2Array(req.query);
            var sql = sqlMap.system.user.saveUser;
			result = await mysql.query(sql,params);
			result = result[0][0];
			result = common.parseRowData(result);
			common.backResult(res,result.errcode,result.errmsg);
		}catch(err){
			common.backResult(res,1,JSON.stringify(err));
		}
		
	})()
})

router.get('/saveUserRole',function(req,res){
	(async ()=>{
        var result = '';
		try{
			var params = common.json2Array(req.query);
            var sql = sqlMap.system.user.saveUserRole;
			result = await mysql.query(sql,params);
			result = result[0][0];
			result = common.parseRowData(result);
			common.backResult(res,result.errcode,result.errmsg);
		}catch(err){
			common.backResult(res,1,JSON.stringify(err));
		}
		
	})()
})

router.get('/getRole',function(req,res){
	(async ()=>{
        var result = '';
		try{
            var sql = sqlMap.system.role.getRole;
			result = await mysql.query(sql);
			common.backResult(res,0,'OK',result);
		}catch(err){
			common.backResult(res,1,JSON.stringify(err));
		}
	})()
})

router.get('/saveRole',function(req,res){
	(async ()=>{
        var result = '';
		try{
			var sql = sqlMap.system.role.saveRole;
			var params = common.json2Array(req.query);
			result = await mysql.query(sql,params);
			result = result[0][0];
			result = common.parseRowData(result);
			common.backResult(res,result.errcode,result.errmsg);
		}catch(err){
			common.backResult(res,1,JSON.stringify(err));
		}
	})()
})

router.get('/getRolePermission',function(req,res){
	(async ()=>{
        var result = '';
		try{
			var sql = sqlMap.system.role.getRolePermission;
			result = await mysql.query(sql,req.query.roleid);
			common.backResult(res,0,'OK',result);
		}catch(err){
			common.backResult(res,1,JSON.stringify(err));
		}
	})()
})

router.get('/saveRolePermission',function(req,res){
	(async ()=>{
        var result = '';
		try{
			var sql = sqlMap.system.role.saveRolePermission;
			var params = common.json2Array(req.query);
			result = await mysql.query(sql,params);
			result = result[0][0];
			result = common.parseRowData(result);
			common.backResult(res,result.errcode,result.errmsg);
		}catch(err){
			common.backResult(res,1,JSON.stringify(err));
		}
	})()
})

router.get('/getMenuChkUser',function(req,res){
	(async ()=>{
        var result = '';
		try{
			var sql = sqlMap.system.chkRoute.getMenuChkUser;
			result = await mysql.query(sql,req.query.menuid);
			common.backResult(res,0,'OK',result);
		}catch(err){
			common.backResult(res,1,JSON.stringify(err));
		}
	})()
})

router.get('/saveChkRoute',function(req,res){
	(async ()=>{
        var result = '';
		try{
			var sql = sqlMap.system.chkRoute.saveChkRoute;
			var params = common.json2Array(req.query);
			result = await mysql.query(sql,params);
			result = result[0][0];
			result = common.parseRowData(result);
			common.backResult(res,result.errcode,result.errmsg);
		}catch(err){
			common.backResult(res,1,JSON.stringify(err));
		}
	})()
})

router.get('/saveRouteLevel',function(req,res){
	(async ()=>{
		try{
			var result = '';
			var sql = sqlMap.system.chkRoute.saveRouteLevel;
			var params = common.json2Array(req.query);
			result = await mysql.query(sql,params);
			common.backResult(res,0,'保存成功');
		}catch(err){
			common.backResult(res,1,JSON.stringify(err));
		}
	})()
})

module.exports = router