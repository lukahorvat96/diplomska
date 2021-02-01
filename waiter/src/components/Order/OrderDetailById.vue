<template>
  <v-card>
    <h1>Order ID: {{ orderID }}</h1>
    <v-card-text>
      <product-list :products="allOrdersProductById"></product-list>
      <v-btn elevation="2" color="red" tile>
        END ORDER
      </v-btn>
    </v-card-text>
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
  created() {
    this.$store.dispatch("allOrdersProductById", this.orderID); //action; commit -> mutation
  },
  computed: {
    allOrdersProductById() {
      console.log(this.$store.getters.allOrdersProductById)
      return this.$store.getters.allOrdersProductById;
    }
  }
};
</script>

<style lang="scss" scoped>
.headline {
  color: black;
}
</style>
