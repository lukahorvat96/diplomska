<template>
  <v-card>
    <h1>HI </h1>
    <v-card-text>
      <p>Order ID: {{ order_id }}</p>
    </v-card-text>
  </v-card>
</template>

<script>
export default {
  name: "OrderDetailById",
  props: ["order_id"],
  data() {
    return {
      quantity: 0
    };
  },
  computed: {
    isNotInCart() {
      const index = this.$store.state.cart_drink.findIndex(
        p => p.drink_id === this.drink.drink_id
      );
      if (index < 0) return true;
      return false;
    }
  },
  methods: {
    orderDrinks(order_id){
       this.$store.dispatch("allOrdersDrinkById", order_id);
    }
  }
};
</script>

<style lang="scss" scoped>
.headline {
  color: black;
}
</style>
