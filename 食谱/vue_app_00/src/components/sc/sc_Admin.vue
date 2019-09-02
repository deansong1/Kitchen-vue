<template>
    <div>
        <my-header/>
         <div class="am_top">
            <div><img class="touxiang" :src="`http://127.0.0.1:3000/`+arr1" alt=""></div>
            <span class="me" v-text="arr"></span>
            <img src="../../assets/bianji.png">
        </div>
        <ul class="am_list">
            <li><a @click="mead1" data-id="tab"><img src="../../assets/line.png" alt="">收藏</a></li>
            <li><a @click="mead2" data-id="tac"><img src="../../assets/bangzhu.png" alt="">问题</a></li>
            <li><a href="javascript:;" @click="mead3" data-id="tad"><img src="../../assets/tishi.png" alt="">回答</a></li>
            <li @click="ress"><a href="javascript:;" ><img src="../../assets/fail.png" alt="">退出</a></li>
        </ul>
        <div>
            <mt-tab-container v-model="active">
                <mt-tab-container-item id="tab">
                   <sc_collect></sc_collect>
                </mt-tab-container-item>
                 <mt-tab-container-item id="tac">
                    <myquestion></myquestion>
                </mt-tab-container-item>
                <mt-tab-container-item id="tad">
                   <answer></answer>
                </mt-tab-container-item>
            </mt-tab-container>
        </div>
    </div>
</template>
<script>
import sc_collect from './sc_collect.vue'
import Myquestion from './Myquestion.vue'
import Answer from './Answer.vue'
export default {
    data(){
        return{
            active:"tab",
            arr:"",
            arr1:""
        }
    },
    created(){
        var url="getCap";
        this.axios.get(url).then(res=>{
            if(res.data.code==-1){
                return;
            }else{
                this.arr=res.data[0].uname;
                this.arr1=res.data[0].upic;
            }
        })
    },
     methods: {
       ress(){
           var url="ress";
           this.axios.get(url).then(res=>{
               if(res.data.code==1){
                   this.$toast("退出成功");
                   this.$router.push("/sc_Login");
               }
           })
       },
        mead1(e){
            var id=e.target.dataset.id;
            this.active=id;
        },
        mead2(e){
            var id=e.target.dataset.id;
            this.active=id;
        },
        mead3(e){
            var id=e.target.dataset.id;
            this.active=id;
        }
    },
    components:{
        "sc_collect":sc_collect,
        "Myquestion":Myquestion,
        "Answer":Answer
    }

}
</script>
<style scoped>
  .am_top{
        height:200px;
        display:flex;
        padding-left:10px;
        position:relative;
        background:url("../../assets/bgai.jpeg") no-repeat;
        background-size:100%;
    }
    .am_top>img{
        float:left;
        width:20px;
        height:20px;
    }
    .am_top>div{
        position:absolute;
        top:10%;
        left:37%;
    }
    .me{
        display:inline-block;
        position:absolute;
        width:20%;
        text-align: center;
        top:57%;
        left:37%;
        font-size:19px;   
        height:26px;
        color:#0b0606;
    }
    .touxiang{
        width:80px;
        height:80px;
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
        justify-content: space-around;
        background:white;
        list-style: none;
        margin:0 13px;
        top:192px;
        line-height:60px;
        box-shadow:rgba(0, 0, 0, 0.05) 0px 2px 7px 0px;
        border-radius:20px;
    }
    .am_list span{
        padding-left:10px;
    }
    .am_list li a{
        text-decoration: none;
        color:#f1751a;
    }
</style>