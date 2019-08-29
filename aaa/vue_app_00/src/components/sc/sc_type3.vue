<template>
    <div>
        <my-header/>
        <div class="content">
            <h2>食谱分类</h2>
            <hr>
            <div class="floor">
                <ul class="p_4">
                    <a href="javascript:;">
                        <li>
                            家常菜
                            <span>(9913)</span>
                        </li>
                    </a>
                    <a href="javascript:;">
                        <li>
                            家常
                            <span>(7872)</span>
                        </li>
                    </a>
                    <a href="javascript:;">
                        <li>
                            甜品
                            <span>(6450)</span>
                        </li>
                    </a>
                    <a href="javascript:;">
                        <li>
                            家常菜谱
                            <span>(6242)</span>
                        </li>
                    </a>
                </ul>
            </div>
        </div>      
    </div>
</template>
<script>
export default {
    
}
</script>
<style scoped>
 .content{
     padding-top:6px;
     padding-bottom:12px;
 }
 h2{
     height:47px;
     line-height:47px;
     text-align:center;
     color:#817c74;
     font-size:18px;
     font-weight: 300;
 }
 hr{
     height: 1px;
    border: 0;
    border-top: 1px solid #eae6e3;
    line-height: 0;
    font-size: 0;
 }
 .floor{
     margin-left:10px;
     margin-right:10px;
 }
 .p_4{
     font-size:14px;
     list-style:none;
 }
 .p_4 a{
     color:#000;
     text-decoration:none;
     cursor:pointer;
 }
 .p_4 a li{
     padding: 0 20px;
    text-align: left;
    display: inline-block;
    margin-right: 6px;
    margin-top: 10px;
    min-width: 85px;
    height: 36px;
    line-height: 36px;
    background-color: #fff;
    border: 1px solid #eae6e3;
    text-align:center;
 }
 .p_4 a li span{
     float:right;
     color:#a9a39b;
     font-size:12px;
 }
</style>