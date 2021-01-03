<template>
  <v-card>
    <v-card-text>
      <p>Order ID: {{ order.order_id }}</p>
      <p>Start: {{ order.start }}$</p>
      <p>End: {{ order.end }}$</p>
      <p>Table ID: {{ order.table_id }}$</p>
    </v-card-text>
    <router-link
      class="routerLink"
      :to="{ name: 'OrdersDetail', params: { orderID: order.order_id } }"
    >
      <v-btn elevation="2" color="red" tile>
        Check details
      </v-btn>
    </router-link>
  </v-card>
</template>

<script>
export default {
  name: "OrderDetail",
  props: ["order"]
};
</script>

<style lang="scss" scoped>
.headline {
  color: black;
}
.routerLink {
  text-decoration: none;
}
</style>
