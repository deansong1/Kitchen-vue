<template>
    <div class="content">
        <my-header/>
        <h1 class="title" v-text="list.title"></h1>
        <div class="menu">
            <a href="javascript:;">
                <img :src="'http://127.0.0.1:3000/'+list.timg" alt="">    
            </a>    
        </div>
        <div class="m_title">
            <h2 v-text="list.stitle1"></h2>
        </div>
        <div class="cail">
            <p v-text="list.foods"></p>    
        </div>
        <div class="m_title">
            <h2 v-text="list.stitle2"></h2>
        </div>
        <div class="zuof">
            <div class="zuof_1">
                <p v-text="list.how"></p>
            </div>
        </div>   
        <a href="javascript:;" @click="addcol" class="add-btn" :data-name="list.title" :data-img="list.timg">收藏食谱</a>
    </div>
</template>
<script>
export default {
    data() {
        return {
           list:""
        }
    },
    methods: {
        addcol(e){
            var timg=e.target.dataset.img;
            var name=e.target.dataset.name;
            var url="addcol";
            var obj={img:timg,name:name};
            this.axios.get(url,{params:obj}).then(res=>{
                if(res.data.code==-2){
                    this.$toast("请先登录");
                }else if(res.data.code==1){
                    this.$toast("添加成功");
                }else{
                    this.$toast("添加失败");
                }
            })
        }
    },
    props:{
        uid:{
            default:""
        }
    },
    created(){
        var url="sc_detail";
        //获取绑定sc_Index的uid数据
        var obj={tid:this.uid};
        this.axios.get(url,{params:obj}).then(res=>{ 
               //输出数据库数据
               var list=res.data[0];
               this.list=list;
        })
    },
   
}
</script>
<style scoped>
    *{margin:0;padding:0;}
    /* 标题 */
    a{
        text-decoration:none;
        color:#fa7e3e;
    }
    .title{
        text-align: center;
        font-size:18px;
        color:#817c74;
        height:47px;
        line-height:47px;
    }
    /* 菜单 */
    .menu{
        margin:14px 10px 0 10px;
    }
    /* 菜单图片 */
    .menu img{
        width:100%;
        height:260px;
    }
    /* 材料标题 */
    .m_title{
        padding:0 10px;
    }
    h2{
        padding:11px 0;
        font-size:100%;
        color:#817c74;
        line-height: normal;
    }
    /* 材料详细 */
    .cail{
        padding:12px 0;
        margin:0 10px;
        border-top:1px solid #eae6e3;
        border-bottom:1px solid #eae6e3;
    }
    /* 做法 */
    .zuof{
        padding-bottom:12px;
    }
    /* 做法详细 */
    .zuof_1{
        border-top:1px solid #eae6e3;
        margin:0 10px;
        line-height:150%;
    }
    /* 作者 */
    .zuof_2{
        margin-top:12px;
       
    }
    .f1{
        float: left;
        width:50%;
    }
    .f2{
        float:right;
    }
    /* 收藏按钮 */
    .add-btn{
        display:block;
        height: 32px;
        line-height: 32px;
        padding: 0 25px;
        border: 0;
        background-color: #fa7e3e;
        color: #fff;
        float:right;
        margin:10px 10px 10px 0;
    }
</style>