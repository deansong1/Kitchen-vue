<template>
    <div>
        <my-header/>
        <admin-header/>
        <ul class="col_list">
            <li v-for="(item,i) of arr" :key="i">
                <a href="javascript:;">
                    <div class="coll">
                        <img :src="'http://127.0.0.1:3000/'+item.img">
                        <p v-text="item.title"></p>  
                    </div>
                </a>
            </li>
            <!-- <li>
                <a href="">
                    <div class="coll">
                        <img src="../../img/zhupai06.jpg">
                        <p>蜜汁烤鸡腿</p>  
                    </div>
                </a>
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
    created(){
        var url="collect";
        this.axios.get(url).then(res=>{
            this.arr=res.data;
        })
    }
}
</script>
<style scoped>
    *{margin:0;padding:0;}
    .col_list{
        list-style:none;
        margin-top:10px;
        margin-left:10px;
    }
    .col_list li{
        border:1px solid #eae6e3;
        margin-top:10px;
    }
    a{
        text-decoration:none;
        color:#fa7e3e;
    }
    .coll{
        display:flex;
    }
    img{
        width:84px;
        height:55px;
    }
    p{
        margin-left:10px;
        line-height:40px;
    }
</style>