import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

import About from '@/views/About.vue'
import Home from '@/views/Home.vue'
import Account from '@/views/Account.vue'

const routes = [
    {
        path: '/',
        name: 'Home',
        component: Home
    },
    {
        path: '/about',
        name: 'About',
        component: About
    },
    {
        path: '/account',
        name: 'Account',
        component: Account
    }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
