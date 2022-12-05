import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
    meta: {
      header: 1
    }
  },
  {
    path: '/auth',
    name: 'Auth',
    component: () => import('../views/Auth.vue'),
    meta: {
      header: 1
    }
  },
  {
    path: '/reg',
    name: 'Reg',
    component: () => import('../views/Reg.vue'),
    meta: {
      header: 1
    }
  },
  {
    path: '/materials',
    name: 'Materials',
    component: () => import('../views/chooseMaterials.vue'),
    meta: {
      header: 1
    }
  },
  {
    path: '/test/:id',
    name: 'Test',
    component: () => import('../views/Test.vue'),
    meta: {
      header: 1
    }
  },
  {
    path: '/profile',
    name: 'Profile',
    component: () => import('../views/Profile.vue'),
    meta: {
      header: 1
    }
  },
  {
    path: '/news',
    name: 'News',
    component: () => import('../views/News.vue'),
    meta: {
      header: 1
    }
  },
  {
    path: "/:catchAll(.*)",
    name: "NotFound",
    component: () => import('../views/NotFound.vue'),
    meta: {
      header: 1
    }
  },
  {
    path: '/super/admin/:id',
    name: 'Admin',
    component: () => import('../views/Admin/Admin.vue'),
    meta: {
      header: 2
    }
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router