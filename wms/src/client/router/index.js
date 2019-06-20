import Vue from 'vue'
import Router from 'vue-router'

// 导入对应的vuex文件
import store from './../store'

// 导入相应的子组件
import Login from './../components/index/Login'
import Main from './../components/index/Main'
import Index from './../components/index/Index'
import User from './../components/system/User'
import Role from './../components/system/Role'
import ChkRoute from './../components/system/ChkRoute'
Vue.use(Router)

var router = new Router({
  mode: 'history',
  routes: [
    { path: '/', component: Login },
    { name: 'login', path: '/login', component: Login },
    { name: 'index', path: '/index', component: Main, meta:{requireAuth: true},
      children: [{
        path: '/index',
        components: {
          index: Index,
          user: User,
          role: Role,
          chkroute:ChkRoute,
        }
      }],
      redirect:'/index'
    }
  ]
})

export default router