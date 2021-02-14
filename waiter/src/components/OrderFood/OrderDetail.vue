<template>
  <v-card elevation="10" tile class="yellow_back">
    <v-card-text>
      <h3>Order number: {{ order.order_id }}</h3>
      <p>Start: {{ order.order_start }}</p>
      <p class="font-weight-black">Chef status: {{ order.cook_status }}</p>
      <p>Table ID: {{ order.table_id }}</p>
    </v-card-text>
    <router-link
      class="routerLink"
      :to="{
        name: 'OrdersFoodDetail',
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
    <v-btn
      class="mr-2"
      v-show="orderStatusSNotConfirmed"
      v-on:click="updateOrderStatusUnconfirm()"
      elevation="2"
      color="red"
      tile
    >
      UNCONFIRM
    </v-btn>
    <!-- <v-btn v-on:click="endOrder()" elevation="2" color="red" tile>
      ORDER DONE
    </v-btn> -->
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
        this.order.cook_status == "" ||
        this.order.cook_status == "CONFIRMED" ||
        this.order.cook_status == "UPDATED"
      )
        return true;
      else return false;
    },
    orderStatusSNotConfirmed() {
      console.log("STATUS: " + this.order.order_status);
      if (
        // this.order.order_status == "Not served" ||
        this.order.cook_status == "" ||
        this.order.cook_status == "UPDATED"
      )
        return true;
      else return false;
    }
  },
  methods: {
    showServed() {
      if (this.order.cook_status == "" || this.order.cook_status == "UPDATED")
        return "CONFIRM";
      if (this.order.cook_status == "CONFIRMED") return "DONE";
      else return "";
    },
    updateOrderStatus() {
      if (this.order.cook_status == "" || this.order.cook_status == "UPDATED") {
        const latest = {
          order_id: this.order.order_id,
          cook_status: "CONFIRMED"
        };
        this.$store.dispatch("updateOrderCookStatus", latest);
      }
      if (this.order.cook_status == "CONFIRMED") {
        const latest = {
          order_id: this.order.order_id,
          cook_status: "DONE"
        };
        this.$store.dispatch("updateOrderCookStatus", latest);
      }
    },
    updateOrderStatusUnconfirm() {
      const latest = {
        order_id: this.order.order_id,
        cook_status: "UNCONFIRMED"
      };
      this.$store.dispatch("updateOrderCookStatus", latest);
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
