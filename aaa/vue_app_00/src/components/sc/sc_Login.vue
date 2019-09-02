<template>
    <div>
        <div class="aline"></div> 
        <div class="tou">
            <a class="topbar_left" @click="rethome">返回</a>
            <h1>美食</h1>
            <router-link to="/sc_reg" class="topbar_right">注册</router-link>
        </div>
        <div class="victim"></div>
        <div class="victim1"></div>
        <div class="iput">
            <mt-field type="text" :placeholder="nameholder" v-model="uname"></mt-field>
        </div>
        <div class="iput">
            <mt-field type="password" :placeholder="passholder" v-model="upwd"></mt-field>
        </div>

        <div class="btn" @click="login">
            <a>登录</a>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            nameholder:"用户名",
            passholder:"密码",
            uname:"",
            upwd:""
        }
    },
    methods: {
        login(){
            //获取用户名
            var n=this.uname;
            //获取密码
            var p=this.upwd;
            //定义正则
            var reg=/^[a-z0-9]{3,8}$/i;
            //用正则验证
            if(!reg.test(n)){
                this.$toast("用户名格式不正确");
                return;
            }
            if(!reg.test(p)){
                this.$toast("密码格式不正确");
                return;
            }
            //发送ajax请求
            var url="sc_login";
            var obj={uname:n,upwd:p}
            this.axios.get(url,{params:obj}).then(res=>{
                if(res.data.code==-1){
                    this.$toast("用户名或密码错误");
                }else{
                    this.$router.push("/scHome");
                }
            })
        },
        rethome(){
            this.$router.push("/scHome");
        }

    },
}
</script>
<style scoped>
@import url("../../assets/css/login.css"); 
</style>