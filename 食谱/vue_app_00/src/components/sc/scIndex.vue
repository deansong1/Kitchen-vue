<template>
<div>
    <my-header/>
    <carousel></carousel>
    <div class="In">
        <div class="nav">
            <div class="nav-top">今日</div>
            <div class="nav-list">
                <div class="trans1" @click="eat1" data-id="tab1">早餐</div>
                <div class="trans2" @click="eat2" data-id="tab2">午餐</div>
                <div class="trans3" @click="eat3" data-id="tab3">下午茶</div>
                <div class="trans4" @click="eat4" data-id="tab4">晚餐</div>
                <div class="trans5" @click="eat5" data-id="tab5">夜宵</div>
            </div>
        </div>
        <div>
            <mt-tab-container v-model="active">
                <mt-tab-container-item id="tab1">
                    <div class="In-mor">
                        <div class="mor-item" v-for="(item,i) of arr" :key="i">
                            <router-link :to="`/sc_detail/${item.uid}`"><img :src="'http://127.0.0.1:3000/'+item.img"></router-link>
                            <div class="veg" v-text="item.title"></div>
                            <div class="reg-f">
                                <div class="veg-con" v-text="item.details"></div>
                            </div>
                        </div>
                        <!-- <div class="mor-item">
                            <img src="../../assets/mor02.jpg"/>
                            <div class="veg">番茄鸡蛋饼</div>
                            <div class="veg-f">
                                <div class="veg-con">富含番茄红素,美容养颜</div>                             
                            </div>
                        </div> -->
                    </div>
                </mt-tab-container-item>
                 <mt-tab-container-item id="tab2">
                    <div class="In-mor">
                        <div class="mor-item" v-for="(item,i) of arr3" :key="i">
                            <img :src="'http://127.0.0.1:3000/'+item.img"/>
                            <div class="veg" v-text="item.title"></div>
                            <div class="reg-f">
                                <div class="veg-con" v-text="item.details"></div>
                            </div>
                        </div>
                        <!-- <div class="mor-item">
                            <img src="../../assets/mor04.jpg"/>
                            <div class="veg">油泼面</div>
                            <div class="veg-f">
                                <div class="veg-con">富含碳水化合物,补充能量</div>                             
                            </div>
                        </div> -->
                    </div>
                </mt-tab-container-item>
                <mt-tab-container-item id="tab3">
                    <div class="In-mor">
                        <div class="mor-item" v-for="(item,i) of arr4" :key="i">
                            <img :src="'http://127.0.0.1:3000/'+item.img"/>
                            <div class="veg" v-text="item.title"></div>
                            <div class="reg-f">
                                <div class="veg-con" v-text="item.details"></div>
                            </div>
                        </div>
                        <!-- <div class="mor-item">
                            <img src="../../assets/mor06.jpg"/>
                            <div class="veg">低脂自制雪糕</div>
                            <div class="veg-f">
                                <div class="veg-con">健康自制，美味无添加</div>                             
                            </div>
                        </div> -->
                    </div>
                </mt-tab-container-item>
                <mt-tab-container-item id="tab4">
                    <div class="In-mor">
                        <div class="mor-item" v-for="(item,i) of arr5" :key="i">
                            <img :src="'http://127.0.0.1:3000/'+item.img"/>
                            <div class="veg" v-text="item.title"></div>
                            <div class="reg-f">
                                <div class="veg-con" v-text="item.details"></div>
                            </div>
                        </div>
                        <!-- <div class="mor-item">
                            <img src="../../assets/mor08.jpg"/>
                            <div class="veg">香蒸排骨</div>
                            <div class="veg-f">
                                <div class="veg-con">富含优质蛋白，补肾润肺</div>                             
                            </div>
                        </div> -->
                    </div>
                </mt-tab-container-item>
                <mt-tab-container-item id="tab5">
                    <div class="In-mor">
                        <div class="mor-item" v-for="(item,i) of arr6" :key="i">
                            <img :src="'http://127.0.0.1:3000/'+item.img"/>
                            <div class="veg" v-text="item.title"></div>
                            <div class="reg-f">
                                <div class="veg-con" v-text="item.details"></div>
                            </div>
                        </div>
                        <!-- <div class="mor-item">
                            <img src="../../assets/mor10.jpg"/>
                            <div class="veg">脆藕饼</div>
                            <div class="veg-f">
                                <div class="veg-con">膳食纤维丰富，健脾开胃</div>                             
                            </div>
                        </div> -->
                    </div>
                </mt-tab-container-item>
            </mt-tab-container>
        </div>
        <div class="In-title">
            为你推荐
        </div>
        <div class="In-list" v-for="(item,i) of arr2" :key="i">
            <router-link :to="`/sc_detail/${item.uid}`">
            <img :src="'http://127.0.0.1:3000/'+item.img"/>
            </router-link>
            <div class="In-list-item">
                <p v-text="item.title"></p>
                <ul>
                    <li><img src="../../assets/star.png"/></li>
                    <li><img src="../../assets/star.png"/></li>
                    <li><img src="../../assets/star.png"/></li>
                    <li><img src="../../assets/star.png"/></li>
                    <li><img src="../../assets/star.png"/></li>
                </ul>
                <div class="appraise">
                    <img src="../../assets/love.png"/>
                    <span v-text="item.points"></span>
                    <img src="../../assets/share.png"/>
                    <img src="../../assets/friend.png"/>
                    <img src="../../assets/weibo.png"/>
                </div>
            </div>
        </div>
    </div>
</div>
</template>

<script>
import carousel from './Carousel.vue';
export default {
    data(){
        return {
            active:"tab1",
            arr:[],
            arr2:[],
            arr3:[],
            arr4:[],
            arr5:[],
            arr6:[],
            
        }
    },
    methods: {
        // jump(e){
        // var url="sc_Index";
        // var foods=e.target.dataset.foods;
        // var how=e.target.dataset.how;
        // var obj={foods:foods,how:how};
        // this.axios.get(url,{params:obj}).then(res=>{
        //     if(res.data.code == -1){
        //         this.$toast("请再次点击");
        //     }else{
        //        var lunch=res.data.data;
        //        console.log(lunch);
        //     }
        // })
        // },
        eat1(e){
            var id=e.target.dataset.id;
            this.active=id;
        },
        eat2(e){
            var id=e.target.dataset.id;
            this.active=id;
        },
        eat3(e){
            var id=e.target.dataset.id;
            this.active=id;
        },
        eat4(e){
            var id=e.target.dataset.id;
            this.active=id;
        },
        eat5(e){
            var id=e.target.dataset.id;
            this.active=id;
        }
    },
    created() {
        var url="indexTop";
        var url2="indexBom";
        this.axios.get(url).then(res=>{
            this.arr=res.data.slice(0,2);
            this.arr3=res.data.slice(2,4);
            this.arr4=res.data.slice(4,6);
            this.arr5=res.data.slice(6,8);
            this.arr6=res.data.slice(8,10);

        })
        this.axios.get(url2).then(res=>{
            this.arr2=res.data;
        })
        
    },
    components:{
       carousel
    },
}
</script>
<style scoped>
@import url("../../assets/css/index.css");
</style>