import Vue from 'vue'
import App from './App'
import router from './router/index'
import store from './store'

import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

import 'babel-polyfill'
import 'jquery'

import moment from 'moment'
//import 'moment/locale/zh-cn'

import axios from 'axios'

//import css
import './static/css/common.css'

Vue.config.debug = true
Vue.config.productionTip = false
Vue.prototype.$http = axios
moment.locale('zh-cn'); 
Vue.prototype.$moment = moment
Vue.use(ElementUI)

//导航钩子
router.beforeEach((to,from,next)=>{    
	if(to.path == '/login'){
        next();
    }else if(!store.getters.userinfo){
        var userinfo = JSON.parse(window.sessionStorage.getItem('userinfo'));
        if(userinfo == null ){
            userinfo =JSON.parse(window.localStorage.getItem('userinfo'));
        }    
        if(userinfo){
            store.dispatch('setUserInfo',userinfo);
            next();
        }else{
            next({path:'/login'})
        }
	}else{
        next();
    }
})

new Vue({
	el: '#app',
	router: router,
	store: store,
	template: '<App/>',
	components: { App }
})