<template>
    <div>
         <div class="am_top">
            <div><img src="../../assets/mor03.jpg" alt=""></div>
            <span>txk的厨房</span>
        </div>
        <ul class="am_list">
            <li><router-link to="./sc_collect">收藏</router-link><span>|</span></li>
            <li><router-link to="./Myquestion">问题</router-link><span>|</span></li>
            <li><router-link to="./Answer">答案</router-link><span>|</span></li>
            <li><a href="javascript:;" @click="ress">退出</a></li>
        </ul>
    </div>
</template>
<script>
export default {
      data(){
        return{
            
        }
    },
    methods: {
       Load(){
          var url="sc_admin";
          this.axios.get(url).then(res=>{
              if(res.data.code==-1){
                  this.$toast("请先登陆");
                  this.$router.push("/sc_Login");
              }
          })
       },
       ress(){
           var url="ress";
           this.axios.get(url).then(res=>{
                console.log(res.data.code);
               if(res.data.code==1){
                   this.$toast("退出成功");
                   this.$router.push("/sc_Login");
               }
           })
       }
       
    },
    created() {
        // this.Load();
    },
}
</script>
<style scoped>
     .am_top{
        margin-top:10px;
        display: flex;
        padding-left:10px;
    }
    .am_top img{
        width:26px;
        height:26px;
        border-radius: 50%;
    }
    .am_top>span{
        display: inline-block;
        height:26px;
        line-height:26px;
        padding-left: 10px;
    }
    .am_list{
        display: flex;
        list-style: none;
        border-top:1px solid #ccc;
        border-bottom:1px solid #ccc;
        margin-top: 10px;
        padding: 5px 0 5px 10px;
    }
    .am_list span{
        padding-left:10px;
    }
    .am_list li{
        margin-right:10px;
    }
    .am_list li a{
        text-decoration: none;
        color:#000;
    }
</style>