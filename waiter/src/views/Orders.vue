<template>
  <v-container grid-list-lg>
    <h1>ORDERS</h1>
    <order-list v-if="checkOrders" :orders="allOrders"></order-list>
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
      console.log(this.$store.getters.getAllOrdersWithoutEnd);
      return this.$store.getters.getAllOrdersWithoutEnd;
    }
  },
  methods: {
    checkOrders() {
      if (this.orders.lenght < 1) return false;
      return true;
    }
  }
};
</script>
