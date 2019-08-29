<template>
    <div>
        <div class="logo" @click="skip">
            <a></a>
            <span></span>
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
        background:url("../../assets/icon-menu.png");
        width:26px;
        height:20px;
        margin:15px 25px 0 0;
    }
    .aline{
        height:0;
        border-top:2px solid #fa7e3e;
    }
</style>