'use strict'

const index = {
    login: 'call sp_login(?,?,?)',
    getMenu: 'call sp_get_sys_menu(?)',
    changePassword: 'call sp_change_password(?,?,?)',
}

const system = {
    user:{
        getUser: 'select * from sys_user',
        saveUser: 'call sp_save_user(?,?,?,?,?,?)',
        getUserRole: 'select b.role_id from sys_user a join sys_role_user b on a.user_id=b.user_id where a.user_id=?',
        saveUserRole: 'call sp_save_user_role(?,?,?)',
    },
    role:{
        getRole: 'select * from sys_role',
        saveRole: 'call sp_save_role(?,?,?)',

        getRolePermission: 'select b.menu_id, b.menu_name,a.role_id,a.permission '
                    +' from sys_role_permission a join sys_menu b on a.menu_id=b.menu_id where a.role_id=?',
        saveRolePermission: 'call sp_save_role_permission(?,?,?)',
    },
    chkRoute:{
        getMenuChkUser: 'select a.*,b.user_name,b.dept_name from sys_check_route a join sys_user b on a.chk_user=b.user_no where menu_id=?',
        saveChkRoute: 'call sp_save_chk_route(?,?,?)',
        saveRouteLevel: 'update sys_check_route set chk_level=?,need_mail=? where id=?',
    }
    
}

module.exports={
    index,
    system
}