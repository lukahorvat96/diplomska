<template>
  <v-container v-if="login" grid-list-lg>
    <h1>ORDERS</h1>
    <v-divider />
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
      return this.$store.getters.newOrderStatus;
    },
    login() {
      return this.$store.getters.getIsLogin;
    }
  }
};
</script>
<style scoped>
h1 {
  margin-bottom: 2%;
  margin-left: 1%;
}
</style>
