<template>
    <div>
        <div class="ret-top" @click="rets">
            <img src="../../assets/return.png" alt="">
            <div class="ret">返回</div>
        </div>
        <div class="an_title" v-text="arr"></div>
        <a href="javascript:;" class="an_a">回答问题</a>
        <div class="an_con" v-for="(elem,i) of ans_list" :key="i">
            <div class="an-con-item">
                <img :src="'http://127.0.0.1:3000/'+elem.uimg" alt="">
                <div v-text="elem.uname" class="adminuser"></div><br>
                <div v-text="elem.pubTime" class="pubtime"></div>
            </div>
            <div class="ad_an" v-text="elem.answer"></div>
        </div>
        <div class="add_an">
            <div>添加答案</div>
            <textarea name="" id="" cols="30" rows="10" class="area" v-model="area_val"></textarea>
            <a href="javascript:;" class="submit" @click="addAnswer">提交</a>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            arr:"",
            area_val:"",
            ans_list:[]
        }
    },
    props:{
        qid:{
            defalut:""
        }    
    },
    created(){
        var url="getque";
        var obj={id:this.qid};
        this.axios.get(url,{params:obj}).then(res=>{
            this.arr=res.data[0].question;
        })

        var url2="selans";
        var obj2={qid:this.qid};
        this.axios.get(url2,{params:obj2}).then(res=>{
            this.ans_list=res.data;
        })
    },
    methods: {
        addAnswer(){
            var area=this.area_val;
            var pid=this.qid;
            if(!area){
                this.$toast("输入不能为空");
                return;
            }
            var url="addans";
            var obj={area:area,pid:pid};
            this.axios.get(url,{params:obj}).then(res=>{
                if(res.data.code==1){
                    this.$toast("添加成功");
                }else if(res.data.code==-2){
                    this.$toast("请先登录");
                }else{
                    this.$toast("添加失败");
                }
            })
        },
        rets(){
            this.$router.push("/scHome");
        }
    }
}
</script>
<style scoped>
    .ret-top img{
        float:left;
        margin:0 0 0 0;
    }
    .ret{
        float:left;
        margin:7px 0 0 -4px;
        color:#fa7e3e
    }
    .ret-top:after{
        clear: both;
        content: "";
        display:block;
    }
    .an_title{
        margin: 20px 0 10px 10px;
    }
    .an_a{
        position:absolute;
        top:5px;
        right:10px;
        width:100px;
        height:30px;
        background:#fa7e3e;
        text-decoration: none;
        color:#fff;
        text-align: center;
        line-height: 30px;
        border-radius: 12px;
    }
    .ad_an{
        padding-left: 5px;
        color:#000000;
        font-size: 14px;
    }
    .an_con{
        margin: 15px 10px 10px 10px;
        border-bottom: 1px solid #bababa;
        padding: 0 10px 10px 0;
    }
    .an-con-item{
        margin-bottom:15px;
    }
    .an_con .an-con-item img{
        float:left;
        width:45px;
        height:45px;
        border-radius:50%;
    }
    .add_an{
        padding: 0 10px;
    }
    .area{
        width:100%;
        margin-top: 10px;
    }
    .submit{
        width:100%;
        height:30px;
        line-height: 30px;
        text-align: center;
        display:block;
        background:#fa7e3e;
        text-decoration: none;
        color:#fff;
        margin-top: 10px;
    }
    .adminuser{
        float:left;
        margin: 2px 0 9px 10px;
        width:80%;
    }
    .pubtime{
        margin: 0 0 0 10px;
        float: left;
        color:#8e8e8e;
        font-size: 12px;
    }
    .an-con-item:after{
        display: block;
        content: "";
        clear:both;
    }
</style>