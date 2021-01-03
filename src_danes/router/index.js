import Vue from "vue";
import VueRouter from "vue-router";
import Home from "@/views/Home.vue";
import Cart from "@/views/Cart";
import DrinkType from "@/views/DrinkType";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home
  },
  {
    path: "/drinktype/:drinkTypeID",
    name: "DrinkType",
    component: DrinkType,
    props: true
  },
  {
    path: "/cart",
    name: "Cart",
    component: Cart
  }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

export default router;
