<template>
    <div>
        <div class="why1" v-for="(elem,i) of arr" :key="i">
        <!-- <a href="javascript:;" v-text="elem.question"></a> -->
            <a v-text="elem.question"></a>
            <p class="mts">
                <span class="mr-2">2回答</span>
                <span>3100浏览</span>
            </p>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            arr:[]
        }
    },
    created(){
        var url="myque";
        this.axios.get(url).then(res=>{
            this.arr=res.data;
            
        })
    }
}
</script>
<style scoped>
    #b1 a{
      text-decoration: none;
    }
    .why{
      width: 95%;
      margin:0 auto;
    }
   .nav_qus{
      height: 30px;
      border-top:1px solid #ebebeb;
      border-bottom:1px solid #ebebeb;
      
   }
   .nav_qus a{
      color:black;
   }
   .nav1{
      width: 95%;
      margin:0 auto;
      line-height: 30px;
   }
   .nav1 a{
     height: 24px;
     display: inline-block;
     padding:0 10px;
     color:black;
   }
   a.active{
     color:#fa7e3e;
   }
   .why a{
     color:black;
     margin-bottom: 10px;
   }
   .why span{
     color:#a69f96;
   }
   .nav1 span{
     color:#ebebeb;
   }
   .why1,.why2{
     border-bottom:1px solid #ebebeb;
     padding: 12px 0;
   }
   .why1{
     height: 77px;
     margin:0 10px;
   }
   .why2{
     height: 125px;
   }
  
   div.d{
     display: none;
   }
   a.d{
     color:#000; 
   }
   .want{
     width: 95%;
     margin:20px 9.375px 0;
     color:#a69f96;
   }
   #how{
     margin: 16px 0 0;
   }
   .want .bt{
     width: 120px;
     height: 30px;
     background: #fa7e3e;
     color:#fff; 
     border: 0;
     margin: 16px 0 0;
     float:right;
   }
   .mts{
       margin-top: 20px;
       color:#969292;
   }
</style>