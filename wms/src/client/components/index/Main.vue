<template>
        <el-container id="wrapper" style="height:100%">
            <el-menu class="left-menu" unique-opened router background-color="#e3f2fd" active-text-color="red" :collapse="isCollapse">
                <el-menu-item class="logo" index="index">
                    <i v-if="isCollapse" class="logo-text">SED</i>
                    <span ><img style="height:45px" src='/static/images/logo.gif' /></span>
                </el-menu-item>
                <el-menu-item index="/index" @click="add('index')">           
                    <i class="el-icon-location"></i>
                    <span>首页</span>
                </el-menu-item>
                <el-submenu popper-class="amenu" :index="idx+''" :key="idx" v-for="(item,idx) in sysmenu" :id="item.menu_id">
                    <template slot="title">
                    <i :class="item.menu_icon"></i>
                    <span>{{item.menu_name}}</span>
                    </template>
                    <el-menu-item-group>
                        <el-menu-item  v-for="(sub,subidx) in item.children" :key="subidx" :id="sub.menu_id" index="index"  
                        @click="add(sub)">
                            {{sub.menu_name}}  
                        </el-menu-item>
                    </el-menu-item-group>
                </el-submenu>
            </el-menu>

            <el-container>
                <el-main id='page-main'>
                <el-header class="page-header" >
                    <el-row type="flex" align="middle" >
                        <el-col :span="1" class="nav-push" >
                            <span class="pusher" style="" @click="push"><i style="margin-top:15px;" class="el-icon-menu"></i></span>
                        </el-col>
                        <el-col :offset="20" :span="3" class="nav-user">
                            <el-dropdown placement="bottom" trigger="click" @command="handleDropDown">
                                <span class="user-text">
                                    <img src='/static/images/user.png' style="width:40px;height:40px;vertical-align: middle;">
                                    {{userinfo.user_name}}</span>                            
                                <el-dropdown-menu slot="dropdown">
                                    <el-dropdown-item  command="password">修改密码</el-dropdown-item>
                                    <el-dropdown-item  command="logout" >注销登录</el-dropdown-item>
                                </el-dropdown-menu>
                            </el-dropdown>
                        </el-col>
                    </el-row>
                </el-header>
                    <el-tabs v-model="activeTab" type="border-card" closable  @tab-remove="removeTab" style="height:100%">  
                        <template  v-for="(item,idx) in tabs" >                     
                        <el-tab-pane :label="item.label" :name="item.name" :key="idx" v-if="item.hidden == false">
                            <router-view :name="item.name" /></el-tab-pane>
                        </template>
                    </el-tabs>
                </el-main>
            </el-container> 
            <el-dialog :visible.sync="dialogVisible"  title="修改密码">
                <el-form label-width="80px">                
                    <el-form-item label="旧密码">
                        <el-input type="password" v-model="oldpw"></el-input>
                    </el-form-item>
                    <el-form-item label="新密码">
                        <el-input type="password" v-model="newpw1"></el-input>
                    </el-form-item>
                    <el-form-item label="确认密码">
                        <el-input type="password" v-model="newpw2"></el-input>
                    </el-form-item>
                </el-form>
                <span slot="footer">
                    <el-button @click="dialogVisible=false">取消</el-button>
                    <el-button type="primary" @click="changePassword">确认</el-button>
                </span>
            </el-dialog>
        </el-container>
</template>
<script>
import {mapGetters} from 'vuex'
import { constants } from 'fs';

export default {
    data(){
        return {
            dialogVisible:false,
            isCollapse:false,
            title:'',
            tabs:[{'label':'首页','name':'index','hidden':false}],
            activeTab: 'index',
            newpw1:'',
            newpw2:'',
            oldpw:''
        }        
    },
    computed:{
        ...mapGetters(['userinfo','sysmenu','apiServer'])
    },
    created(){
        this.getSysMenu();
    },
    mounted(){
    },
    methods:{
        getSysMenu(){
            this.$store.dispatch('setMenu',[]);
            var data ={userno: this.userinfo.user_no};
            this.$http.get(this.apiServer+'/api/index/getmenu',{params: data}).then(res=>{
                res = res.data;
                if(res.errcode == 1){
                    this.$alert(res.errmsg,'加载系统菜单失败',{type:'error'})
                }else{
                    this.$store.dispatch('setMenu',res.data);
                }
            })
        },
        push(){
            this.isCollapse = !this.isCollapse;
            setTimeout(function(){
                $(window).trigger("resize");
            },1000)
        },
        add(item){
            if(item == 'index'){this.activeTab=item;return;}
            
            //新开页面,Q1:新开页面在vuex中取到的permission为空，暂时用storage代替
            if(item.new_page==1){
                const { href } = this.$router.resolve({name: item.com_name})                
                window.sessionStorage.setItem('permission',item.permission);
                window.open(href);
                return false;
            }

            this.$store.dispatch('setCurMenu',{'parentid':item.parent_id,'menuid':item.menu_id,'permission':item.permission});
            var arr = this.tabs.filter(function(e){return e.name==item.com_name && e.hidden==false})
            if(arr.length==0){
                this.tabs.push({'label':item.menu_name,'name':item.com_name,'hidden':false});
            }
            this.activeTab = item.com_name;
            $('.el-menu-item').removeClass('is-active');
            $('#'+item.menu_id).addClass('is-active');
        },
        removeTab(targetName){
            if(targetName=='index') {return;}
            this.handleTabs(targetName,true);
            let tabs = this.tabs;
            let activeName = this.activeTab;
            for(var i=this.tabs.length-1; i >= 0; i--){
                if(this.tabs[i].hidden == false){
                    activeName = this.tabs[i].name;
                    break;
                }
            }
            this.activeTab = activeName;            
            $('#tab-'+targetName).remove();
            $('#pane-'+targetName).remove();
            //$('.el-tabs__content').css({'height':window.innerHeight-102,'overflow-y':'auto','-ms-overflow-style': 'none'});            
        },
        handleTabs(name,flag){
            for(var i=0; i < this.tabs.length; i++){
                if(this.tabs[i].name==name){
                    this.tabs[i].hidden = flag;
                    //break;
                }
            }
        },
        handleDropDown(cmd){
            if(cmd=='logout'){
                window.localStorage.clear();
                window.sessionStorage.clear();    
                this.$router.push({ path: '/login' });
            }else{
                this.dialogVisible=true;
            }            
        },
        changePassword(){
            if(this.oldpw==''){
                this.$alert('请输入旧密码','出错啦',{type:'error'});
                return false;
            }
            if(this.newpw1==''){
                this.$alert('请输入新密码','出错啦',{type:'error'});
                return false;
            }
            if(this.newpw1 == this.oldpw){
                this.$alert('新密码和旧密码一致','出错啦',{type:'error'});
                return false;
            }
            if(this.newpw1 != this.newpw2){
                this.$alert('新密码两次输入不一致','出错啦',{type:'error'});
                return false;
            }
            var data ={oldpass:this.oldpw,'newpass': this.newpw1,userid: this.userinfo.user_id};

            this.$http.get(this.apiServer+'/api/changePassword',{params:data}).then(res=>{
                res = res.data;
                if(res.errcode == 0){
                    this.$message({message:'密码修改成功',type:'success'})
                    this.dialogVisible = false;
                    this.handleDropDown('logout');
                }else{
                    this.$alert(res.errmsg,'出错啦',{type:'error'})
                }
            })
        }
    }
}
</script>
<style scoped>
    .logo{
        height: 60px;
        border-bottom: 1px solid rgba(0,0,0,.05);
        margin-bottom: 5px;
        background-color:#bbdaf1 !important;
    }
    .logo-text{
        font-style:normal;
        color:red;
        font-size: 16px;
        font-weight: 600;
    }
    .nav-push{
        height:60px;line-height:60px;text-align:center
    }
    .nav-push:hover{
        background-color:rgba(0,0,0,0.03);
    }
    .user-text{
        color:#007bff;height:60px;line-height:60px;
    }
    .nav-user{
        background-color:rgba(0,0,0,0.03);
        height:60px;text-align:center;
        border-bottom: 2px solid red;
    }
    .nav-user:hover{
        cursor:pointer;
        background-color:#bbdaf1;        
    }

    .el-tabs__content{
        overflow-y: auto;
    }

    .el-menu-item-group ul li{
        background-color:#dbeffd !important;
    }
    .el-menu-item-group ul li:hover{
        background-color:#92c0e2 !important;
    }
    .left-menu{        
        overflow-y: auto;
        overflow-x: hidden;
        box-shadow: 0 2px 4px 0 rgba(0,0,0,.12), 0 0 6px 0 rgba(0,0,0,.04);
        margin: 0;
    }
    .left-menu,.el-tabs__content {-ms-overflow-style: none;}
    .left-menu::-webkit-scrollbar {display: none;}
    .left-menu:not(.el-menu--collapse) {width: 200px;}

    .el-main{overflow: hidden;padding: 0}
    
    .page-header{
        background-color: rgb(227, 242, 253);
        box-shadow: 0 2px 4px 0 rgba(0,0,0,.04), 0 0 6px 0 rgba(0,0,0,.04);
    }
    
    .pusher{
        font-size:30px;
        color:#007bff;
        cursor:pointer;
    }
</style>
