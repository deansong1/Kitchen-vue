<template>
    <div>
        <!-- <div class="am_top">
            <div><img class="touxiang" src="../../assets/cr7.jpg" alt=""></div>
            <span class="me">我<img src="../../assets/bianji.png"></span>
        </div>
        <ul class="am_list">
            <li @click="me1" data-id="tab1" class=""><a><img src="../../assets/line.png" alt="">收藏</a></li>
            <li @click="me2" data-id="tab2"><a><img src="../../assets/bangzhu.png" alt="">问题</a></li>
            <li @click="me3" data-id="tab3"><a href="javascript:;"><img src="../../assets/tishi.png" alt="">回答</a></li>
            <li><a href="javascript:;" @click="ress"><img src="../../assets/fail.png" alt="">退出</a></li>
        </ul> -->
    </div>
</template>
<script>
export default {
      data(){
        return{
            
        }
    },
    // methods: {
    //    Load(){
    //       var url="sc_admin";
    //       this.axios.get(url).then(res=>{
    //           if(res.data.code==-1){
    //               this.$toast("请先登陆");
    //               this.$router.push("/sc_Login");
    //           }
    //       })
    //    },
    //    ress(){
    //        var url="ress";
    //        this.axios.get(url).then(res=>{
    //             console.log(res.data.code);
    //            if(res.data.code==1){
    //                this.$toast("退出成功");
    //                this.$router.push("/sc_Login");
    //            }
    //        })
    //    },
    //     me1(e){
    //         var id=e.target.dataset.id;
    //         this.active=id;
    //     },
    //     me2(e){
    //         var id=e.target.dataset.id;
    //         this.active=id;
    //     },
    //     me3(e){
    //         var id=e.target.dataset.id;
    //         this.active=id;
    //     }
    // },
}
</script>
<style scoped>
    /* .am_top{
        height:200px;
        display:flex;
        padding-left:10px;
        position:relative;
        background:url("../../assets/bgai.jpeg") no-repeat;
        background-size:100%;
    }
    .am_top>div{
        position:absolute;
        top:7%;
        left:35%;
    }
    .me{
        position:absolute;
        width:20%;
        text-align: center;
        top:57%;
        left:37%;
        font-size:19px;   
        height:26px;
        display:inline-block;
        color:#0b0606;
    }
    .touxiang{
        width:90px;
        height:90px;
        border-radius:50%;
        border:3px solid #fff;
    }
    .am_list img{
        width:30px;
        height:30px;
        vertical-align:-7px;
    }
    .am_list{
        position:absolute;
        width:93%;
        display:flex;
        background:white;
        list-style: none;
        margin:0 13px;
        top:200px;
        line-height:60px;
        box-shadow:rgba(0, 0, 0, 0.35) 0px 2px 7px 0px;
        border-radius:20px;
    }
    .am_list span{
        padding-left:10px;
    }
    .am_list li{
        margin:0 15px;
        
    }
    .am_list li a{
        text-decoration: none;
        color:#f1751a;
    } */
</style>