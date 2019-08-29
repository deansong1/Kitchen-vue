<template>
    <div>
        <my-header></my-header>
        <div class="an_title" v-text="arr"></div>
        <a href="javascript:;" class="an_a">回答问题</a>
        <div class="an_con" v-for="(elem,i) of ans_list" :key="i">
            <div class="an-con-item">
                <img :src="'http://127.0.0.1:3000/'+elem.uimg" alt="">
                <span v-text="elem.uname"></span>
            </div>
            <p class="ad_an" v-text="elem.answer"></p>
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
        }
    },

}
</script>
<style scoped>
    .an_title{
        margin: 20px 0 10px 10px;
    }
    .an_a{
        float: right;
        margin:10px 10px 10px 0;
        width:100px;
        height:30px;
        background:#fa7e3e;
        text-decoration: none;
        color:#fff;
        text-align: center;
        line-height: 30px;
        border-radius: 12px;
    }
    .an_con{
        margin: 65px 10px 10px 10px;
        border-bottom: 1px solid #9b8e8e;
        padding: 0 10px 10px 0;
    }
    .an-con-item{
        display:flex;
        margin-bottom:15px;
    }
    .an_con .an-con-item img{
        width:45px;
        height:45px;
    }
    .an-con-item span{
        display: inline-block;
        margin: 5px 0 0 10px;
    }
    .add_an{
        padding:0 10px;
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
</style>