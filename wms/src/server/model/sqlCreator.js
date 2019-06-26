'use strict'

const index = {
    login: params => {
        return "execute sp_login '" + params.userid + "','" + params.password + "'";
    },
    getMenu: userid =>{
        return "execute sp_get_sys_menu " + userid ;
    },
    changePD: (params) =>{
        return "execute sp_change_password '" + params.userid + "','" + params.oldpass + "','" + params.newpass +"'";
    }
}

const system = {
    user: {
        getUser: () =>{
            return "select * from sys_user";
        },
        saveUser: params => {
            return "execute sp_save_user " 
                + params.userid + ",'" + params.userno + "','" + params.usernm 
                + "','" + params.dept + "','" + params.email 
                + "','"+params.phone + "'";
        },
        getUserRole: (params) => {
            return "select b.role_id from sys_user a join sys_role_user b on a.user_id= b.user_id where a.user_id='"+params.userid+"'";
        },
        saveUserRole: params => {
            return "execute sp_save_user_role '" + params.userid + "','" + params.roles + "','" + params.opuser + "'";
        }
    },

    role: {
        getRole: () =>{
            return "select * from sys_role"
        },
        saveRole: params =>{
            return "execute sp_save_role "+params.roleid + ",'" + params.rolenm + "','" + params.roledesc + "'";
        },
        getRolePermission: params => {
            return "select b.menu_id,b.menu_name,a.role_id,a.permission "
                +" from sys_role_permission a join sys_menu b on a.menu_id=b.menu_id "
                +" where a.role_id="+params.roleid;
        },
        saveRolePermission: params =>{
            return "execute sp_save_role_permission " + params.roleid + ",'" + params.menuid + "','" + params.permission + "'";
        }
    },
    chkRoute:{
        getMenuChkUser: params => {
            return "select a.*,b.user_name,b.dept_name from sys_check_route a join sys_user b on a.chk_user=b.user_id "
                  +" where menu_id='" + params.menuid + "' order by chk_level";
        },
        //`(menuid varchar(20),users varchar(100),opuser varchar(20))

        saveChkRoute: params => {
            return "execute sp_save_chk_route '" + params.menuid + "','" + params.users + "','" + params.opuser + "'";
        },
        saveRouteLevel: params => {
            return "update sys_check_route set chk_level = " + params.level + ",need_mail = " + params.needmail 
                + " where id= " + params.chkid;
        }
    }
    
}

module.exports={
    index,
    system
}