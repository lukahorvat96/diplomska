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
    this.$store.dispatch("allOrders");
    this.orders = this.$store.getters.getAllOrders;
  },
  computed: {
    allOrders() {
      console.log(this.$store.getters.getAllOrders);
      
      return this.$store.getters.getAllOrders;
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
