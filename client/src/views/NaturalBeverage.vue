<template>
  <v-container>
    <h1>DRINKS</h1>
    <product-list :products="allDrinks"></product-list>
  </v-container>
</template>

<script>
import ProductList from "@/components/Products/ProductList.vue";
export default {
  name: "NaturalBeverages",
  components: {
    "product-list": ProductList
  },
  created() {
    this.$store.dispatch("allNaturalBeverages"); //action; commit -> mutation
  },
  computed: {
    allDrinks() {
      return this.$store.getters.allNaturalBeverages;
    }
  }
};
</script>
