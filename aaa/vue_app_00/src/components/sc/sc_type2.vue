<!--template组件模板:保存标签-->
<template>
  <!--模板要求:必须有一个根标签-->
  <div>
    <my-header/>
  <div class="content">
      <h2 class="h">家常菜</h2>
      <div class="menu">
          <div class="classification">
            <div class="title">
            <div class="title_1">
                <div class="name ri">肉类</div>
            </div>
            </div>
            <ul class="u">
              <li><a href="javascript:;">猪肉</a></li>
              <li><a href="javascript:;">排骨</a></li>
              <li><a href="javascript:;">猪蹄</a></li>
              <li><a href="javascript:;">猪排</a></li>
              <li><a href="javascript:;">猪肝</a></li>
              <li><a href="javascript:;">猪骨</a></li>
              <li><a href="javascript:;">猪腰</a></li>
              <li><a href="javascript:;">猪脑</a></li>
              <li><a href="javascript:;">里脊</a></li>
              <li><a href="javascript:;">猪头</a></li>
              <li><a href="javascript:;">猪血</a></li>
              <li><a href="javascript:;">大排</a></li>
              <li><a href="javascript:;">猪心</a></li>
              <li><a href="javascript:;">猪肚</a></li>
               <br>
              <li><a href="javascript:;">五花肉</a></li>
              <li><a href="javascript:;">猪尾巴</a></li>
              <li><a href="javascript:;">猪耳朵</a></li>
              <li><a href="javascript:;">猪大肠</a></li>
              <br>
              <li><a href="javascript:;">牛肉</a></li>
              <li><a href="javascript:;">牛排</a></li>
              <li><a href="javascript:;">牛腩</a></li>
              <li><a href="javascript:;">牛筋</a></li>
              <li><a href="javascript:;">牛尾</a></li>
              <li><a href="javascript:;">牛肚</a></li>
              <li><a href="javascript:;">牛杂</a></li>
              <li><a href="javascript:;">牛仔骨</a></li>
              <br>
              <li><a href="javascript:;">牛肉</a></li>
              <li><a href="javascript:;">羊排</a></li>
              <li><a href="javascript:;">狗肉</a></li>
              <li><a href="javascript:;">兔肉</a></li>
              <li><a href="javascript:;">火腿</a></li>
              <li><a href="javascript:;">培根</a></li>
              <li><a href="javascript:;">熏肉</a></li>
              <li><a href="javascript:;">腊肉</a></li>
              <li><a href="javascript:;">香肠</a></li>
              <li><a href="javascript:;">火腿肠</a></li>
            </ul>
            <hr>
          </div>
          <div class="classification">
            <div class="title">
            <div class="title_1">
                <div class="name ri">肉类</div>
            </div>
            </div>
            <ul class="u">
              <li><a href="javascript:;">猪肉</a></li>
              <li><a href="javascript:;">排骨</a></li>
              <li><a href="javascript:;">猪蹄</a></li>
              <li><a href="javascript:;">猪排</a></li>
              <li><a href="javascript:;">猪肝</a></li>
              <li><a href="javascript:;">猪骨</a></li>
              <li><a href="javascript:;">猪腰</a></li>
              <li><a href="javascript:;">猪脑</a></li>
              <li><a href="javascript:;">里脊</a></li>
              <li><a href="javascript:;">猪头</a></li>
              <li><a href="javascript:;">猪血</a></li>
              <li><a href="javascript:;">大排</a></li>
              <li><a href="javascript:;">猪心</a></li>
              <li><a href="javascript:;">猪肚</a></li>
               <br>
              <li><a href="javascript:;">五花肉</a></li>
              <li><a href="javascript:;">猪尾巴</a></li>
              <li><a href="javascript:;">猪耳朵</a></li>
              <li><a href="javascript:;">猪大肠</a></li>
              <br>
              <li><a href="javascript:;">牛肉</a></li>
              <li><a href="javascript:;">牛排</a></li>
              <li><a href="javascript:;">牛腩</a></li>
              <li><a href="javascript:;">牛筋</a></li>
              <li><a href="javascript:;">牛尾</a></li>
              <li><a href="javascript:;">牛肚</a></li>
              <li><a href="javascript:;">牛杂</a></li>
              <li><a href="javascript:;">牛仔骨</a></li>
              <br>
              <li><a href="javascript:;">牛肉</a></li>
              <li><a href="javascript:;">羊排</a></li>
              <li><a href="javascript:;">狗肉</a></li>
              <li><a href="javascript:;">兔肉</a></li>
              <li><a href="javascript:;">火腿</a></li>
              <li><a href="javascript:;">培根</a></li>
              <li><a href="javascript:;">熏肉</a></li>
              <li><a href="javascript:;">腊肉</a></li>
              <li><a href="javascript:;">香肠</a></li>
              <li><a href="javascript:;">火腿肠</a></li>
            </ul>
            <hr>
          </div>
      </div>
  </div>

  </div>
</template>
<script>
export default {
  
}
</script>
<style scoped>
*{padding: 0; margin:0}
.content{
  padding-top: 6px;
  padding-bottom: 12px;
  
}
.h{
  color: #817c74;
  text-align: center;
  height: 47px;
  line-height: 47px;
  font-size: 18px;
  font-weight: 300;
}
.menu{
   margin-left: 10px;
    margin-right: 10px;
}
.classification{
    background-color: #ffffff;

    margin-top: 6px;
}
.title{
     height: 36px;
    line-height: 36px;
    background-color: #f2f0ee;
    border-top: 1px solid #eae6e3;
    border-bottom: 1px solid #eae6e3;
}
.title_1{
  margin-left: 10px;
    margin-right: 10px;
}
hr{
  margin-top: 10px;
      height: 1px;
    border: 0;
    border-top: 1px solid #eae6e3;
    line-height: 0;
    font-size: 0;
}

  
.gs{
  background-image: url(../../assets/guaguo.png);
}
.jl{
  background-image: url(../../assets/junlei.png);
}
.name{
  background-position: right center;
    background-repeat: no-repeat;
    background-size: 30px 30px;
}
.u{
  font-size:14px;
  list-style:none;
  
}
.u li{
  display: inline-block;
    margin-right: 30px;
    margin-top: 20px;
}
.u li a{
  color: #000;
  text-decoration: none;
  cursor: pointer
}
</style>