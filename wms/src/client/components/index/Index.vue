<template>
    <div>
        <el-card shadow="never" style="background:#eee">
            <h1>{{userinfo.user_name}}， 欢迎使用！今天是：{{now}}</h1>
        </el-card>
        
    </div>
</template>
<script>
import {mapGetters}  from  'vuex'
import { setTimeout } from 'timers';
export default {
    computed:{
        ...mapGetters(['userinfo'])
    },
    data(){
        return{
            now: '',
        }
    },
    created(){
        this.showTime();
    },
    methods:{
        showTime(){
            var _this = this;
            setInterval(function(){
                _this.now = _this.$moment().format('YYYY年MM月DD日dddd a hh:mm:ss');
            },1000)
        }
    }
    
}
</script>
<style scoped>

</style>
