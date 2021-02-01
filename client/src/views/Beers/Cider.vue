<template>
  <v-container>
    <h1>BEERS</h1>
    <product-list :products="allCider"></product-list>
  </v-container>
</template>

<script>
import ProductList from "@/components/Products/ProductList.vue";
export default {
  name: "Cider",
  components: {
    "product-list": ProductList
  },
  created() {
    this.$store.dispatch("allCider"); //action; commit -> mutation
  },
  computed: {
    allCider() {
      return this.$store.getters.allCider;
    }
  }
};
</script>
