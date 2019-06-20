<template>    
    <div id='login'>
        <el-header>
			<el-row>
				<el-col :span='3'><img class="logo" :src="logo"></el-col>
				<el-col :span='21'><h1 class="header">{{company}}</h1></el-col>
			</el-row>
			
		</el-header>
        <div class="bg-blur">         
            <h2 class="title">SED PORTAL</h2>
        </div>
		<el-card id="login-body">
			<h2 slot='header' style="margin:0">请登录</h2>
			<el-form :model="formLogin" :rule='rules' ref="frmLogin" label-width="40px">
				<el-form-item label="账号" prop="userid">
					<el-input v-model="formLogin.userid" placeholder="请输入账号"></el-input>
				</el-form-item>
				<el-form-item label="密码" prop="password">
					<el-input v-model="formLogin.password" type="password" placeholder="请输入密码" @keyup.enter.native="login()"></el-input>
				</el-form-item>
                <el-checkbox label="记住我" v-model="rememberme"></el-checkbox>
			</el-form>
			<div style="float:right;padding:20px">
				<el-button type="primary" @click="login" >登录</el-button>
				<el-button type="danger" >取消</el-button>
			</div>
			
		</el-card>
        <div class="footer">© SED系统部</div>
    </div>
</template>
<script>
import { mapGetters } from 'vuex'
export default {  
	data(){
		return{
			logo: '',
            company: '',
            rememberme: false,
            formLogin:{
                userid: '',
                password: '',
            },
            rules:{
                userid:{required:true,message:'请输入帐号',trigger:'blur'},
                password:{required:true,message:'请输入密码',trigger:'blur'}
            }
        }
        
    },
    computed:{
        ...mapGetters(['apiServer'])
    },
    created(){
        this.$http.get(this.apiServer+'/api/index/sysinfo').then(res=>{
            if(res.data.errcode == 0){
                this.logo = res.data.errmsg.companyLogo;
                this.company = res.data.errmsg.companyName;
            }
        })
    },
    mounted(){
    },
    methods:{
        login() {
            this.$http.get(this.apiServer+'/api/index/login',{params:this.formLogin}).then(res=>{
                res = res.data;
                if(res.errcode == 0){
                    this.$store.dispatch('setUserInfo',res.data);
                    if(this.rememberme){
                        window.localStorage.setItem('userinfo',JSON.stringify(res.data));
                    }else{
                        window.sessionStorage.setItem('userinfo',JSON.stringify(res.data));
                    }
                    this.$router.push({ path: '/index' });
                }else{
                    this.$alert(res.errmsg,'登录失败',{type:'error'});
                }
                
            })
        },
    },
}

</script>
<style scoped>
.logo{
    padding: 5px 10px;
    width: 120px;
}
.header{
	line-height: 60px;
	margin: 0;
}
.title{
    text-shadow: 3px 3px #000;
    color: #fff;
    text-align: center;
    padding-top: 90px;
    margin: 0;
}
#login{
    height: 100%;
    position: relative;
    background: #fff;
}
.bg-blur{
    height: 350px;
    background:url('/static/images/bg.jpg') no-repeat;
    background-size: cover;    
}
#login-body{
	position:absolute;
	top: 200px;
	left: 0;
	right: 0;
	width: 500px;
	margin:auto;
}

.footer{
    position: absolute;
    left: 0;
    right: 0;
    bottom: 10px;
	text-align:center
}
</style>