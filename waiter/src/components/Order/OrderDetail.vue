<template>
  <v-card>
    <v-card-text>
      <p>Order ID: {{ order.order_id }}</p>
      <p>Start: {{ order.start }}$</p>
      <p>End: {{ order.end }}$</p>
      <p>Table ID: {{ order.table_id }}$</p>
    </v-card-text>
  </v-card>
</template>

<script>
export default {
  name: "OrderDetail",
  props: ["order"],
  data() {
    return {
      cart: this.$store.state.cart_drink,
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
  }
};
</script>

<style lang="scss" scoped>
.headline {
  color: black;
}
</style>
