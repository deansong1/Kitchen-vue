<template>
    <div>
    <div class="content">
        <div class="menu">
            <hr>
            <h2 class="h">美容</h2>
            <div class="title_0">
                <ul class="title_1">
                    <li>
                        <a href="javascript:;">养颜</a>
                         <span>|</span>
                    </li>
                    <li>
                        <a href="javascript:;">排毒</a>
                        <span>|</span>
                    </li>
                    <li>
                        <a href="javascript:;">美白</a>
                        <span>|</span>
                    </li>
                    <li>
                        <a href="javascript:;">抗皱</a>
                        <span>|</span>
                    </li>
                  
                    <li>
                        <a href="javascript:;">祛斑</a>
                        <span>|</span>
                    </li>
                    <li>
                        <a href="javascript:;">祛痘</a>
                        <span>|</span>
                    </li>
                    <li>
                        <a href="javascript:;">润肤</a>
                        <span>|</span>
                    </li>
                    <li>
                        <a href="javascript:;">保湿</a>      
                    </li>
                     
                     
                </ul> 
            </div>
        </div>
    </div>
    </div>
</template>
<script>
export default {
    
}
</script>
<style>
*{
    margin:0;
    padding:0;
}
 .content{
    padding-top:6px;
    padding-bottom:12px;
}
 .menu{
    margin-left:10px;
    margin-right:10px;
}
 hr{
    margin-top:14px;
    height:1px;
    border:0;
    border-top:1px solid #eae6e3;
    line-height:0;
    font-size:0;
}
 .h{
     padding-top:9px;
     padding-bottom:4px;
     height:20px;
     text-align:center;
     color:#817c74;
         font-size: 100%;
    line-height: normal;
        font-weight: 300;
}
.title_0{
    border: 1px solid #eae6e3;
    background-color: #fff;

}
.title_1{
    font-size:14px;
    list-style:none;
}
.title_1 li{
    display: inline;
    overflow: hidden;
    white-space: wrap;
}
.title_1 li a{
        display: inline-block;
    padding: 0 18px;
    height: 30px;
    line-height: 30px;
    text-align: center;
    color: #000;
     text-decoration: none;
  cursor: pointer
}
.title_1 li span{
    color:#eae6e3;
}
</style>