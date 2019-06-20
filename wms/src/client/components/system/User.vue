<template>
    <el-row>
        <el-input v-model="inputEmpno" style="width:250px"></el-input>
        <el-button type="primary" @click="showPage(1)">查询</el-button>
        <el-button type="warning" @click="addUser" v-if="curmenu.permission.substr(1,1)==1">新增</el-button>

        <div class="spliter"></div>
        
        <el-table :data="pagedata">
            <el-table-column label="帐号" prop="user_no"></el-table-column>
            <el-table-column label="姓名" prop="user_name"></el-table-column>
            <el-table-column label="部门" prop="dept_name"></el-table-column>
            <el-table-column label="邮件" >
                <template slot-scope="scope">
                    <el-popover trigger="hover" placement="right">
                        <span>{{ scope.row.email}}</span>
                        <div slot="reference" class="name-wrapper">
                            <el-tag size="medium">{{ scope.row.email.substr(0,15) }}</el-tag>
                        </div>
                    </el-popover>
                </template>
            </el-table-column>
            <el-table-column label="手机" prop="cell_phone"></el-table-column>
            <el-table-column label="是否启用" >
                <template slot-scope="scope">
                    <el-tag v-if="scope.row.enabled=='1'">启用</el-tag>
                    <el-tag type="danger" v-else>禁用</el-tag>
                </template>
            </el-table-column>
            <el-table-column label="操作" min-width="100px">
                <template slot-scope="scope">
                    <el-button type="primary" size="mini"  @click="editUser(scope.row)" :disabled="curmenu.permission.substr(2,1)==0">修改</el-button>
                    <el-button type="warning" size="mini"  @click="editRole(scope.row)" :disabled="curmenu.permission.substr(2,1)==0">权限</el-button>
                </template>
            </el-table-column>
        </el-table>
      
        <el-dialog :visible.sync="editDialogVisible" title="用户维护" :close-on-click-modal="false">
            <el-form :model='formUserData' ref="formUser" :rules="rules" inline-message label-width="80px">
                <el-form-item label="帐号" prop="userno">
                    <el-input v-model="formUserData.userno" :disabled="formUserData.userid>0"></el-input>
                </el-form-item>                        
                <el-form-item label="姓名" prop="usernm">
                    <el-input v-model="formUserData.usernm"></el-input>
                </el-form-item>           
                <el-form-item label="部门" prop="dept">
                    <el-input v-model="formUserData.dept"></el-input>
                </el-form-item>            
                <el-form-item label="邮件">
                    <el-input v-model="formUserData.email"></el-input>
                </el-form-item>            
                <el-form-item label="电话">
                    <el-input type="number" v-model="formUserData.phone"></el-input>
                </el-form-item>
            </el-form>
            <span slot="footer" class="dialog-footer">
                <el-button @click="editDialogVisible = false">取 消</el-button>
                <el-button type="primary" @click="saveUser">保 存</el-button>
            </span>
        </el-dialog>

        <el-dialog title="权限设置" :visible.sync="dialogVisible">
            <p style="font-size:20px;font-weight:600;text-align:center;border-bottom:2px solid #eee">用户：{{selUser.usernm}}</p>
            <div class="row" style="min-height:300px;">
                <el-transfer :titles="['角色列表','已选角色']"
                    filterable 
                    :data="sysroles" 
                    :props="{'key':'role_id','label':'role_name'}"
                    v-model="userroles" style="width:500px;margin:auto">
                </el-transfer>
            </div>
            
            <span slot="footer" class="dialog-footer">
                <el-button type="primary" @click="saveUserRole">保 存</el-button>
                <el-button @click="dialogVisible = false">取 消</el-button>
            </span>
        </el-dialog>
    </el-row>

</template>
<script>
import {mapGetters, mapActions} from 'vuex'
import { constants } from 'fs';
export default {
    name:'user',
    data(){
        return{
            editDialogVisible: false,
            dialogVisible: false,
            pagedata: [],
            currentPage: 1,
            userroles: [],
            sysroles: [],
            users: [],
            selUser:{
                userno:'',
                usernm: ''
            },
            inputEmpno: '',
            formUserData: {
                userid: 0,
                userno: '',
                usernm: '',
                dept: '',
                email: '',
                phone: '',
            },
            rules: {
                userno: {required: true,message:'请输入帐号',trigger:'blur'},
                usernm: {required: true,message:'请输入姓名',trigger:'blur'},
            }
        }
    },
    computed:{
        ...mapGetters([
            'userinfo','curmenu','SysErrCode','apiServer'
        ]),
    },
    created(){
        this.getUser();
    },
    updated(){
    },
    methods:{
        getUser(){
            this.$http.get(this.apiServer+'/api/system/getUser').then(res=>{
                res = res.data
                if(res.errcode == 0){
                    this.pagedata = res.data;
                }                
            })
        },
        getRoles(){
            this.$http.get(this.apiServer+'/api/system/getRole').then(res=>{
                res = res.data;
                if(res.errcode == 0){
                    this.sysroles = res.data;
                }
            })
        },
        getUserRole(userno){
            this.userroles = [];
            this.$http.get(this.apiServer+'/api/system/getUserRole',{params:{userno:userno}}).then(res=>{
                res = res.data;
                if(res.errcode == 0){                    
                    for(var i = 0; i < res.data.length; i++){
                        this.userroles.push(res.data[i].role_id)
                    }
                    this.dialogVisible = true;
                }
            })
        },
        
        saveUser(){
            var chkOk = false;
            this.$refs['formUser'].validate(validate=>{
                chkOk = validate;
            })
            if(! chkOk) return;
            this.$http.get(this.apiServer+'/api/system/saveUser',{params:this.formUserData}).then(res=>{
                res = res.data;
                if(res.errcode == 0){
                    this.$message({message: res.errmsg,type: 'success'});
                    this.getUser();
                    this.editDialogVisible = false;
                }else{
                    this.$alert(res.errmsg,this.SysErrCode.SAVE_ERR,{type:'error'});
                }
            })
        },
        setFormUserData(item){
            if(this.$refs['formUser']){
                this.$refs['formUser'].clearValidate();
            }
            this.formUserData.userid = item ? item.user_id : 0;
            this.formUserData.userno = item ? item.user_no : '';
            this.formUserData.usernm = item ? item.user_name : '';
            this.formUserData.dept = item ? item.dept_name : '';
            this.formUserData.email = item ? item.email : '';
            this.formUserData.phone = item ? item.cell_phone : '';
            this.editDialogVisible = true;            
        },
        addUser(){
            this.setFormUserData();
        },
        editUser(item){
            this.setFormUserData(item);
        },
        editRole(item){
            this.selUser.userno = item.user_no;
            this.selUser.usernm = item.user_name;
            this.getUserRole(item.user_no);
            if(this.sysroles.length == 0)
                this.getRoles();
        },
        addUserRole(){
            var str = $('.ul-role .selected').html();
            if( this.userroles.indexOf(str)>=0){
                this.$toast('已有该角色')
                return false;
            }
            this.userroles.push(str);
        },
        removeUserRole(){
            var str = $('.ul-user .selected').html();
            var idx = this.userroles.indexOf(str);
            this.userroles.splice(idx,1);
        },
        saveUserRole(){
            var _this = this;
            if(this.userroles.length==0){
                this.$alert('请选择角色','出错啦',{type:'error'});
                return false;
            }
            var data = {'userno': this.selUser.userno,'roles': this.userroles.join(','),'opuser': this.userinfo.user_no};
            this.$http.get(this.apiServer+'/api/system/saveUserRole',{params:data}).then(res=>{
                res = res.data;
                if(res.errcode == 0){
                    this.$message({message:res.errmsg,type:'success'});
                    this.dialogVisible = false;
                }else{
                    this.$alert(res.errmsg,'出错啦',{type:'error'})
                }
            })
        }
    }
}
    
            
</script>
<style lang="scss" scoped>
    .div-roles{
        height: 100%;
        >ul{
            border: 1px inset;
            height: 90%;
            list-style: none;
            padding: 0;
            overflow: hidden;
            overflow-y: scroll;
            >li{
                padding-left:5px;
                line-height: 40px;
                background-color:#eee;
                border-bottom: 1px solid #fff;
                cursor: pointer;
            }
        }
        .selected{
            background-color: forestgreen;
        }
    }
    .div-operator{
        margin: auto;
        text-align: center;
        >p{
            cursor: pointer;
            color: blue;
            opacity: 0.5;
        }
        >p:hover{
           opacity: 0.8;
        }
    }
</style>
