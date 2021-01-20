<template>
  <v-card class="yellow_back">
    <v-card-text>
      <p>Order ID: {{ order.order_id }}</p>
      <p>Start: {{ order.start }}$</p>
      <p>End: {{ order.end }}$</p>
      <p>Order status: {{ order.order_status }}
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
  <!-- <v-card :loading="loading ? 'blue': null">
    <template slot="progress">
      <v-progress-linear color="blue" indeterminate></v-progress-linear>
    </template> -->
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

.yellow_back {
  color: yellow;
  elevation: 5;
}
</style>
