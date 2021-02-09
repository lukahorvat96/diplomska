<template>
  <v-container grid-list-lg>
    <div id="container">
      <h1>CART</h1>
    </div>
    <h3>Order number: {{ orderID }}</h3>
    <div v-if="emptyOrdersFoods">
      <v-divider />
      <h2>FOODS</h2>
      <product-list :products="allOrdersFoodsById" :colsNum="2"></product-list>
    </div>
  </v-container>
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
    emptyOrdersFoods() {
      if (this.$store.getters.allOrdersFoodsById.length != 0) return true;
      return false;
    },
    allOrdersFoodsById() {
      return this.$store.getters.allOrdersFoodsById;
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
h1 {
  margin-bottom: 0%;
  margin-left: 1%;
}
h2 {
  margin-left: 1%;
  margin-top: 1%;
}
h3 {
  margin-left: 1%;
  margin-top: 1%;
  margin-bottom: 1%;
}
.headline {
  color: black;
}
#container {
  height: 100%;
  width: 100%;
  display: flex;
}
</style>
