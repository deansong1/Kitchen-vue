import Vue from 'vue'
import Router from 'vue-router'

//#为Exam01.vue 组件指定访问路径

import sc_Login from "./components/sc/sc_Login.vue"
import scIndex from "./components/sc/scIndex.vue"
import sc_type from "./components/sc/sc_type"
import sc_type2 from "./components/sc/sc_type2"
import sc_type3 from "./components/sc/sc_type3"
import sc_food_therapy from "./components/sc/sc_food_therapy.vue"
import sc_detail from "./components/sc/sc_detail.vue"
import sc_Rank from "./components/sc/sc_Rank.vue"
import sc_reg from "./components/sc/sc_reg.vue"
import sc_Admin from './components/sc/sc_Admin.vue'
import sc_Check from './components/sc/sc_Check.vue'
import sc_collect from './components/sc/sc_collect.vue'
import sc_question from './components/sc/sc_question.vue'
import scHome from './components/sc/scHome.vue'
import TabBarIcon from './components/sc/TabBarIcon.vue'
import sc_answer from './components/sc/sc_answer.vue'
import Carousel from './components/sc/Carousel.vue'
import Myquestion from './components/sc/Myquestion.vue'
import Answer from './components/sc/Answer.vue'

Vue.use(Router)
export default new Router({
  routes: [
    //组件访问路径    组件名
    {path:'/Answer',component:Answer},
    {path:'/Myquestion',component:Myquestion},
    {path:'/Carousel',component:Carousel},
    {path:'/sc_answer/:qid',component:sc_answer,props:true},
    {path:'/TabBarIcon',component:TabBarIcon},
    {path:'/scHome',component:scHome},
    {path:'/sc_question',component:sc_question},
    {path:'/sc_collect',component:sc_collect},
    {path:'/sc_Check',component:sc_Check},
    {path:'/sc_Admin',component:sc_Admin},
    {path:'/sc_reg',component:sc_reg},
    {path:'/sc_Rank',component:sc_Rank},
    {path:'/sc_detail/:uid',component:sc_detail,props:true},
    {path:'/sc_type3',component:sc_type3},
    {path:'/sc_food_therapy',component:sc_food_therapy},
    {path:'/sc_type',component:sc_type},
    {path:'/sc_type2',component:sc_type2},
    {path:'/scIndex',component:scIndex},
    {path:'/sc_Login',component:sc_Login}
  ]
})
