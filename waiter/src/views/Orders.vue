<template>
  <v-container v-if="login" grid-list-lg>
    <h1 v-if="checking()">ORDERS</h1>
    <order-list :orders="allOrders"></order-list>
  </v-container>
</template>

<script>
import OrderList from "../components/Order/OrderList";
export default {
  name: "cart",
  components: {
    "order-list": OrderList
  },
  created() {
    this.$store.dispatch("allOrdersWithoutEnd");
  },
  computed: {
    allOrders() {
      return this.$store.getters.getAllOrdersWithoutEnd;
    },
    socketNewOrder() {
      console.log("There is new order! CHECK DB");
      return this.$store.getters.newOrderStatus;
    },
    login() {
      return this.$store.getters.getIsLogin;
    }
  },
  methods: {
    checking(){
      this.$store.state.checking = false;
      console.log("reseting...." + this.$store.state.checking)
      return true;
    }
  },
};
</script>
