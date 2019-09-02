<template>
   <div class="page-tabbar">
      <div class="page-wrap">
      <!--Home.vue-->
      <!--1:顶部标题子组件-->      
      <!--2:div保留(标题)48px高度-->
      <!--Home.vue 入口全局组件-->
      <!--3:切换面板列表-->
      <mt-tab-container class="page-tabbar-container" v-model="active">
        <mt-tab-container-item id="message">
            <sc-index></sc-index>
        </mt-tab-container-item>
        <mt-tab-container-item id="video">
          <sc_video></sc_video>
        </mt-tab-container-item>
            <mt-tab-container-item id="contact">
            <sc_-questuin></sc_-questuin>
        </mt-tab-container-item>
        <mt-tab-container-item id="find">
            <sc_-check></sc_-check>
        </mt-tab-container-item>
        <mt-tab-container-item id="me">
            <sc_-admin></sc_-admin>
        </mt-tab-container-item>
        
      </mt-tab-container>
      <!--4:tabbar列表-->
      <!--为每个按钮绑定点击事件-->
      <!--当前按钮isSelect:true-->
      <!--其它按钮isSelect:false-->
      <mt-tabbar v-model="active" fixed>
        <mt-tab-item id="message" @click.native="changeState(0)">
        <tab-bar-icon
          :selectedImage="require('../../assets/tabindex.png')"
          :normalImage="require('../../assets/tabindex-1.png')"
          :focused="currentIndex[0].isSelect">
        </tab-bar-icon>
         首页  
        </mt-tab-item>
        <mt-tab-item id="video" @click.native="changeState(1)">
          <tab-bar-icon
          :selectedImage="require('../../assets/tabvideo.png')"
          :normalImage="require('../../assets/tabvideo-1.png')"
          :focused="currentIndex[1].isSelect">
        </tab-bar-icon>
        视频 
        </mt-tab-item>
        <mt-tab-item id="contact" @click.native="changeState(2)">
          <tab-bar-icon
         :normalImage="require('../../assets/tabcook-1.png')"
         :selectedImage="require('../../assets/tabcook.png')"
         :focused="currentIndex[2].isSelect">
          </tab-bar-icon>
         问答
        </mt-tab-item>
        <mt-tab-item id="find" @click.native="changeState(3)">
           <tab-bar-icon
          :normalImage="require('../../assets/tabsearch-1.png')"
          :selectedImage="require('../../assets/tabsearch.png')"
          :focused="currentIndex[3].isSelect">
           </tab-bar-icon>
          搜索
        </mt-tab-item>
        <mt-tab-item id="me" @click.native="changeState(4)">
          <tab-bar-icon
           :normalImage="require('../../assets/tabme-1.png')"
           :selectedImage="require('../../assets/tabme.png')"
           :focused="currentIndex[4].isSelect"
          ></tab-bar-icon>
          我
        </mt-tab-item>
      </mt-tabbar>
   </div>
   </div>
</template>
<script>
import scIndex from "./scIndex.vue"
import TabBarIcon from "./TabBarIcon.vue"
import sc_Check from "./sc_Check.vue"
import sc_Admin from "./sc_Admin.vue"
import sc_question from "./sc_question.vue"
import sc_video from "./sc_video.vue"
export default {
  data(){
    return {
      //面板中显示子组件id
      active:"message",
      //创建数组保存图片焦点状态
      currentIndex:[
        {isSelect:true},
        {isSelect:false},
        {isSelect:false},
        {isSelect:false},
        {isSelect:false}
      ]
    }
  },
  methods: {
    changeState(n){
      //函数功能:将当前参数下标
      //对应数组值修改true其它修改false
      //1:创建循环,循环数组中内容
      for(var i=0;i<this.currentIndex.length;i++){
       //2:判断如果循环下标与n相等 20
       if(n==i){
        //3:当前下标元素true 10:22
        this.currentIndex[i].isSelect=true;
       }else{
        //4:其它元素修改false
        this.currentIndex[i].isSelect=false;
       }
       
      }

    }
  },
  components:{
    "scIndex":scIndex,
    "TabBarIcon":TabBarIcon,
    "sc_Check":sc_Check,
    "sc_Admin":sc_Admin,
    "sc_Questuin":sc_question,
    "sc_video":sc_video
  }
}
</script>
<style  scoped>
/*最外层父元素Home.vue*/
.page-tabbar{
  overflow: hidden;/*溢出隐藏*/
}
/*修改 tabbar 默认文字颜色*/
.mint-tabbar>.mint-tab-item{
  color:#999999;
}
/*修改默认tab选中文字样式*/
.mint-tabbar>.mint-tab-item.is-selected{
  background-color: transparent;
  color:#fa7e3e;
}

.page-wrap{
  overflow:auto;/*溢出显示轮动条*/
  padding-bottom: 60px;
}
</style>


