<template>
  <v-card class="yellow_back">
    <v-card-text>
      <h3>Order ID: {{ order.order_id }}</h3>
      <p>Start: {{ order.order_start }} </p>
      <p class="font-weight-black">Order status: {{ order.order_status }}</p>
      <p>Table ID: {{ order.table_id }}$</p>
    </v-card-text>
    <router-link
      class="routerLink"
      :to="{ name: 'OrdersDetail', params: { orderID: order.order_id } }"
    >
      <v-btn 
      class="mr-2" elevation="2" color="green" tile>
        Check details
      </v-btn>
    </router-link>
    <v-btn
      class="mr-2"
      v-show="orderStatus"
      v-on:click="updateOrderStatus()"
      elevation="2"
      color="blue"
      tile
    >
      {{ showServed() }}
    </v-btn>
    <v-btn  v-on:click="endOrder()" elevation="2" color="red" tile>
      PRINT THE RECEPIE
    </v-btn>
  </v-card>
  <!-- <v-card :loading="loading ? 'blue': null">
    <template slot="progress">
      <v-progress-linear color="blue" indeterminate></v-progress-linear>
    </template> -->
</template>

<script>
export default {
  name: "OrderDetail",
  props: ["order"],
  data() {
    return {
      order1: this.order
    };
  },
  computed: {
    orderStatus() {
      if (
        this.order.order_status == "Not served" ||
        this.order.order_status == "Order updated"
      )
        return true;
      else return false;
    }
  },
  methods: {
    showServed() {
      if (
        this.order.order_status == "Not served" ||
        this.order.order_status == "Order updated"
      )
        return "SERVED";
      else return "DREK";
    },
    updateOrderStatus() {
      if (
        this.order.order_status == "Not served" ||
        this.order.order_status == "Order updated"
      )
        this.$store.dispatch("updateOrderStatus", this.order.order_id);
    },
    endOrder(){
      this.$store.dispatch("endOrder", this.order.order_id)
    }
  }
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
