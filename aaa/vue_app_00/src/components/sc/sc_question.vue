<template>

<div id="b1">
  <my-header/>
  <div class="nav_qus w-100">
      <div class="nav1">
        <a href="javascript:;" class="active" @click="all" :class="{'d':!isNone}">全部问题</a>
        <span>|</span>
        <a href="javascript:;" @click="me" class="problem" :class="{'d':!isNone}">我要提问</a>
      </div>
  </div>
    <div class="want" :class="{'d':isNone}">
              <div>
                <span>问题</span>
                <div>
                  <input type="text" v-model="intque" class="imp">
                </div>
              </div>
              <div id="how">
                <span>问题补充(选填)</span>
                <div>
                  <textarea name="pbl" cols="30" rows="3" v-model="add" class="areas"></textarea>
                </div>
                
              </div>
              <input type="button" value="提问" class="bt" @click="ask">
    </div>
    <div class="why" :class="{'d':!isNone}">
      <div class="why1" v-for="(elem,i) of arr" :key="i">
        <!-- <a href="javascript:;" v-text="elem.question"></a> -->
        <router-link v-text="elem.question" :to="`/sc_answer/${elem.qid}`"></router-link>
          <p class="mts">
            <span>2回答</span>
            <span>3100浏览</span>
          </p>
      </div>
      <!-- <div class="why2">
        <a href="">做豆腐脑一斤豆子加多少斤水泡，一斤豆子用多少内脂，为什么我做的豆腐脑水多又很老，一点都不嫩</a>
          <p class="mt-1">
            <span class="mr-2">3回答</span>
            <span>2122浏览</span>
          </p>
      </div> -->
    </div>
</div>

</template>

<script>

export default {
    data(){
        return {
          isNone:true,
          arr:[],
          intque:"",
          add:""
        
        }
    },
    methods:{
     all(){
       this.isNone=true;
       document.querySelector(".problem").style.color="black";},
      me(){
        this.isNone=false;
        document.querySelector(".problem").style.color="#fa7e3e";
        },
        ask(){
            var que=this.intque;
            var add=this.add;
            if(!add){
              add="";
            }
            var obj={intque:que,add:add}
            var url="addque";
            this.axios.get(url,{params:obj}).then(res=>{
                if(res.data.code==1){
                    this.$toast("提问成功");
                }else{
                    this.$toast("提问失败");
                }
            })
        },

    },
    created(){
        var url="question";
        this.axios.get(url).then(res=>{
        this.arr=res.data;
      })
    },
    components:{
      
    },
    watch: {
      isNone(){
        var url="question";
        this.axios.get(url).then(res=>{
        this.arr=res.data;
      })
      }
    },
}
</script>
<style scoped>
@import url("../../assets/css/question.css");
</style>