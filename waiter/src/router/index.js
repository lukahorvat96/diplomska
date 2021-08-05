import Vue from "vue";
import VueRouter from "vue-router";
import Home from "@/views/Home";
import Order from "@/views/Orders";
import OrderDetailById from "@/components/Order/OrderDetailById";
import OrderFood from "@/views/OrdersFood";
import OrderFoodDetailById from "@/components/OrderFood/OrderDetailById";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home
  },
  {
    path: "/orders",
    name: "Orders",
    component: Order
  },
  {
    path: "/orders/:orderID",
    name: "OrdersDetail",
    component: OrderDetailById,
    props: true
  },
  {
    path: "/ordersfood",
    name: "OrdersFood",
    component: OrderFood
  },
  {
    path: "/ordersfood/:orderID",
    name: "OrdersFoodDetail",
    component: OrderFoodDetailById,
    props: true
  }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

export default router;
