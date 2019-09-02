<template>
    <div class="car">
   <mt-swipe :auto="3000">
  <mt-swipe-item><img src="../../assets/lunbo1.jpg" class="a1"></mt-swipe-item>
  <mt-swipe-item><img src="../../assets/lunbo2.jpg" class="a1"></mt-swipe-item>
  <mt-swipe-item><img src="../../assets/lunbo3.jpg" class="a1"></mt-swipe-item>
</mt-swipe>
    </div>
</template>

<script>

export default {
    
}
</script>

<style scoped>
     .car{
       height: 250px;
     }
    .car img{
      width:100%;
      height:250px;
    }
</style>