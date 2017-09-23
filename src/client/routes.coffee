import VueRouter from 'vue-router'
import Content from './components/content.vue'
import AddCaseContent from './components/add_case/content.vue'

routes = [
  {path: '/', component: Content}
  {path: '/add_case', component: AddCaseContent}
]

router = new VueRouter({routes})

export default router