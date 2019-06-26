<template>
    <el-row>          
        <el-button type="primary" @click="showDialog">新增角色</el-button>
        <div class="spliter"></div>
        <el-row :gutter="10">
            <el-col :span="4" >
                <small>角色列表</small>
                <el-select v-model="permissionData.role_id" placeholder="请选择角色" @change="showRolePermission">
                    <el-option v-for="role in roles" :label="role.role_name" :key="role.role_id" :value="role.role_id" ></el-option>
                </el-select>
                <el-tree class="aside" highlight-current default-expand-all :data="sysmenu" :props="defaultProps" @node-click="addFunction">
                    <span slot-scope="{node}">
                        <span class="tree-item">{{ node.label }}</span>
                    </span>
                </el-tree>                
            </el-col>
            <el-col :span="20" class="atable">               
                <el-divider> <p>角色权限列表</p> </el-divider>
                <el-table :data="rolePermission" >
                    <el-table-column label='模块' prop="menu_name" min-width="200"></el-table-column>
                    <el-table-column label='查看' >
                        <template slot-scope="scope">
                            <el-checkbox v-model="scope.row.bquery"></el-checkbox>
                        </template>
                    </el-table-column>
                    <el-table-column label='新增'>
                        <template slot-scope="scope">
                            <el-checkbox v-model="scope.row.badd"></el-checkbox>
                        </template>
                    </el-table-column>
                    <el-table-column label='修改'>
                        <template slot-scope="scope">
                            <el-checkbox v-model="scope.row.bedit"></el-checkbox>
                        </template>
                    </el-table-column>
                    <el-table-column label='删除' >
                        <template slot-scope="scope">
                            <el-checkbox v-model="scope.row.bdel"></el-checkbox>
                        </template>
                    </el-table-column>
                    <el-table-column label='审核' >
                        <template slot-scope="scope">
                            <el-checkbox v-model="scope.row.bapp"></el-checkbox>
                        </template>
                    </el-table-column>
                    <el-table-column label='导出' prop="">
                        <template slot-scope="scope">
                            <el-checkbox v-model="scope.row.bprint"></el-checkbox>
                        </template>
                    </el-table-column>
                    <el-table-column label="打印" prop="">
                        <template slot-scope="scope">
                            <el-checkbox v-model="scope.row.bexport"></el-checkbox>
                        </template>
                    </el-table-column>
                    <el-table-column label="操作">
                        <template slot-scope="scope">
                            <el-button size="mini" type="primary" @click="saveRolePermisson(1,scope.row)">保存</el-button>
                        </template>
                    </el-table-column>
                </el-table>
            </el-col>
        </el-row>
        <el-dialog :visible.sync="dialogVisible" title="角色维护">
            <el-form :model="formRoleData" ref="formRole" inline-message label-width="80px">
                <el-form-item label="角色名称" prop="rolenm"
                :rules="[{required: true, message:'角色名称不能为空'}]">
                    <el-input type="rolenm" v-model="formRoleData.rolenm"></el-input>
                </el-form-item>
                <el-form-item label="角色描述">
                    <el-input  v-model="formRoleData.roledesc"></el-input>
                </el-form-item>
            </el-form>
            <span slot="footer">
                <el-button type="primary" @click="saveRole">保存</el-button>
                <el-button @click="dialogVisible = false">取消</el-button>
            </span>
        </el-dialog>
        <el-dialog :visible.sync="roleDialogVisible" title="角色权限维护">
            <p>角色：{{permissionData.selrolenm}}  模块：{{permissionData.menunm}}</p>
            <el-divider></el-divider>
            <span>请选择权限：</span>
            <el-checkbox v-model="permissionData.bquery">查看</el-checkbox>
            <el-checkbox v-model="permissionData.badd">新增</el-checkbox>
            <el-checkbox v-model="permissionData.bedit">修改</el-checkbox>
            <el-checkbox v-model="permissionData.bdel">删除</el-checkbox>            
            <el-checkbox v-model="permissionData.bapp">审核</el-checkbox>
            <el-checkbox v-model="permissionData.bexport">导出</el-checkbox>
            <el-checkbox v-model="permissionData.bprint">打印</el-checkbox>
            <el-divider></el-divider>
            <span slot="footer">
                <el-button type="primary" @click="saveRolePermisson(0)">保存</el-button>
                <el-button @click="roleDialogVisible = false">取消</el-button>
            </span>
        </el-dialog>
    </el-row>
</template>
<script>
import {mapGetters,mapActions} from 'vuex';
import { constants } from 'fs';
export default {
    data(){
        return {
            dialogVisible:false,
            roleDialogVisible: false,
            roles: [],
            rolePermission:[],
            defaultProps: {
                children: 'children',
                label: 'menu_name'
            },
            formRoleData:{
                roleid: 0,
                rolenm: '',
                roledesc: ''
            },
            permissionData:{
                role_id: '',
                selrolenm: '',
                menu_id: '',
                menunm: '',
                bquery: false,
                badd: false,
                bedit: false,
                bdel: false,
                bapp: false,
                bexport: false,
                bprint: false,
            }
        }
    },
    
    computed:{
        ...mapGetters(['sysmenu','userinfo','SysErrCode','apiServer'])
    },
    created(){
        this.getRole();
    },
    mounted(){
        $('.aside').css('height',window.innerHeight-250)
        $('.atable').css('height',window.innerHeight-200)
        
    },
    methods:{
        showDialog(){
            if(this.$refs['formRole']){
                this.$refs['formRole'].clearValidate();
            }
            this.formRoleData.rolenm = '';
            this.formRoleData.roledesc = '';
            this.dialogVisible = true;
        },
        saveRole(){
            var chkOk = false;
            this.$refs['formRole'].validate(validate=>{
                chkOk = validate;
            })
            if(!chkOk) return;
            this.$http.get(this.apiServer+'/api/system/saveRole',{params:this.formRoleData}).then(res=>{
                res = res.data;
                if(res.errcode == 0){
                    this.$message({message: res.errmsg,type: 'success'});
                    this.getRole();
                    this.dialogVisible = false;
                }else{
                    this.$alert(res.errmsg,this.SysErrCode.SAVE_ERR,{type: 'error'});
                }
            })
        },
        showRolePermission(value){
            var rolenm = this.roles.filter(item=>{return item.role_id == value});
            this.permissionData.selrolenm= rolenm[0].role_name;
            var data = {'roleid': value}
            this.$http.get(this.apiServer+'api/system/getRolePermission',{params:data}).then(res=>{
                res = res.data;
                data = res.data;
                if(res.errcode == 0){
                    var ary = [];
                    for(var i = 0 ; i < data.length; i++){
                        ary = data[i].permission.split('')
                        data[i].bquery = ary[0]=='1';
                        data[i].badd = ary[1]=='1';
                        data[i].bedit = ary[2]=='1';
                        data[i].bdel = ary[3]=='1';
                        data[i].bapp = ary[4]=='1';
                        data[i].bexport = ary[5]=='1';
                        data[i].bprint = ary[6]=='1';
                    }
                    this.rolePermission = data;
                }
            })
        },
        saveRolePermisson(type,item){
            var permission = '';
            if(type == 0){
                item = this.permissionData;
            }            
            permission = item.bquery ? '1' :'0'
            permission += item.badd ? '1' :'0'
            permission += item.bedit ? '1' :'0'
            permission += item.bdel ? '1' :'0'
            permission += item.bapp ? '1' :'0'
            permission += item.bexport ? '1' :'0'
            permission += item.bprint ? '1' :'0';
            var data ={roleid:item.role_id,menuid:item.menu_id,permission:permission};
            this.$http.get(this.apiServer+'/api/system/saveRolePermission',{params:data}).then(res=>{
                res = res.data;
                if(res.errcode == 0){
                    this.$message({message: res.errmsg,type:'success'});
                    this.roleDialogVisible = false;
                    this.showRolePermission(item.role_id)
                }else{
                    this.$alert(res.errmsg,this.SysErrCode.SAVE_ERR,{type:'error'});
                }
            })
            console.log(item);
            
        },
        addFunction(data,node,self){
            if(this.permissionData.role_id == 0){
                this.$alert('请选择角色名称','出错啦',{type:'error'});
                return;
            }
            var item = this.rolePermission.filter(item=>{return item.menu_id== data.menu_id});
            item = item[0];
            this.permissionData.menunm = data.menu_name
            this.permissionData.menu_id = data.menu_id;
            this.permissionData.bquery = item ? item.bquery : false
            this.permissionData.badd = item ? item.badd : false
            this.permissionData.bedit = item ? item.bedit : false
            this.permissionData.bdel = item ? item.bdel : false
            this.permissionData.bapp = item ? item.bapp : false
            this.permissionData.bexport = item ? item.bexport : false
            this.permissionData.bprint = item ? item.bprint : false
            this.roleDialogVisible = true;
        },
        getRole(){
            this.$http.get(this.apiServer+'/api/system/getRole').then(res=>{
                res = res.data;
                if(res.errcode == 0){
                    this.roles = res.data;
                }
            })
        }
    }
}
</script>
<style scoped>
    .aside{
        margin-top: 10px;
        border:1px solid #409eff;
        border-radius: 5px;
        overflow: auto;
        -ms-overflow-style: none;
    }
    .atable{overflow: auto}
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
    .el-select input{
        background: #eee;
    }
</style>
