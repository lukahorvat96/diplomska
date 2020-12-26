import Vue from "vue";
import VueRouter from "vue-router";
import Home from "@/views/Home.vue";
import Drink from "@/views/Drink";
import Cocktails from "@/views/Cocktails";
import Beers from "@/views/Beers";
import Cart from "@/views/Cart";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home
  },
  {
    path: "/drink",
    name: "Drink",
    component: Drink
  },
  {
    path: "/cocktail",
    name: "Cocktail",
    component: Cocktails
  },
  {
    path: "/beer",
    name: "Beer",
    component: Beers
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
