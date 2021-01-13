<template>
  <v-container grid-list-lg>
    <h1>ORDERS</h1>
    <order-list v-if="checkOrders" :orders="allOrders"></order-list>
    <h1>RETURN: {{ socketNewOrder }}</h1>
  </v-container>
</template>

<script>
import OrderList from "../components/Order/OrderList";
export default {
  name: "cart",
  components: {
    "order-list": OrderList
  },
  data() {
    return {
      orders: [],
      response: ""
    };
  },
  created() {
    this.$store.dispatch("allOrdersWithoutEnd");
    this.orders = this.$store.getters.getAllOrdersWithoutEnd;
  },
  computed: {
    allOrders() {
      return this.$store.getters.getAllOrdersWithoutEnd;
    },
    socketNewOrder() {
      console.log("There is new order! CHECK DB");
      return this.$store.getters.newOrderStatus;
    }
  },
  methods: {
    checkOrders() {
      if (this.orders.lenght < 1) return false;
      return true;
    },
    returnValue() {
      var value = this.socketNewOrder();
      return value;
    }
  }
};
</script>
