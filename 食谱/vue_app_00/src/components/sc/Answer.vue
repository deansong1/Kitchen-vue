<template>
    <div>
        <div class="ans_list" v-for="(elem,i) of arr" :key="i">
            <div v-text="elem.question" class="ans_d1"></div>
            <div v-text="elem.answer" class="ans_d2"></div>
            <hr>
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
        var url="myans";
        this.axios.get(url).then(res=>{
            this.arr=res.data;
        });
    }
}
</script>
<style scoped>
    .ans_list{
        width:94%;
        margin:10px;
    }
    .ans_d1{
        margin-bottom: 10px;
    }
    .ans_d2{
        color:#969292;
    }
</style>