import Vue from "vue";
import VueRouter from "vue-router";
import Beers from "@/views/Home";
import Order from "@/views/Orders";
import OrderDetailById from "@/components/Order/OrderDetailById";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Beers
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
  }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

export default router;
