<template>
    <div class="content">
        <my-header/>
        <h1 class="title">厨友排行</h1>
        <ul>
            <li v-for="(elem,i) of arr" :key="i">
                <div>
                    <a href="http://127.0.0.1:8080/#/sc_admin"><img :src="'http://127.0.0.1:3000/'+elem.upic" class="w_img"></a>
                    <p class="w_name" v-text="elem.uname"></p>
                    <p class="fw">访问</p>
                </div>
                <label id="gz">
                    <a href="" class="guanzhu">关注</a>
                </label>
            </li>
            <!-- <li>
                <div>
                    <a href=""><img src="../../assets/zuo.jpg" class="w_img"></a>
                    <p class="w_name">月亮晶晶</p>
                    <p class="fw">访问</p>
                </div>
                <label id="gz">
                    <a href="" class="guanzhu">关注</a>
                </label>
            </li> -->
        </ul>
    </div>
</template>
<script>
export default {
    data() {
        return {
            arr:[]
        }
    },
    created() {
        var url="userList"
        this.axios.get(url).then(res=>{
            this.arr=res.data;
        })
    },
}
</script>
<style scoped>
    *{margin:0;padding:0;}
    .title{
        text-align:center;
        font-size:18px;
        color:#817c74;
        height:47px;
        line-height:47px;
    }
    ul{
        list-style:none;
    }
    li{
        display:block;
        height:50px;
        padding:11px 16px;
        position:relative;
        margin-bottom:10px;
        border-bottom:1px solid #eae6e3;
        border-top:1px solid #eae6e3;
    }
    .w_img{
        float:left;
        margin-right:10px;
        border-radius:25px;
    }
    .w_name{
        line-height:normal;
        font-weight:700; 
    }
    .fw{
        margin-top:10px;
        font-size:12px;
        color:#a69f96;
    }
    .guanzhu{
        display: block;
        width: 32%;
        height: 72px;
        text-align: center;
        line-height: 72px;
        position: absolute;
        right: 0;
        top: 0;
        border-left: 1px solid #eae6e3;
        text-decoration:none;
        color: #fa7e3e;
    }
</style>