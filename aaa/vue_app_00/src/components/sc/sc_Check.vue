<template>
<div class="chk">
    <my-header/>
    <div class="search1">
            <input type="text" v-model="vue1" @keyup.13="search">
            <mt-button @click="findx"
            >搜索</mt-button>
    </div>
     <div v-for="(item,i) of list" :key="i" class="main">
        <div class="menu_list">
            <img :src="'http://127.0.0.1:3000/'+item.limg" />
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
            vue1:""
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
                    console.log(res.data);
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
        var menu=document.querySelector(".search1");
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
@import url("../../assets/css/check.css");
</style>