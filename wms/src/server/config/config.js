const config = {
	appInfo: {
		companyLogo: '/static/images/logo.gif',
		companyName: '希克斯电子(东莞)有限公司'
	},
	mysqlConfig: {
		host: 'localhost',//'110.45.211.157',
		port: 3306,
		user: 'root',		
		password: 'siixtech',//'dk01413327',
		database: 'wms',
		timezone:'Asia/Shanghai',
	},
	sqlConfig: {
		user: 'sa',
		password: 'dk01413327',
		server: 'localhost\\SQLEXPRESS',
		database: 'wms',
		options: {
			useUTC: true
		},
	}
}

module.exports = config