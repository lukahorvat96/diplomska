import Vue from "vue";
import VueRouter from "vue-router";
import Home from "@/views/Home.vue";

//DRINKs
import Drink from "@/views/Drink";
import BottledBeer from "@/views/Beers/BottledBeer";
import DraughtBeer from "@/views/Beers/DraughtBeer";
import Cider from "@/views/Beers/Cider";
import Wine from "@/views/Wine";
import HotDrink from "@/views/HotDrink";
import BottledBeverage from "@/views/BottledBeverage";
import NaturalBeverage from "@/views/NaturalBeverage";
import Gin from "@/views/Gin";
import Vodka from "@/views/Vodka";

//FOODs
import Food from "@/views/Food";
import Starter from "@/views/Starter";
import Soup from "@/views/Soup";
import Salad from "@/views/Salad";
import Pasta from "@/views/Pasta";
import Rissoto from "@/views/Rissoto";
import Pizza from "@/views/Pizza";
import Meat from "@/views/Meat";
import PadThai from "@/views/PadThai";

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
    path: "/bottledbeer",
    name: "BottledBeer",
    component: BottledBeer
  },
  {
    path: "/draughtbeer",
    name: "DraughtBeer",
    component: DraughtBeer
  },
  {
    path: "/cider",
    name: "Cider",
    component: Cider
  },
  {
    path: "/whine",
    name: "Wine",
    component: Wine
  },
  {
    path: "/hotdrink",
    name: "HotDrink",
    component: HotDrink
  },
  {
    path: "/bottledbeverage",
    name: "BottledBeverage",
    component: BottledBeverage
  },
  {
    path: "/naturalbeverage",
    name: "NaturalBeverage",
    component: NaturalBeverage
  },
  {
    path: "/gin",
    name: "Gin",
    component: Gin
  },
  {
    path: "/vodka",
    name: "Vodka",
    component: Vodka
  },
  {
    path: "/food",
    name: "Food",
    component: Food
  },
  {
    path: "/starter",
    name: "Starter",
    component: Starter
  },
  {
    path: "/soup",
    name: "Soup",
    component: Soup
  },
  {
    path: "/salad",
    name: "Salad",
    component: Salad
  },
  {
    path: "/pasta",
    name: "Pasta",
    component: Pasta
  },
  {
    path: "/salad",
    name: "Salad",
    component: Salad
  },
  {
    path: "/rissoto",
    name: "Rissoto",
    component: Rissoto
  },
  {
    path: "/pizza",
    name: "Pizza",
    component: Pizza
  },
  {
    path: "/meat",
    name: "Meat",
    component: Meat
  },
  {
    path: "/padthai",
    name: "PadThai",
    component: PadThai
  },
  {
    path: "/cart",
    name: "Cart",
    component: Cart
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

export default router;
