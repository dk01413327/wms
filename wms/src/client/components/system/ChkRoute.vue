<template>
    <el-container>
        <el-aside class="aside" style="border:1px solid #eee;margin-right:20px">            
            <el-tree highlight-current default-expand-all :data="sysmenu" :props="defaultProps" @node-click="showChkRoute">
                <span slot-scope="{node}">
                    <span class="tree-item">{{ node.label }}</span>
                </span>
            </el-tree>                
        </el-aside>
        <el-container>
            <el-header height="40px">
                <el-button type="primary" @click="dialogVisible = true" :disabled="notSetup">审核设置</el-button>                
            </el-header>
            <div class="spliter"></div>
            <el-table :data="chkRoute" >
                <el-table-column label='审核顺序' >
                    <template slot-scope="scope">
                        <el-input v-model="scope.row.chk_level"></el-input>
                        
                    </template>
                </el-table-column>
                <el-table-column label='发送邮件' >
                    <template slot-scope="scope">
                        <el-checkbox v-model="scope.row.need_mail"></el-checkbox>
                    </template>
                </el-table-column>
                <el-table-column label='审核人' prop="user_name"></el-table-column>
                <el-table-column label='部门' prop="dept_name"></el-table-column>
                <el-table-column label='设定时间' prop="updated_time"></el-table-column>
                <el-table-column label="操作">
                    <template slot-scope="scope">
                        <el-button type="primary" @click="save(scope.row)">保存</el-button>
                    </template>
                </el-table-column>
            </el-table>
        </el-container>
        <el-dialog title="审核流程设置" :visible.sync="dialogVisible">
            <div style="text-align:center">
            <el-transfer :titles="['用户列表','审核列表']" style="text-align: left; display: inline-block"
                filterable
                :data="users" 
                :props="{'key':'user_no','label':'user_name'}"
                v-model="chkusers" >
            </el-transfer>
            </div>
            <div slot="footer" class="dialog-footer">
                <el-button type="primary" @click="saveChkRoute">保存</el-button>
                <el-button @click="dialogVisible = false">关闭</el-button>                
            </div>
        </el-dialog>
    </el-container>
</template>
<script>
import {mapGetters,mapActions} from 'vuex';
export default {
    data(){
        return {
            dialogVisible:false,
            notSetup : true,
            selMenuId : '',
            chkRoute:[],
            users:[],
            chkusers:[],
            defaultProps: {
                children: 'children',
                label: 'menu_name'
            }
        }
    },
    
    computed:{
        ...mapGetters(['sysmenu','userinfo','apiServer'])
    },
    created(){
        this.getUsers();
    },
    mounted(){
        $('.aside').css('height',window.innerHeight-180)
    },
    methods:{
        getUsers(){
            this.$http.get('/api/system/getUser').then(res=>{
                res = res.data
                if(res.errcode == 0){
                    this.users = res.data;
                }                
            })
        },
        getMenuChkUser(){
            var data = {menuid:this.selMenuId}
            this.chkusers = [];
            this.$http.get(this.apiServer+'/api/system/getMenuChkUser',{params:data}).then(res=>{
                res = res.data;
                if(res.errcode == 0){
                    this.chkRoute = res.data;
                    for(var i = 0 ; i < res.data.length; i++){
                        this.chkusers.push(res.data[i].chk_user);
                        this.chkRoute[i].need_mail = res.data[i].need_mail == 1;
                    }
                }
            })
        },
        showChkRoute(data,node,self){
            if(this.selMenuId == data.menu_id) return ;
            this.selMenuId = data.menu_id;            
            if(data.need_chk==0){
                this.notSetup = true;    
                this.$message({message:'此菜单不需要审核',type:'warning'});
                this.chkRoute=[];
                return;
            }else{
                this.notSetup = false;                
                this.getMenuChkUser();
            }
        },
        saveChkRoute(){
            if(this.chkusers.length==0){this.$message({message:'请选择审核人员',type:'error'});return;}
            var data = {'menuid': this.selMenuId,'users': this.chkusers.join(','),'opuser':this.userinfo.user_id};
            this.$http.get(this.apiServer+'/api/system/saveChkRoute',{params: data}).then(res=>{
                res = res.data;
                if(res.errcode == 0){
                    this.$message({message:'保存成功',type:'success'});
                    this.dialogVisible = false;
                    this.getMenuChkUser();
                }else{
                    this.$alert(res.errmsg,'出错啦',{type:'error'});
                }
            })
        },
        save(item){
            var data = {level: item.chk_level,needmail: item.need_mail ? 1 : 0,chkid: item.id}
            this.$http.get(this.apiServer+'/api/system/saveRouteLevel',{params:data}).then(res=>{
                res = res.data;
                if(res.errcode==0){
                    this.$message({message:'保存成功',type:'success'});                   
                    this.getMenuChkUser();                                     
                }else{
                    this.$alert(res.errmsg,'出错啦',{type:'error'});
                }
            })
        },
    }
}
</script>
<style scoped>
    .aside{
        -ms-overflow-style: none;
    }
    .aside::-webkit-scrollbar {display: none;}
    .cell{
        text-align: center;
    }
    li{
        padding:5px;
    }
    .dept-item:hover{
        background:#eee;
    }
    .bg-none{
        background: none;
    }
    .bg-bbdaf1{
        background:#bbdaf1;
    }
</style>
