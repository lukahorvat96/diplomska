<template>
  <v-card>
    <v-card-subtitle>
      <h2>Order ID: {{ orderID }}</h2>
      total price: {{ totalPrice }}
    </v-card-subtitle>
    <v-divider></v-divider>
    <v-card-text>
      <h2>Drinks:</h2>
      <product-list :products="allOrdersDrinksById"></product-list>
    </v-card-text>

    <v-divider></v-divider>
    <v-card-text>
      <h2>Foods:</h2>
      <product-list :products="allOrdersFoodsById"></product-list>
    </v-card-text>

    <v-card-actions>
      <v-btn @click="updateOrder()" elevation="2" color="red" tile>
        UPDATE ORDER
      </v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
import ProductList from "@/components/Products/ProductList.vue";
export default {
  name: "OrderDetailById",
  props: {
    orderID: {
      type: Number,
      required: true
    }
  },
  components: {
    "product-list": ProductList
  },
  computed: {
    allOrdersProductById() {
      return this.$store.getters.allOrdersProductById;
    },
    allOrdersFoodsById() {
      return this.$store.getters.allOrdersFoodsById;
    },
    allOrdersDrinksById() {
      return this.$store.getters.allOrdersDrinksById;
    },
    totalPrice() {
      return this.$store.getters.totalPriceById;
    }
  },
  methods: {
    updateOrder() {
      this.$store.dispatch("updateOrderProductById", this.orderID);
    }
    // check() {
    //   if (this.$store.state.checking == false) {
    //     this.$store.dispatch("allOrdersProductById", this.orderID);
    //     console.log("CHAKING: " + this.$store.checking)
    //     this.$store.state.checking = true;
    //   }
    //   return true;
    // }
  }
};
</script>

<style lang="scss" scoped>
.headline {
  color: black;
}
</style>
