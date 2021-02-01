<template>
  <v-container>
    <h1>Draught Beers</h1>
    <product-list :products="allDraughtBeers"></product-list>
  </v-container>
</template>

<script>
import ProductList from "@/components/Products/ProductList.vue";
export default {
  name: "DraughtBeer",
  components: {
    "product-list": ProductList
  },
  created() {
    this.$store.dispatch("allDraughtBeers"); //action; commit -> mutation
  },
  computed: {
    allDraughtBeers() {
      return this.$store.getters.allDraughtBeers;
    }
  }
};
</script>
