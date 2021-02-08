<template>
  <v-card class="yellow_back">
    <v-card-text>
      <h3>Order number: {{ order.order_id }}</h3>
      <p>Start: {{ order.order_start }}</p>
      <p class="font-weight-black">Order status: {{ order.order_status }}</p>
      <p class="font-weight-black">Cook status: {{ order.cook_status }}</p>
      <p>Table ID: {{ order.table_id }}</p>
    </v-card-text>
    <router-link
      class="routerLink"
      :to="{
        name: 'OrdersDetail',
        params: { orderID: order.order_id }
      }"
    >
      <v-btn @click="update()" class="mr-2" elevation="2" color="green" tile>
        Check details
      </v-btn>
    </router-link>
    <v-btn
      class="mr-2"
      v-show="orderStatusServed"
      v-on:click="updateOrderStatus()"
      elevation="2"
      color="blue"
      tile
    >
      {{ showServed() }}
    </v-btn>
    <v-btn v-on:click="endOrder()" elevation="2" color="red" tile>
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
    orderStatusServed() {
      console.log("STATUS: " + this.order.order_status);
      if (
        // this.order.order_status == "Not served" ||
        this.order.order_status == "CONFIRMED" ||
        this.order.order_status == "PLACED" ||
        this.order.order_status == "UPDATED" ||
        this.order.order_status == "CALLING WAITER" 
      )
        return true;
      else return false;
    }
  },
  methods: {
    showServed() {
      if (
        this.order.order_status == "PLACED" ||
        this.order.order_status == "UPDATED" ||
        this.order.order_status == "UPDATED" ||
        this.order.order_status == "CALLING WAITER" 
      )
        return "CONFIRM";
      if (this.order.order_status == "CONFIRMED") return "SERVED";
      else return "";
    },
    updateOrderStatus() {
      if (
        this.order.order_status == "PLACED" ||
        this.order.order_status == "UPDATED" ||
        this.order.order_status == "UPDATED" ||
        this.order.order_status == "CALLING WAITER"
      ) {
        const latest = {
          order_id: this.order.order_id,
          order_status: "CONFIRMED"
        };
        this.$store.dispatch("updateOrderStatus", latest);
      }
      if (this.order.order_status == "CONFIRMED") {
        const latest = {
          order_id: this.order.order_id,
          order_status: "SERVED"
        };
        this.$store.dispatch("updateOrderStatus", latest);
      }
    },
    endOrder() {
      this.$store.dispatch("endOrder", this.order.order_id);
    },
    update() {
      this.$store.dispatch("allOrdersProductById", this.order.order_id); //action; commit -> mutation
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
