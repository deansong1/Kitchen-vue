<template>
<div class="chk">
    <my-header/>
    <div class="search1">
            <input type="text" v-model="vue1" @keyup.13="search">
            <mt-button @click="findx"
            >搜索</mt-button>
    </div>
    <div class="keyword">
        <div class="history-ser">
            <h3>热门搜索</h3>
            <div class="f-l">
                <a href="javascript:;">月饼</a>
                <a href="javascript:;">大闸蟹</a>
                <a href="javascript:;">桂花糕</a>
                <a href="javascript:;">丝瓜</a>
                <a href="javascript:;">梭子蟹</a>
            </div>
            <div class="f-l">
                <a href="javascript:;">红烧肉</a>
                <a href="javascript:;">糖醋排骨</a>
                <a href="javascript:;">可乐鸡翅</a>
            </div> 
        </div>
    </div>
     <div v-for="(item,i) of list" :key="i" class="main">
        <div class="menu_list">
        <router-link :to="`/sc_detail/${item.lid}`">
            <img :src="'http://127.0.0.1:3000/'+item.limg" />
        </router-link>
            <span>{{item.lname}}<a href="javascript:;" @click="col" 
            :data-lname="item.lname"
            :data-limg="item.limg">收藏食谱</a></span>
        </div>
    </div>
</div>
</template>

<script>
export default {
    data(){
        return {
            lname:"",
            list:[],
            vue1:"",
            isNow:true

        }
    },
    create(){
        this.findx();
    },
    methods: {
        col(e){
                //功能:将食谱收藏至我的
                //1:获取添加食谱参数
                //lid   当前食谱编号
                //lname 当前食谱名称
                var lname=e.target.dataset.lname;
                var limg=e.target.dataset.limg;
                //2:发送ajax请求
                //2.1:请求服务器地址
                var url = "col";
                //2.2:请求参数
                var obj = {lname:lname,limg:limg};
                //3:获取返回的结果
                this.axios.get(url,{params:obj}).then(res=>{
                //3.1:如果-1提示用户登录
                if(res.data.code == -1){
                    this.$toast("请先登录");
                }else{
                    this.$toast("添加成功");
                }
                //3.2:如果1提示用户添加成功
                })
        },
        search(){
            this.findx();
        },
        //功能：自动搜索
        findx(e){ 
        // var n=document.getElementsByTagName("input")[0].value;
        var n=this.vue1;
        var url="sc_Check";
        var obj={lname:n};
        this.axios.get(url,{params:obj}).then(res=>{
            if(res.data.code == -1){
                this.$toast("请再次查询");
            }else{
               var list=res.data.data;
               this.list=list;
            }
        })
        var main=menu=document.querySelector(".main");
        var menu=document.querySelector(".keyword");
        var frag=document.createDocumentFragment();
        frag.appendChild(document.createElement('p'));
        menu.appendChild(frag);
        document.getElementsByTagName("p")[0].innerHTML=n+"食谱";         
         }, 
         
    },
    components:{
       
    },
    watch: {
        vue1(){
            this.findx();
        }
    },
}
</script>
<style scoped>
/* 搜索框 */
    .search1{
         width: 95%;
         margin:0 auto;
         padding-top:20px;
    }
    .search1 input,.search1 button{
        margin: 10px 0;
    }
    .search1 input{
        width: 80%;
        height:30px;
        padding-left: 5px;
    }
    .main{
        width: 95%;
        margin:0 auto;
    }
    .menu_list{
        margin: 10px 0;
        display:flex;
    }
    .menu_list img{
        width: 84px;
    }
    .menu_list span{
        padding-left:10px;
        line-height:50px;
        display:inline-block;
        width:100%;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
        border:1px solid #ebebeb;
        background:#fff;
    }
    /* 按钮 */
    .mint-button--default{
        background-color: #fa7e3e;
        color: #fff;
        cursor: pointer;
        border-radius: 0;
        height:33px;   
    }
    /* 历史热搜 */
     div.keyword{
        width:95%;
        margin:0 auto;
    }
    .history-ser{
         width: 100%;
         height:63px;
         margin-bottom:5px;
    }
   
    h3{
        margin-bottom: 5px;
    }
    .f-l a{
        float:left;
    }
    /* 收藏按钮 */
    a{
        padding-right:10px;
        text-decoration: none;
        color:#fa7e3e;
        float: right;
    }
</style>