<template>
  <v-card>
    <v-card-text>
      <p>Order ID: {{ order.order_id }}</p>
      <p>Start: {{ order.start }}$</p>
      <p>End: {{ order.end }}$</p>
      <p>Table ID: {{ order.table_id }}$</p>
    </v-card-text>
    <order-by-id :order_id="order.order_id"> MORE INFO </order-by-id>
  </v-card>
</template>

<script>
import OrderDetailById from "./OrderDetailById";
export default {
  name: "OrderDetail",
  props: ["order"],
  components: {
    "order-by-id": OrderDetailById
  }
};
</script>

<style lang="scss" scoped>
.headline {
  color: black;
}
</style> 
