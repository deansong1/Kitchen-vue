<template>
    <div>

        <div class="aline"></div> 
        <div class="tou">
            <a class="topbar_left">返回</a>
            <h1>注册美食</h1>
            <router-link to="/sc_Login" class="topbar_right">登录</router-link>
        </div>
        <div class="victim"></div>
        <div class="victim1"></div>
        <div class="ipt">
            <mt-field type="text" :placeholder="unameholder" v-model="uname"></mt-field>
        </div>
        <div class="ipt">
            <mt-field type="password" :placeholder="upwdholder" v-model="upwd"></mt-field>
        </div>
         <div class="ipt">
            <mt-field type="text" :placeholder="user_nameholder" v-model="user_name"></mt-field>
        </div>

        <div class="btn" @click="reg">
            <a>注册</a>
        </div>
    </div>
    
</template>
<script>
export default {
    data(){
        return {
            unameholder:"请输入用户名",
            upwdholder:"请输入密码",
            user_nameholder:"请输入真实姓名",
            uname:"",
            upwd:"",
            user_name:""
        }
    },
    methods:{
        reg(){
            //1.获取用户输入用户名
            var u=this.uname;
            //2.获取用户输入密码
            var p=this.upwd;
            var us=this.user_name;
            // 3.创建正则表达式验证用户名和密码
            var reg=/^[a-z0-9]{3,12}$/i;
            if (!reg.test(u)) {
                this.$toast("用户名格式不正确");
                return;
                };
            if (!reg.test(p)) {
                this.$toast("密码格式不正确");
                return;
                }
                //6:发送ajax请求 axios
                var url="reg";
                var obj={uname:u,upwd:p,user_name:us}
                this.axios.get(url,{params:obj}).then(res=>{
                //7.获取服务器返回结果
                    console.log(res);    
                //7:获取服务器返回结果
                //7.1:注册失败  提示
                if(res.data.code==-1){
                    //7.1注册失败
                    this.$toast("用户名和密码格式有误");
                    }else{
                //7.2:注册成功  跳转登录页面
                    this.$router.push("/sc_Login")
                    }
                   })
                }
            
        },
    components:{
       
    }
}
</script>

<style scoped>
@import url("../../assets/css/reg.css");
</style>