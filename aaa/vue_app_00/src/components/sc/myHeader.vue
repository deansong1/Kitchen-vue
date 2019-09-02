<template>
    <div>
        <div class="logo">
            <a  @click="skip"></a>
            <span @click="login"></span>
        </div>
        <div class="aline"></div>
    </div>
</template>
<script>
export default {
    data(){
        return{

        }
    },
    methods: {
        skip(){
            this.$router.push("/scHome");
        },
        login(){
            this.$router.push("/sc_Login");
        }
    },
}
</script>
<style scoped>
.logo{
display:flex;
justify-content:space-between;
height:50px;
line-height:50px;
align-content:center;
}
.logo a{
width:102px;
height:33px;
display:block;
background:url("../../assets/sc_logo.png") no-repeat left center;
background-size:100% 100%;
margin:8px 0 0 10px;
}
.logo span{
background:url("../../assets/nologin.png") no-repeat;
width:50px;
height:50px;
margin:10px -4px 0 0;
}
.aline{
height:0;
border-top:2px solid #fa7e3e;
}
</style>