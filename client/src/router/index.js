import Vue from "vue";
import VueRouter from "vue-router";
import Home from "@/views/Home.vue";
import Drink from "@/views/Drink";
import Cocktails from "@/views/Cocktails";
import BottledBeer from "@/views/Beers/BottledBeer";
import DraughtBeer from "@/views/Beers/DraughtBeer";
import Cider from "@/views/Beers/Cider";

import WhiteWine from "@/views/Wines/WhiteWine";
import OrangeWine from "@/views/Wines/OrangeWine";
import RoseWine from "@/views/Wines/RoseWine";
import RedWine from "@/views/Wines/RedWine";
import SparklingWine from "@/views/Wines/SparklingWine";


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
    path: "/BottledBeer",
    name: "BottledBeer",
    component: BottledBeer
  },
  {
    path: "/DraughtBeer",
    name: "DraughtBeer",
    component: DraughtBeer
  },
  {
    path: "/Cider",
    name: "Cider",
    component: Cider
  },
  {
    path: "/White",
    name: "WhiteWine",
    component: WhiteWine
  },
  {
    path: "/Orange",
    name: "OrangeWine",
    component: OrangeWine
  },
  {
    path: "/Rose",
    name: "RoseWine",
    component: RoseWine
  },
  {
    path: "/Red",
    name: "RedWine",
    component: RedWine
  },
  {
    path: "/Sparkling",
    name: "SparklingWine",
    component: SparklingWine
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
